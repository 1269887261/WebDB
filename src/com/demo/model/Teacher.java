package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  Teacher
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/5 0:13
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class Teacher implements Serializable {
    private int tid;
    private String tName;
    private String title;
    private String phone;


    public Teacher(){}

//    public Teacher(int tid, String tName) {
//        this.tid = tid;
//        this.tName = tName;
//    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTitle() {
        return title;
    }

    public String getPhone() {
        return phone;
    }

    public Teacher(int tid, String tName, String title, String phone) {
        this.tid = tid;
        this.tName = tName;
        this.title = title;
        this.phone = phone;
    }

    public int getTid() {
        return tid;
    }

    public String gettName() {
        return tName;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public void settName(String tName) {
        this.tName = tName;
    }
}
