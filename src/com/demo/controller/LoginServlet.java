package com.demo.controller;

import com.demo.dao.StudentDao;
import com.demo.model.Association;
import com.demo.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  LoginServlet
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/30 19:21
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid=req.getParameter("sid");
        String password=req.getParameter("password");
        StudentDao dao=new StudentDao();
        Student student;
        if( (student=dao.findBySid(sid))!=null&&password.equals(student.getPassword())) {
            System.out.println("success");
            req.getSession().setAttribute("student", student);
            req.getSession().setAttribute("sid", sid);
            Association association=dao.isCaptain(sid);
            // 如果是社长，设置社团信息
            if(association!=null) {
                req.getSession().setAttribute("association", association);
                req.getSession().setAttribute("isCaptain", true);
            }
            resp.sendRedirect("index.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }
    }
}
