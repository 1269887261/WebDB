package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  Course
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/1 16:37
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class Course implements Serializable {
    private int cid;
    private String cname;
    private int maxnum;
    private int teacherid;
    private int assid;
    private String introduction;

    public Course(){}

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setMaxnum(int maxnum) {
        this.maxnum = maxnum;
    }

    public void setTeacherid(int teacherid) {
        this.teacherid = teacherid;
    }

    public void setAssid(int assid) {
        this.assid = assid;
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

    public int getTeacherid() {
        return teacherid;
    }

    public int getAssid() {
        return assid;
    }

    public String getIntroduction() {
        return introduction;
    }

    public Course(int cid, String cname, int maxnum, int teacherid, int assid, String introduction) {
        this.cid = cid;
        this.cname = cname;
        this.maxnum = maxnum;
        this.teacherid = teacherid;
        this.assid = assid;
        this.introduction = introduction;
    }
}
