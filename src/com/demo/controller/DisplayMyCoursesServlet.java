package com.demo.controller;

import com.demo.dao.CourseDao;
import com.demo.dao.CourseDetailsDao;
import com.demo.dao.TakeCourseDao;
import com.demo.model.Course;
import com.demo.model.CourseDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
  *ClassNmae:  DisplayMyCoursesServlet
  *Description:  显示自己参加的课程 并且可以进行操作
  *@author  MasonWu
  *@date  2019/6/2 22:54
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/memberinfo/displayMyCourses.do")
public class DisplayMyCoursesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid=(String) req.getSession().getAttribute("sid");
        System.out.println();
        CourseDetailsDao dao=new CourseDetailsDao();
        List<CourseDetails> courseDetailsList=dao.findAllCourseDetailsBySid(sid);
        for(CourseDetails c:courseDetailsList) {
            System.out.println(c.getIntroduction());
        }

        req.getSession().setAttribute("MyCourseList", courseDetailsList);
        resp.sendRedirect("myCourses.jsp");
    }
}
