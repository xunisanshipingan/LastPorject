package com.mushi.dao;

import com.mushi.pojo.Customer;

import java.util.List;

public interface CustomerDao {
    public List<Customer> findAllCustomer();
    public Customer findCustomerById(Integer id);
    public void addCustomer(Customer customer);
    public void delCustomer(Integer id);
    public void updCustomer(Customer customer);
}
