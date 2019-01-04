package com.mushi.controller;

import com.mushi.pojo.Customer;
import com.mushi.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/findAllCustomer.action")
    public String findAllCustomer(Model model) {
        List<Customer> list = customerService.findAllCustomer();

        model.addAttribute("list",list);

        return "customer";
    }

    @RequestMapping("/customer/addCustomer.action")
    @ResponseBody
    public String addCustomer(String username,String jobs,String phone){
        Customer customer = new Customer();
        customer.setUsername(username);
        customer.setJobs(jobs);
        customer.setPhone(phone);
        customerService.addCustomer(customer);
        return "OK";
    }

    @RequestMapping("/customer/delCustomer.action")
    @ResponseBody
    public String delCustomer(Integer id){
        customerService.delCustomer(id);
        return "OK";
    }

    @RequestMapping("/customer/findCustomerById.action")
    @ResponseBody
    public Customer findCustomerById(Integer id){
        Customer customer = customerService.findCustomerById(id);
        return customer;
    }

    @RequestMapping("/customer/updCustomer.action")
    @ResponseBody
    public String updCustomer(Customer customer){
        customerService.updCustomer(customer);
        return "OK";
    }
}
