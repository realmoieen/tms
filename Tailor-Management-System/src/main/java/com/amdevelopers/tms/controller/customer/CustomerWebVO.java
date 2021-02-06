/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.controller.customer;

import com.amdevelopers.tms.controller.CommonWebVO;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import java.util.List;

/**
 *
 * @author Moieen Abbas
 */
public class CustomerWebVO extends CommonWebVO {

    private List<CustomerDTO> list_customers;

    public CustomerWebVO() {
    }

    public List<CustomerDTO> getList_customers() {
        return list_customers;
    }

    public void setList_customers(List<CustomerDTO> list_customers) {
        this.list_customers = list_customers;
    }

}
