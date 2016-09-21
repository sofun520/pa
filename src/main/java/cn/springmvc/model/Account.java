package cn.springmvc.model;

import java.math.BigDecimal;
import java.util.Date;

public class Account {
    private Integer aId;

    private BigDecimal aAmount;

    private String aRemark;

    private Date aDate;

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public BigDecimal getaAmount() {
        return aAmount;
    }

    public void setaAmount(BigDecimal aAmount) {
        this.aAmount = aAmount;
    }

    public String getaRemark() {
        return aRemark;
    }

    public void setaRemark(String aRemark) {
        this.aRemark = aRemark == null ? null : aRemark.trim();
    }

    public Date getaDate() {
        return aDate;
    }

    public void setaDate(Date aDate) {
        this.aDate = aDate;
    }
}