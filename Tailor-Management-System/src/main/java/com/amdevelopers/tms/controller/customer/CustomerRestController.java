/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.controller.customer;

import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import com.amdevelopers.tms.repositories.CustomerRepository;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Moieen Abbas
 */
@RestController
public class CustomerRestController {

    private final ConsoleLogger logger = new ConsoleLogger(this.getClass());

    @Autowired
    CustomerRepository customerRepo;

    @RequestMapping(value = "/customers/data", method = RequestMethod.POST)
    public DataTablesOutput<CustomerDTO> getCustomerData(@Valid @RequestBody DataTablesInput input) {
        return customerRepo.findAll(input, CustomerDTO.getConverter());
    }

    @RequestMapping(value = "/customers/get", method = RequestMethod.GET)
    public CustomerDTO getCustomer(@Valid @RequestParam(name = "customerId", required = true) Long customerId) throws Exception {
        try {
            Customer obj_customer = customerRepo.findByCustomerId(customerId);
            if (null != obj_customer) {
                return CustomerDTO.getConverter().apply(obj_customer);
            } else {
                throw new Exception("Required customer not found with Id:" + String.valueOf(customerId));
            }
        } catch (Exception e) {
            logger.logExecption(e.getMessage(), e);
            throw e;
        }
    }

}
