/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.services;

import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

/**
 *
 * @author Moieen Abbas
 */
public interface CustomerService {

    boolean save(Customer customer);

    boolean insertNew(Customer customer);

    boolean update(Customer customer);

    boolean delete(Long id);

    Page<Customer> findAll(Pageable pageable);

    List<Customer> findAll();

    long count();

    /**
     * This will load only customer specific column like name phone and etc.
     *
     * @return
     */
    List<Customer> findCustomers();

    List<CustomerDTO> findAllCustomersView();

    Page<Customer> findAllPagination(Pageable page);

    Page<Customer> findAll(Specification<Customer> specification, Pageable pageable);

    public boolean update(CustomerDTO customerForm) throws Exception;
}
