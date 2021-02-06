/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.database;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import lombok.Data;

/**
 *
 * @author Moieen Abbas
 */
@Entity
@Table(name = "orders")
@Data
public class Order implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderid", updatable = false, nullable = false)
    private Long id;

    @Column(length = 50, name = "order_status", nullable = false)
    private String status;

    @Column(length = 255, name = "order_details", nullable = true)
    private String details;

    @Column(name = "deliveredat", nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date deliveredAt;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_customerid", value = ConstraintMode.CONSTRAINT), referencedColumnName = "customerid", name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_staffid", value = ConstraintMode.CONSTRAINT), referencedColumnName = "staffid", name = "staff_id", nullable = false)
    private Staff staff;

    @Column(name = "createdat", nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date createdAt;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_createdby", value = ConstraintMode.CONSTRAINT), referencedColumnName = "username", name = "createdby", nullable = false)
    private User createdBy;

    @Column(name = "lastupdatedat", nullable = true)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date lastUpdatedAt;

    @ManyToOne(fetch = FetchType.LAZY, optional = true)
    @JoinColumn(foreignKey = @ForeignKey(name = "fk_lastupdatedby", value = ConstraintMode.CONSTRAINT), referencedColumnName = "username", name = "lastupdatedby", nullable = true)
    private User lastUpdatedBy;

}
