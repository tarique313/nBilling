/*
 * JBILLING CONFIDENTIAL
 * _____________________
 *
 * [2003] - [2012] Enterprise jBilling Software Ltd.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Enterprise jBilling Software.
 * The intellectual and technical concepts contained
 * herein are proprietary to Enterprise jBilling Software
 * and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden.
 */
package com.sapienter.jbilling.server.user.partner.db;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Version;


@Entity
@TableGenerator(
        name="partner_range_GEN",
        table="jbilling_seqs",
        pkColumnName = "name",
        valueColumnName = "next_id",
        pkColumnValue="partner_range",
        allocationSize=10
        )
@Table(name="partner_range")
public class PartnerRange  implements java.io.Serializable {


     private int id;
     private Partner partner;
     private Double percentageRate;
     private Double referralFee;
     private int rangeFrom;
     private int rangeTo;
     private int versionNum;

    public PartnerRange() {
    }

    
    public PartnerRange(int id, int rangeFrom, int rangeTo) {
        this.id = id;
        this.rangeFrom = rangeFrom;
        this.rangeTo = rangeTo;
    }
    public PartnerRange(int id, Partner partner, Double percentageRate, Double referralFee, int rangeFrom, int rangeTo) {
       this.id = id;
       this.partner = partner;
       this.percentageRate = percentageRate;
       this.referralFee = referralFee;
       this.rangeFrom = rangeFrom;
       this.rangeTo = rangeTo;
    }
   
    @Id  @GeneratedValue(strategy=GenerationType.TABLE, generator="partner_range_GEN")
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="partner_id")
    public Partner getPartner() {
        return this.partner;
    }
    
    public void setPartner(Partner partner) {
        this.partner = partner;
    }
    
    @Column(name="percentage_rate", precision=17, scale=17)
    public Double getPercentageRate() {
        return this.percentageRate;
    }
    
    public void setPercentageRate(Double percentageRate) {
        this.percentageRate = percentageRate;
    }
    
    @Column(name="referral_fee", precision=17, scale=17)
    public Double getReferralFee() {
        return this.referralFee;
    }
    
    public void setReferralFee(Double referralFee) {
        this.referralFee = referralFee;
    }
    
    @Column(name="range_from", nullable=false)
    public int getRangeFrom() {
        return this.rangeFrom;
    }
    
    public void setRangeFrom(int rangeFrom) {
        this.rangeFrom = rangeFrom;
    }
    
    @Column(name="range_to", nullable=false)
    public int getRangeTo() {
        return this.rangeTo;
    }
    
    public void setRangeTo(int rangeTo) {
        this.rangeTo = rangeTo;
    }

    @Version
    @Column(name="OPTLOCK")
    public Integer getVersionNum() {
        return versionNum;
    }
    public void setVersionNum(Integer versionNum) {
        this.versionNum = versionNum;
    }



}


