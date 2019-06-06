package com.demo.model;

import java.io.Serializable;

/**
  *ClassNmae:  TakeCourse
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/2 14:13
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class TakeCourse implements Serializable {
    private String sid;
    private int cid;

    public TakeCourse(){}
    public TakeCourse(String sid, int cid) {
        this.sid = sid;
        this.cid = cid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getSid() {
        return sid;
    }

    public int getCid() {
        return cid;
    }
}
