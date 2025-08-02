package com.javaweb.entity;

import javax.persistence.*;


@Entity
@Table(name = "transaction")
public class TransactionEntity extends BaseEntity{
    @Column(name = "code")
    private String code;

    @Column(name = "note")
    private String note;

    @Column(name = "staffid")
    private Long staffId;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customerEntity;


    @PrePersist
    public void prePersist(){
        if(this.getId()==null){
            this.setModifiedDate(null);
            this.setModifiedBy(null);
        }
    }
    public CustomerEntity getCustomerEntity() {
        return customerEntity;
    }

    public void setCustomerEntity(CustomerEntity customerEntity) {
        this.customerEntity = customerEntity;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }
}
