package com.javaweb.repository.custom.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    private void joinTable(CustomerSearchBuilder builder,StringBuilder sql){
        Long staffId = builder.getStaffId();
        if(staffId!=null){
            sql.append(" inner join assignmentcustomer as ac on c.id = ac.customerid");
        }
    }

    private void queryNomal(CustomerSearchBuilder builder,StringBuilder where){
        try {
            Field[] fields = CustomerSearchBuilder.class.getDeclaredFields();
            for(Field item : fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                Object value = item.get(builder);
                if(!fieldName.equals("staffId")){
                    if(value!=null&&value!=""){
//                        if(item.getType().equals("java.lang.String")&&!value.toString().equals("")){
                        where.append(" and c."+fieldName.toLowerCase()+" like '%"+value+"%' ");
//                        }
                    }
                }else{
                    if(value!=null){
                        where.append(" and ac."+fieldName.toLowerCase()+" = "+value);
                    }
                }
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    private String existCustomer(){
        StringBuilder sql = new StringBuilder(" and c.is_active = 1 ");
        return sql.toString();
    }

    @Override
    public List<CustomerEntity> searchCustomers(CustomerSearchBuilder customerSearchBuilder) {
        StringBuilder sql = new StringBuilder("Select c.* from customer as c ");
        joinTable(customerSearchBuilder,sql);
        sql.append(SystemConstant.ONE_EQUAL_ONE);
        sql.append(existCustomer());
        queryNomal(customerSearchBuilder,sql);
        sql.append(" \ngroup by c.id ");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        List<CustomerEntity> results = query.getResultList();
        return results;
    }

    @Override
    public int countTotalItems() {
        StringBuilder sql = new StringBuilder("Select * from customer");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        List<CustomerEntity> list = query.getResultList();
        return list.size();
    }
    @Override
    public Page<CustomerEntity> searchCustomers(CustomerSearchBuilder customerSearchBuilder, Pageable pageable) {
        StringBuilder sql = new StringBuilder("Select c.* from customer as c ");
        joinTable(customerSearchBuilder,sql);
        sql.append(SystemConstant.ONE_EQUAL_ONE);
        sql.append(existCustomer());
        queryNomal(customerSearchBuilder,sql);
        sql.append(" \ngroup by c.id ");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        List<CustomerEntity> results = query.setFirstResult((int)pageable.getOffset())
                .setMaxResults(pageable.getPageSize())
                .getResultList();
        return new PageImpl<>(results,pageable,countTotalItems());
    }

}
