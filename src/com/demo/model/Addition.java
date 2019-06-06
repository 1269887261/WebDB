package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  Addition
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/31 14:59
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class Addition implements Serializable {
    private String id;
    private String reason;
    private String idea;
    private String othername;
    private String speciality;
    private String phone;
    private int joinass;
    private String introduction;


    public Addition(){}

    public Addition(String id, String reason, String idea, String othername, String speciality, String phone, int joinass, String introduction) {
        this.id = id;
        this.reason = reason;
        this.idea = idea;
        this.othername = othername;
        this.speciality = speciality;
        this.phone = phone;
        this.joinass = joinass;
        this.introduction = introduction;
    }

    public void setIdea(String idea) {
        this.idea = idea;
    }

    public String getIdea() {
        return idea;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setOthername(String othername) {
        this.othername = othername;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setJoinass(int joinass) {
        this.joinass = joinass;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getId() {
        return id;
    }

    public String getReason() {
        return reason;
    }

    public String getOthername() {
        return othername;
    }

    public String getSpeciality() {
        return speciality;
    }

    public String getPhone() {
        return phone;
    }

    public int getJoinass() {
        return joinass;
    }

    public String getIntroduction() {
        return introduction;
    }
}
