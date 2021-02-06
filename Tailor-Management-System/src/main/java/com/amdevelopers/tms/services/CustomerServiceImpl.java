/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.services;

import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import com.amdevelopers.tms.repositories.CustomerRepository;
import com.amdevelopers.tms.repositories.UserRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

/**
 *
 * @author Moieen Abbas
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    private ConsoleLogger logger = new ConsoleLogger(this.getClass());
    @Autowired
    CustomerRepository customerRepo;

    @Autowired
    UserRepository userRepo;

    @Override
    public boolean save(Customer customer) {
        customerRepo.save(customer);
        return true;
    }

    @Override
    public boolean delete(Long id) {
        Optional<Customer> customer = customerRepo.findById(id);
        if (customer.isPresent()) {
            logger.logDebug("deleting customer with Id:" + id);
            customerRepo.delete(customer.get());
        } else {
            logger.logDebug("Customer is not found with Id:" + id);
        }

        return true;
    }

    @Override
    public boolean insertNew(Customer customer) {
        customer.setCreatedAt(new Date());
        customer.setCreatedBy(userRepo.findByUserName(UserDetailsServiceImpl.findLoggedInUserName()));
        customerRepo.save(customer);
        return true;
    }

    @Override
    public boolean update(Customer customer) {
        customer.setLastUpdatedAt(new Date());
        customer.setLastUpdatedBy(userRepo.findByUserName(UserDetailsServiceImpl.findLoggedInUserName()));
        customerRepo.save(customer);
        return true;
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return customerRepo.findAll(pageable);
    }

    @Override
    public long count() {
        return customerRepo.count();
    }

    @Override
    public List<Customer> findAll() {
        return customerRepo.findAllCustomers();
    }

    @Override
    public List<Customer> findCustomers() {
        return customerRepo.findAllCustomers();
    }

    @Override
    public List<CustomerDTO> findAllCustomersView() {
        return customerRepo.findAllCutomer();
    }

    @Override
    public Page<Customer> findAllPagination(Pageable page) {
        return customerRepo.findAll(page);
    }

    @Override
    public Page<Customer> findAll(Specification<Customer> specification, Pageable pageable) {
        return customerRepo.findAll(specification, pageable);
    }

    @Override
    public boolean update(CustomerDTO customerForm) throws Exception {
        Customer obj_customer = customerRepo.findByCustomerId(customerForm.getCustomerId());
        if (obj_customer == null) {
            throw new Exception("Invalid customer record to update.record not found");
        } else {
            Customer updatedCustomer = CustomerDTO.convertDtoToCustomer().apply(customerForm, obj_customer);
            return update(updatedCustomer);
        }
    }

}
