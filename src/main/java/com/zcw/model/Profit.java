package com.zcw.model;

public class Profit extends SupportVO {
    Double secondMoney;
    Double oneMoney;
    Integer supportPeople;
    Integer secondPeople;
    Project project;
    Integer shareId;

    public Integer getShareId() {
        return shareId;
    }

    public void setShareId(Integer shareId) {
        this.shareId = shareId;
    }

    public Integer getSecondPeople() {
        return secondPeople;
    }

    public void setSecondPeople(Integer secondPeople) {
        this.secondPeople = secondPeople;
    }

    public Double getSecondMoney() {
        return secondMoney;
    }

    public void setSecondMoney(Double secondMoney) {
        this.secondMoney = secondMoney;
    }

    public Double getOneMoney() {
        return oneMoney;
    }

    public void setOneMoney(Double oneMoney) {
        this.oneMoney = oneMoney;
    }

    public Integer getSupportPeople() {
        return supportPeople;
    }

    public void setSupportPeople(Integer supportPeople) {
        this.supportPeople = supportPeople;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}
