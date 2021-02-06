/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.database;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ConstraintMode;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.ToString;

/**
 *
 * @author Moieen Abbas
 */
@Entity
@Table(name = "customer")
@Data
@ToString
public class Customer implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customerid", updatable = false, nullable = false)
    private Long customerId;

    @Column(length = 250, name = "customername", nullable = false)
    @NotEmpty(message = "customerForm.customerName.required")
    private String customerName;

    @Column(length = 15, name = "cnic", nullable = true)
    private String cnic;
    @Column(length = 20, name = "phoneno", nullable = true)
    private String phoneNo;

    @Column(length = 255, name = "address", nullable = true)
    private String address;

    @Column(name = "lambai", nullable = true)
    @DecimalMin(value = "0.0", message = "customerForm.only.number.allowed")
    private Double lambai;

    @Column(name = "asteen", nullable = true)
    private Double asteen;

    @Column(name = "teera", nullable = true)
    private Double teera;

    @Column(name = "chest", nullable = true)
    private Double chest;

    @Column(name = "collerorbansize", nullable = true)
    private Double collerOrBanSize;

    @Column(name = "khulla", nullable = true)
    private Double khulla;

    @Column(name = "shalwar", nullable = true)
    private Double shalwar;

    @Column(name = "panja", nullable = true)
    private Double panja;

    @Column(name = "daman", nullable = true)
    private String daman;

    @Column(name = "isfrontpocket", nullable = true)
    private Boolean frontPocket;

    @Column(name = "frontpocket", nullable = true)
    private Double frontPocketSize;

    @Column(name = "sidepocket", nullable = true)
    private Integer sidePocket;

    @Column(name = "frontpati", nullable = true)
    private Double frontPati;

    @Column(name = "kaaf", nullable = true)
    private Double kaaf;

    @Column(name = "collerorban", nullable = true)
    private String collerOrBan;

    @Column(name = "shalwarpocket", nullable = true)
    private Boolean shalwarPocket;

    @Column(name = "collerorbanwidth", nullable = true)
    private Double collerOrBanWidth;

    @Column(name = "createdat", nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date createdAt;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
//    @Column(name = "createdby", nullable = false)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_createdby", value = ConstraintMode.CONSTRAINT), referencedColumnName = "username", name = "createdby", nullable = false)
    private User createdBy;

    @Column(name = "lastupdatedat", nullable = true)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date lastUpdatedAt;

    @ManyToOne(fetch = FetchType.EAGER, optional = true)
//    @Column(name = "lastupdatedby", nullable = true)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_lastupdatedby", value = ConstraintMode.CONSTRAINT), referencedColumnName = "username", name = "lastupdatedby", nullable = true)
    private User lastUpdatedBy;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL)
    private Set<Order> orders;

    public String getCreatedByUser() {
        return createdBy == null ? "" : createdBy.getUserName();
    }
    public String getLastUpdatedByUser() {
        return lastUpdatedBy == null ? "" : lastUpdatedBy.getUserName();
    }
}
