package com.demo.controller;

import com.demo.dao.CourseDao;
import com.demo.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
  *ClassNmae:  DisplayCoursesServlet
  *Description:  管理员界面显示该社团的课程
  *@author  MasonWu
  *@date  2019/6/1 18:24
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/displayCourses.do")
public class DisplayCoursesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("displayCourses");
        System.out.println(req.getParameter("assid"));
        CourseDao dao=new CourseDao();
        List<Course> courseList=dao.findAllCourseByAssID(Integer.parseInt(req.getParameter("assid")));

        /*for(Course c:courseList) {
            System.out.println(c.getCname());
        }*/
        req.getSession().setAttribute("courses", courseList);
        resp.sendRedirect("displayAssAndCourses.jsp");
    }
}
