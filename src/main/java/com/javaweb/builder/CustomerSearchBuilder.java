package com.javaweb.builder;

public class CustomerSearchBuilder {
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;

    public CustomerSearchBuilder(CustomerBuilder builder){
        this.fullName = builder.customerName;
        this.email = builder.email;
        this.phone = builder.phone;
        this.staffId = builder.staffId;
    }
    public String getName() {
        return fullName;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Long getStaffId() {
        return staffId;
    }

    public static class CustomerBuilder{
        private String customerName;
        private String phone;
        private String email;
        private Long staffId;
        public CustomerBuilder setCustomerName(String customerName){
            this.customerName = customerName;
            return this;
        }
        public CustomerBuilder setPhone(String phone){
            this.phone = phone;
            return this;
        }
        public CustomerBuilder setEmail(String email){
            this.email = email;
            return this;
        }
        public CustomerBuilder setStaffId(Long staffId){
            this.staffId = staffId;
            return this;
        }
        public CustomerSearchBuilder build(){
            return new CustomerSearchBuilder(this);
        }
    }
}
