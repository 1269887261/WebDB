package com.demo.controller;

import com.demo.dao.StuInfoDao;
import com.demo.dao.StudentDao;
import com.demo.model.StuInfo;
import com.demo.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  DisplayAndModifyProfile
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/2 18:26
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/showMemberinfo.do")
public class DisplayAndModifyProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=(String)req.getSession().getAttribute("sid");
        StuInfoDao dao=new StuInfoDao();
        StudentDao sdao=new StudentDao();
        Student stu;
        stu=sdao.findBySid(id);
        System.out.println(id);
        req.setCharacterEncoding("UTF-8");

        StuInfo stuInfo=dao.getStuInfoById(id);
//        System.out.println(stuInfo.getStuAddress());
//        System.out.println(stuInfo.getStuAddress());
//

        req.getSession().setAttribute("stuInfo", stuInfo);
        req.getSession().setAttribute("stuName", stu.getSname());
        resp.sendRedirect("memberinfo/profile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id=(String)req.getSession().getAttribute("sid");
        StudentDao sdao=new StudentDao();

        Student stu=sdao.findBySid(id);
        System.out.println(id);
        req.setCharacterEncoding("UTF-8");
        System.out.println(req.getParameter("stuNikeName"));

        StuInfo stuInfo=new StuInfo(id,
                req.getParameter("stuNikeName"),
                req.getParameter("stuProfile"),
                req.getParameter("stuInterest"),
                req.getParameter("stuSignature"),
                req.getParameter("stuAddress"));
        StuInfoDao dao=new StuInfoDao();
        if(dao.findStuInfoByID(id)) {
            dao.updateStuInfo(stuInfo);
        } else {
            dao.addStuInfo(stuInfo);
        }
        req.getSession().setAttribute("stuInfo", stuInfo);
        req.getSession().setAttribute("stuName", stu.getSname());
        resp.sendRedirect("showMemberinfo.do");
    }
}
