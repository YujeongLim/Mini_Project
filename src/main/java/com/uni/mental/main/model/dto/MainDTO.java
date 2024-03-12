package com.uni.mental.main.model.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MainDTO {
    private Integer ageComNo;
    private Integer cateNo;
    private String ageComTitle;
    private String ageComDetail;
    private String memberNick;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  // Specify the date format
    private Date ageComDate;
    private Integer ageComViews = 0; // 기본값으로 0 설정

    private String attachNewname;

    private String cateName;


    public MainDTO(Integer ageComNo, int cateNo, String ageComTitle, String ageComDetail, String memberNick, Date ageComDate, Integer ageComViews, String attachNewname, String cateName) {
        this.ageComNo = ageComNo;
        this.cateNo = cateNo;
        this.ageComTitle = ageComTitle;
        this.ageComDetail = ageComDetail;
        this.memberNick = memberNick;
        this.ageComDate = ageComDate;
        this.ageComViews = ageComViews;
        this.attachNewname = attachNewname;
        this.cateName = cateName;

    }

    public Integer getAgeComNo() {
        return ageComNo;
    }

    public void setAgeComNo(Integer ageComNo) {
        this.ageComNo = ageComNo;
    }

    public Integer getCateNo() {
        return cateNo;
    }

    public void setCateNo(int cateNo) {
        this.cateNo = cateNo;
    }

    public String getAgeComTitle() {
        return ageComTitle;
    }

    public void setAgeComTitle(String ageComTitle) {
        this.ageComTitle = ageComTitle;
    }

    public String getAgeComDetail() {
        return ageComDetail;
    }

    public void setAgeComDetail(String ageComDetail) {
        this.ageComDetail = ageComDetail;
    }

    public String getMemberNick() {
        return memberNick;
    }

    public void setMemberNick(String memberNick) {
        this.memberNick = memberNick;
    }

    public Date getAgeComDate() {
        return ageComDate;
    }

    public void setAgeComDate(Date ageComDate) {
        this.ageComDate = ageComDate;
    }

    public Integer getAgeComViews() {
        return ageComViews;
    }

    public void setAgeComViews(int ageComViews) {
        this.ageComViews = ageComViews;
    }

    public String getAttachNewname() {
        return attachNewname;
    }
    public void setAttachNewname(String attachNewname) {
        this.attachNewname = attachNewname;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    @Override
    public String toString() {
        return "AgeComDTO{" +
                "ageComNo=" + ageComNo +
                ", cateNo=" + cateNo +
                ", ageComTitle='" + ageComTitle + '\'' +
                ", ageComDetail='" + ageComDetail + '\'' +
                ", memberNick='" + memberNick + '\'' +
                ", ageComDate=" + ageComDate +
                ", ageComViews=" + ageComViews +
                ", cateName=" + cateName +
                '}';
    }

}