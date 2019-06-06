package com.demo.controller;

import com.demo.dao.CourseDao;
import com.demo.dao.TeacherDao;
import com.demo.model.Association;
import com.demo.model.Course;
import com.demo.model.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  ManageCoursePageServlet
  *Description:  管理课程
  *@author  MasonWu
  *@date  2019/6/1 16:21
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/manageClassPage.do")
public class ManageCoursePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取课程信息
        List<Course> courses;
        CourseDao dao=new CourseDao();
        Association association=(Association) req.getSession().getAttribute("association");
        System.out.println(association.getCaptain());
        System.out.println(association.getId());
        courses=dao.findAllCourseByAssID(association.getId());

        // 查找所有教师
        TeacherDao tdao=new TeacherDao();
        List<Teacher> teachers=tdao.findAllTeachers();
        req.getSession().setAttribute("teachers", teachers);

        System.out.println(req.getParameter("teacherid"));
        req.getSession().setAttribute("courses", courses);
        resp.sendRedirect("manage/manageClassPage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CourseDao dao=new CourseDao();
        String status=req.getParameter("status");


        if(status.equals("cancelCourse")) {

            // todo 删除课程 涉及级联删除
            System.out.println("cancel");
        } else if(status.equals("addNewCourse")) {

            Association association=(Association) req.getSession().getAttribute("association");

            Course course=new Course(0,
                    req.getParameter("cname"),
                    Integer.parseInt( req.getParameter("maxnum")),
                    Integer.parseInt(req.getParameter("teacherid")),
                    association.getId(),
                    req.getParameter("introduction"));

            // TODO 将相关课程加入数据库
            if(dao.addCourse(course)) {
                System.out.println("addcourse");
            }
        }




        resp.sendRedirect("manage/manageClassPage.jsp");
    }
}
