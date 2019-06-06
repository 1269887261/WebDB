package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  Association
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/31 15:15
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class Association implements Serializable {
    private int id;
    private String assname;// 社团名称
    private int count;
    private String captain;

    public Association(){}

    public Association(int id, String assname, int count, String captain) {
        this.id = id;
        this.assname = assname;
        this.count = count;
        this.captain = captain;
    }

    public void setCaptain(String captain) {
        this.captain = captain;
    }

    public String getCaptain() {
        return captain;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAssname(String assname) {
        this.assname = assname;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getId() {
        return id;
    }

    public String getAssname() {
        return assname;
    }

    public int getCount() {
        return count;
    }
}
