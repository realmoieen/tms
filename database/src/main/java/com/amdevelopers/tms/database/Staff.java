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
import lombok.Data;
import lombok.ToString;

/**
 *
 * @author Moieen Abbas
 */
@Entity
@Table(name = "staff")
@Data
@ToString
public class Staff implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "staffid", updatable = false, nullable = false)
    private Long staffId;

    @Column(length = 250, name = "staffname", nullable = false)
    private String staffName;

    @Column(length = 15, name = "cnic", nullable = true)
    private String cnic;
    @Column(length = 20, name = "phoneno", nullable = true)
    private String phoneNo;

    @Column(length = 255, name = "address", nullable = true)
    private String address;

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

    @OneToMany(mappedBy = "staff", cascade = CascadeType.ALL)
    private Set<Order> orders;
}
