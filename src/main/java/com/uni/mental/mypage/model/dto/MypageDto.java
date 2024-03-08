package com.uni.mental.mypage.model.dto;

import java.util.Date;

public class MypageDto {

    private int no;
    private String id;
    private String pwd;
    private Date bir;
    private String email;
    private String add;
    private String mental;
    private String nick;

    public MypageDto(int no, String id, String pwd, Date bir, String email, String add, String mental, String nick) {
        this.no = no;
        this.id = id;
        this.pwd = pwd;
        this.bir = bir;
        this.email = email;
        this.add = add;
        this.mental = mental;
        this.nick = nick;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Date getBir() {
        return bir;
    }

    public void setBir(Date bir) {
        this.bir = bir;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getMental() {
        return mental;
    }

    public void setMental(String mental) {
        this.mental = mental;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    @Override
    public String toString() {
        return "MypageDto{" +
                "no=" + no +
                ", id='" + id + '\'' +
                ", pwd='" + pwd + '\'' +
                ", bir=" + bir +
                ", email='" + email + '\'' +
                ", add='" + add + '\'' +
                ", mental='" + mental + '\'' +
                ", nick='" + nick + '\'' +
                '}';
    }

}