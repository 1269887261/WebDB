package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  Student
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/30 19:39
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class Student implements Serializable {
    private String sid;
    private String sname;
    private String speciaty;
    private String email;
    private String sclass;
    private String password;

    public Student(){}
    public Student(String sid, String sname, String speciaty, String email, String sclass, String password) {
        this.sid = sid;
        this.sname = sname;
        this.speciaty = speciaty;
        this.email = email;
        this.sclass = sclass;
        this.password = password;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public void setspeciaty(String speciaty) {
        this.speciaty = speciaty;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSid() {
        return sid;
    }

    public String getSname() {
        return sname;
    }

    public String getspeciaty() {
        return speciaty;
    }

    public String getEmail() {
        return email;
    }

    public String getSclass() {
        return sclass;
    }

    public String getPassword() {
        return password;
    }
}
