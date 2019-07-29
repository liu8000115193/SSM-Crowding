package com.zcw.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
public class Project {
    private Integer id;

    private Integer userid;

    private Integer typeid;

    private Integer kindid;

    private String name;

    private String introduce;

    private String detail;

    private String detailvido;

    private String rule;

    private String image;

    private String imagelist;

    private Double needmoney;

    private Double supmoney;

    private Double backmoney;

    private String backcontent;

    private String backimage;

    private Integer backtime;

    private Double sendmoney;

    private String statue;

    private Date startdate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date deadline;

    private String isable;

    private String isticket;

    private String isforbid;

    private Integer numsup;

    private Integer numcol;

    private String backtype;

    private String shenHe;

    private Users user;

    private String process;

    private Long dateTime;

    public Long getDateTime() {
        return dateTime;
    }

    public void setDateTime(String deadline) {
        LocalDate end = LocalDate.parse(deadline, DateTimeFormatter.ISO_LOCAL_DATE);
        if (end.isAfter(LocalDate.now())){
            this.dateTime = ChronoUnit.DAYS.between(LocalDate.now(),end);
        }
        else
            this.dateTime = 0L;
    }

    public String getProcess() {
        return process;
    }


    public void setProcess(Double supmoney,Double needmoney) {
        DecimalFormat df = new DecimalFormat("#.0");
        this.process = df.format(supmoney/needmoney*100);
    }

    public String getShenHe() {
        return shenHe;
    }

    public void setShenHe(String shenHe) {
        this.shenHe = shenHe;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getKindid() {
        return kindid;
    }

    public void setKindid(Integer kindid) {
        this.kindid = kindid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getDetailvido() {
        return detailvido;
    }

    public void setDetailvido(String detailvido) {
        this.detailvido = detailvido == null ? null : detailvido.trim();
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule == null ? null : rule.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getImagelist() {
        return imagelist;
    }

    public void setImagelist(String imagelist) {
        this.imagelist = imagelist == null ? null : imagelist.trim();
    }

    public Double getNeedmoney() {
        return needmoney;
    }

    public void setNeedmoney(Double needmoney) {
        this.needmoney = needmoney;
    }

    public Double getSupmoney() {
        return supmoney;
    }

    public void setSupmoney(Double supmoney) {
        this.supmoney = supmoney;
    }

    public Double getBackmoney() {
        return backmoney;
    }

    public void setBackmoney(Double backmoney) {
        this.backmoney = backmoney;
    }

    public String getBackcontent() {
        return backcontent;
    }

    public void setBackcontent(String backcontent) {
        this.backcontent = backcontent == null ? null : backcontent.trim();
    }

    public String getBackimage() {
        return backimage;
    }

    public void setBackimage(String backimage) {
        this.backimage = backimage == null ? null : backimage.trim();
    }

    public Integer getBacktime() {
        return backtime;
    }

    public void setBacktime(Integer backtime) {
        this.backtime = backtime;
    }

    public Double getSendmoney() {
        return sendmoney;
    }

    public void setSendmoney(Double sendmoney) {
        this.sendmoney = sendmoney;
    }

    public String getStatue() {
        return statue;
    }

    public void setStatue(String statue) {
        this.statue = statue == null ? null : statue.trim();
    }

    public String getStartdate() {
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        return ft.format(startdate);
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public String getDeadline() {
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        return ft.format(deadline);
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getIsable() {
        return isable;
    }

    public void setIsable(String isable) {
        this.isable = isable == null ? null : isable.trim();
    }

    public String getIsticket() {
        return isticket;
    }

    public void setIsticket(String isticket) {
        this.isticket = isticket == null ? null : isticket.trim();
    }

    public String getIsforbid() {
        return isforbid;
    }

    public void setIsforbid(String isforbid) {
        this.isforbid = isforbid == null ? null : isforbid.trim();
    }

    public Integer getNumsup() {
        return numsup;
    }

    public void setNumsup(Integer numsup) {
        this.numsup = numsup;
    }

    public Integer getNumcol() {
        return numcol;
    }

    public void setNumcol(Integer numcol) {
        this.numcol = numcol;
    }

    public String getBacktype() {
        return backtype;
    }

    public void setBacktype(String backtype) {
        this.backtype = backtype == null ? null : backtype.trim();
    }
}