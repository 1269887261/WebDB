package com.demo.controller;

import com.demo.dao.TeacherDao;
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
  *ClassNmae:  ManageTeahcerServlet
  *Description:  管理教师，包括添加教师，删除教师
  *@author  MasonWu
  *@date  2019/6/6 14:31
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/manageTeacher.do")
public class ManageTeahcerServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("manageTeacher");
        List<Teacher> teachers;
        TeacherDao dao=new TeacherDao();
        teachers=dao.findAllTeachers();
        req.getSession().setAttribute("teachers", teachers);
        resp.sendRedirect("manage/manageTeacherPage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String status=req.getParameter("status");
        TeacherDao dao=new TeacherDao();


        if(status.equals("deleteTeacher")) {
            System.out.println("ok");
            // todo 涉及到级联删除


        } else if(status.equals("addNewTeacher")) {
            System.out.println("add");
            Teacher teacher=new Teacher(0,req.getParameter("tname"),
                    req.getParameter("title"),
                    req.getParameter("phone"));
            if(dao.addTeacher(teacher)) {

            }


        }
    }
}
