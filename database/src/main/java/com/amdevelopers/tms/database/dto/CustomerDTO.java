/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.database.dto;

import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.util.Util;
import java.util.function.BiFunction;
import java.util.function.Function;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Moieen Abbas
 */
@Setter
@Getter
public class CustomerDTO {

    private Long customerId;

    private String customerName;
    private String cnic;
    private String phoneNo;

    private String address;

    private String createdAt;

    private String createdBy;

    private String lastUpdatedAt;

    private String lastUpdatedBy;

    private Double lambai;

    private Double asteen;

    private Double teera;

    private Double chest;

    private Double collerOrBanSize;

    private Double khulla;

    private Double shalwar;

    private Double panja;

    private String daman;

    private Boolean frontPocket;

    private Double frontPocketSize;

    private Integer sidePocket;

    private Double frontPati;

    private Double kaaf;

    private String collerOrBan;

    private Boolean shalwarPocket;

    private Double collerOrBanWidth;

    /**
     * Get method to convert Customer object to its respective DTO
     *
     * @return CutomerDTO
     */
    public static Function<Customer, CustomerDTO> getConverter() {
        return (Customer c) -> {
            CustomerDTO obj_customerDTO = new CustomerDTO();
            obj_customerDTO.setCustomerId(c.getCustomerId());
            obj_customerDTO.setCustomerName(c.getCustomerName());
            obj_customerDTO.setCnic(c.getCnic());
            obj_customerDTO.setPhoneNo(c.getPhoneNo());
            obj_customerDTO.setAddress(c.getAddress());
            obj_customerDTO.setCreatedAt(Util.formatDateToString(c.getCreatedAt()));
            obj_customerDTO.setCreatedBy(c.getCreatedByUser());
            obj_customerDTO.setLastUpdatedAt(Util.formatDateToString(c.getLastUpdatedAt()));
            obj_customerDTO.setLastUpdatedBy(c.getLastUpdatedByUser());
            obj_customerDTO.setLambai(c.getLambai());
            obj_customerDTO.setAsteen(c.getAsteen());
            obj_customerDTO.setTeera(c.getTeera());
            obj_customerDTO.setChest(c.getChest());
            obj_customerDTO.setKhulla(c.getKhulla());
            obj_customerDTO.setShalwar(c.getShalwar());
            obj_customerDTO.setPanja(c.getPanja());
            obj_customerDTO.setDaman(c.getDaman());
            obj_customerDTO.setFrontPocket(c.getFrontPocket());
            obj_customerDTO.setFrontPocketSize(c.getFrontPocketSize());
            obj_customerDTO.setSidePocket(c.getSidePocket());
            obj_customerDTO.setFrontPati(c.getFrontPati());
            obj_customerDTO.setKaaf(c.getKaaf());
            obj_customerDTO.setCollerOrBan(c.getCollerOrBan());
            obj_customerDTO.setShalwarPocket(c.getShalwarPocket());
            obj_customerDTO.setCollerOrBanWidth(c.getCollerOrBanWidth());
            return obj_customerDTO;
        };
    }

    /**
     * Get method to convert CustomerDTO object to its respective Entity Object
     * entity object must be initialiazed
     *
     * @return Customer
     */
    public static BiFunction<CustomerDTO, Customer, Customer> convertDtoToCustomer() {

        return (CustomerDTO c, Customer customer) -> {
            customer.setCustomerName(c.getCustomerName());
            customer.setCnic(c.getCnic());
            customer.setPhoneNo(c.getPhoneNo());
            customer.setAddress(c.getAddress());
            customer.setLambai(c.getLambai());
            customer.setAsteen(c.getAsteen());
            customer.setTeera(c.getTeera());
            customer.setChest(c.getChest());
            customer.setKhulla(c.getKhulla());
            customer.setShalwar(c.getShalwar());
            customer.setPanja(c.getPanja());
            customer.setDaman(c.getDaman());
            customer.setFrontPocket(c.getFrontPocket());
            customer.setFrontPocketSize(c.getFrontPocketSize());
            customer.setSidePocket(c.getSidePocket());
            customer.setFrontPati(c.getFrontPati());
            customer.setKaaf(c.getKaaf());
            customer.setCollerOrBan(c.getCollerOrBan());
            customer.setShalwarPocket(c.getShalwarPocket());
            customer.setCollerOrBanWidth(c.getCollerOrBanWidth());
            return customer;
        };
    }
}
