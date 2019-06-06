package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  TeacherInfo
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/6 14:43
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class TeacherInfo implements Serializable {
    private int tid;
    private String title;
    private String phone;

    public TeacherInfo(){}

    public TeacherInfo(int tid, String title, String phone) {
        this.tid = tid;
        this.title = title;
        this.phone = phone;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getTid() {
        return tid;
    }

    public String getTitle() {
        return title;
    }

    public String getPhone() {
        return phone;
    }
}
