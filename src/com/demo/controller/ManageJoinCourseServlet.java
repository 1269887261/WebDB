package com.demo.controller;

import com.demo.dao.TakeCourseDao;
import com.demo.model.TakeCourse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  ManageJoinCourseServlet
  *Description:  管理社员加入课程
  *@author  MasonWu
  *@date  2019/6/2 13:49
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/joinCourse.do")
public class ManageJoinCourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cid= req.getParameter("cid");
        String sid=(String) req.getSession().getAttribute("sid");
        System.out.println("课程"+cid);
        TakeCourse tc=new TakeCourse(sid,Integer.parseInt(cid));
        TakeCourseDao dao=new TakeCourseDao();
        // 必须登录了才能加入课程
        if(sid!=null) {
            if(dao.addTakeCourse(tc)) {
                System.out.println("ok");

            } else{
                System.out.println("no");
            }
        } else {
            System.out.println("failed");
        }

    }
}
