/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.database.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author Moieen Abbas
 */
@Setter
@Getter
public class UserDTO {

    private String userName;
    private String friendlyName;
    private String phoneNo;
    private String status;
    private Date lastLogin;

}
