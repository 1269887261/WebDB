package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  StuInfo
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/2 19:04
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class StuInfo implements Serializable {
    private String id;
    private String stuNikeName;
    private String stuProfile;
    private String stuInterest;
    private String stuSignature;
    private String stuAddress;
    public StuInfo(){}

    public StuInfo(String id, String stuNikeName, String stuProfile, String stuInterest, String stuSignature, String stuAddress) {
        this.id = id;
        this.stuNikeName = stuNikeName;
        this.stuProfile = stuProfile;
        this.stuInterest = stuInterest;
        this.stuSignature = stuSignature;
        this.stuAddress = stuAddress;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setStuNikeName(String stuNikeName) {
        this.stuNikeName = stuNikeName;
    }

    public void setStuProfile(String stuProfile) {
        this.stuProfile = stuProfile;
    }

    public void setStuInterest(String stuInterest) {
        this.stuInterest = stuInterest;
    }

    public void setStuSignature(String stuSignature) {
        this.stuSignature = stuSignature;
    }

    public void setStuAddress(String stuAddress) {
        this.stuAddress = stuAddress;
    }

    public String getId() {
        return id;
    }

    public String getStuNikeName() {
        return stuNikeName;
    }

    public String getStuProfile() {
        return stuProfile;
    }

    public String getStuInterest() {
        return stuInterest;
    }

    public String getStuSignature() {
        return stuSignature;
    }

    public String getStuAddress() {
        return stuAddress;
    }
}
