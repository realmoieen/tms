/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.repositories;

import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import java.util.List;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Moieen Abbas
 */
public interface CustomerRepository extends DataTablesRepository<Customer, Long> {

    String FIND_ALL_CUTOMER_PROJECTION = "SELECT c.customerId,c.address,c.asteen,c.chest,c.cnic,c.collerOrBan,c.collerOrBanSize,c.collerOrBanWidth,c.createdAt,c.customerName,c.daman,c.frontPati,c.frontPocket,c.frontPocket,c.kaaf,c.khulla,c.lambai,c.lastUpdatedAt,c.panja,c.phoneNo,c.shalwar,c.shalwarPocket,c.sidePocket,c.teera,c.createdBy,c.lastUpdatedBy FROM Customer as c";
    String FIND_ALL_PAGINATION = "SELECT c.customerId as customerId,c.customerName as customerName,c.cnic as cnic,c.phoneNo as phoneNo,c.address as address,c.createdAt as createdAt,c.createdBy.userName as createdBy,c.lastUpdatedAt as lastUpdatedAt,c.lastUpdatedBy.userName as lastUpdatedBy FROM Customer as c";

    Customer findByCustomerId(Long customerId);

    Customer findByCustomerName(String customerId);

    List<CustomerDTO> findByCustomerNameContains(String customerId);

    @Query("select c from Customer as c")
    List<CustomerDTO> findAllCutomer();
//
////    @Query(FIND_ALL_PAGINATION)
//    @Override
//    Page<Customer> findAll(Pageable page);
//
    @Query(FIND_ALL_PAGINATION)
    List<Customer> findAllCustomers();
//    
////    @Query(FIND_ALL_PAGINATION)
//    Page<Customer> findAll(Specification<Customer> specification, Pageable pageable);
}
