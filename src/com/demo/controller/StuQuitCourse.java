package com.demo.controller;

import com.demo.dao.TakeCourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  StuQuitCourse
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/4 20:12
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/StuQuitCourse.do")
public class StuQuitCourse extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cid=Integer.parseInt(req.getParameter("cid"));
        String sid=(String) req.getSession().getAttribute("sid");

        TakeCourseDao dao=new TakeCourseDao();
        if(dao.quitCourse(sid, cid)) {
            System.out.println("成功");
        } else {
            System.out.println("失败");
        }

        resp.sendRedirect("memberinfo/myCourses.jsp");
    }
}
