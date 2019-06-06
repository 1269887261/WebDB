package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  CourseDetails
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/4 19:25
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class CourseDetails implements Serializable {
    private int cid;
    private String cname;
    private int maxnum;
    private String tName;
    private String assname;
    private String introduction;

    public  CourseDetails(){}

    public CourseDetails(int cid, String cname, int maxnum, String tName, String assname, String introduction) {
        this.cid = cid;
        this.cname = cname;
        this.maxnum = maxnum;
        this.tName = tName;
        this.assname = assname;
        this.introduction = introduction;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setMaxnum(int maxnum) {
        this.maxnum = maxnum;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

    public void setAssname(String assname) {
        this.assname = assname;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getCid() {
        return cid;
    }

    public String getCname() {
        return cname;
    }

    public int getMaxnum() {
        return maxnum;
    }

    public String gettName() {
        return tName;
    }

    public String getAssname() {
        return assname;
    }

    public String getIntroduction() {
        return introduction;
    }
}
