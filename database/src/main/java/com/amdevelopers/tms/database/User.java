/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.database;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Moieen Abbas
 */
@Entity
@Table(name = "users")
@Setter
@Getter
public class User implements Serializable {

    public static final String ACTIVE = "ACTIVE";
    public static final String INACTIVE = "INACTIVE";
    public static final String DELETED = "DELETED";

    @Id
    @Column(name = "username", updatable = false, nullable = false)
    private String userName;
    @Column(name = "friendlyname")
    private String friendlyName;
    private String password;
    @Transient
    private String confirmPassword;
    @Column(name = "phoneno")
    private String phoneNo;
    private String status;
    @Column(name = "lastlogin")
    private Date lastLogin;

    @Override
    public String toString() {
        return getUserName();
    }
}
