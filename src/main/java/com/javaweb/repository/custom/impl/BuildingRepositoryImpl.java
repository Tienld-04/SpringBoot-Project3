package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null){
            sql.append(" inner join assignmentbuilding on b.id = assignmentbuilding.buildingId");
        }
    }

    public static void queryNomal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
            try{
                Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
                for(Field i : fields){
                    i.setAccessible(true);
                    String fieldName = i.getName();
                    if(!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("rentArea") && !fieldName.startsWith("rentPrice") ){
                        Object value = i.get(buildingSearchBuilder);
                        if(value != null){
                            if(i.getType().getName().equals("java.lang.String") && !value.toString().equals("")){
                                where.append(" and b."+ fieldName.toLowerCase() +" like '%"+value+"%'");
                            }
                            if(i.getType().getName().equals("java.lang.Integer") || i.getType().getName().equals("java.lang.Long")){
                                where.append(" and b."+ fieldName.toLowerCase() + " ="+ value);
                            }
                        }
                    }

                }
            }catch (Exception e){
                e.printStackTrace();
            }
    }

    public static void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        Long rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getRentAreaTo();
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        Long staffId = buildingSearchBuilder.getStaffId();
        List<String> typeCode = buildingSearchBuilder.getTypeCode();

        if(staffId != null){
            where.append(" and assignmentbuilding.staffid = " + staffId);
        }
        //
//        if(typeCode != null && typeCode.size() > 0){
//            where.append(" and b.type in( ");
//            String query = typeCode.stream().map(it-> "'" + it + "'").collect(Collectors.joining(",")); //  "'nguyen-can','tang-tret'"
//            where.append(query);
//            where.append( ") ");
//        }
        if (typeCode != null && !typeCode.isEmpty()) {
            for (String type : typeCode) {
                where.append(" AND b.type LIKE '%").append(type).append("%'");
            }
        }
        //
        if(rentPriceFrom != null){
            where.append(" and b.rentprice >= " + rentPriceFrom);
        }
        if(rentPriceTo != null){
            where.append(" and b.rentprice <= " + rentPriceTo);
        }
        //
        if(rentAreaFrom != null || rentAreaTo != null){
//            where.append(" and exists (select * from rentarea as r where b.id = r.buildingId"); Dùng cái này phải thêm gom nhóm ở bên dưới nhé:)
//            if(rentAreaFrom != null){
//                where.append(" and r.value >= " + rentAreaFrom);
//            }
//            if(rentAreaTo != null){
//                where.append(" and r.value <= " + rentAreaTo);
//            }
//            where.append(") ");
//            -----------------
            if(rentAreaFrom != null){
                where.append(" and b.floorarea >= " + rentAreaFrom);
            }
            if(rentAreaTo != null){
                where.append(" and b.floorarea <= " + rentAreaTo);
            }
        }


    }
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> getBuildings(BuildingSearchBuilder buildingSearchBuilder) {
        StringBuilder sql = new StringBuilder("select b.* from building as b");
        joinTable(buildingSearchBuilder,sql);
        StringBuilder where = new StringBuilder(" where 1=1");
        queryNomal(buildingSearchBuilder,where);
        querySpecial(buildingSearchBuilder,where);
//        where.append(" group by b.id");
        sql.append(" " + where.toString());
        System.out.println(sql.toString());
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }
}


