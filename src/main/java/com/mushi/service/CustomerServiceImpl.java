package com.mushi.service;

import com.mushi.dao.CustomerDao;
import com.mushi.pojo.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    public List<Customer> findAllCustomer() {
        return this.customerDao.findAllCustomer();
    }

    public Customer findCustomerById(Integer id) {
        Customer customer = customerDao.findCustomerById(id);
        return customer;
    }

    public void addCustomer(Customer customer){
        this.customerDao.addCustomer(customer);
    }

    public void delCustomer(Integer id){
        this.customerDao.delCustomer(id);
    }

    public void updCustomer(Customer customer){
        this.customerDao.updCustomer(customer);
    }
}
