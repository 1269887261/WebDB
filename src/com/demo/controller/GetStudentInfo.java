package com.demo.controller;

import com.demo.dao.AdditionDao;
import com.demo.model.Addition;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  GetStudentInfo
  *Description:  用于添加学生的入社请求 todo 请求过了的addition
  *@author  MasonWu
  *@date  2019/5/31 10:20
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/postStudentInfo.do")
public class GetStudentInfo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 这家伙还没登陆
        String sid;
        if((sid=(String) req.getSession().getAttribute("sid"))==null) {
            resp.sendRedirect("login.jsp");
        }
        System.out.println(sid);
        AdditionDao dao=new AdditionDao();
        try {
            Addition addition=new Addition(
                    sid,
                    new String(req.getParameter("reason")

                            .getBytes("iso-8859-1"),"UTF-8"),
                    new String(req.getParameter("idea")

                            .getBytes("iso-8859-1"),"UTF-8"),
                    new String(req.getParameter("FirstName")

                            .getBytes("iso-8859-1"),"UTF-8")+new String(req.getParameter("LastName")

                            .getBytes("iso-8859-1"),"UTF-8"),
                    new String(req.getParameter("speciality")

                            .getBytes("iso-8859-1"),"UTF-8"),
                    new String(req.getParameter("Phone")

                            .getBytes("iso-8859-1"),"UTF-8"),
                    Integer.parseInt(req.getParameter("JoinAssociation")),
                    new String(req.getParameter("Introduction")

                            .getBytes("iso-8859-1"),"UTF-8")
            );
            RequestDispatcher rd;
            if(dao.addAddition(addition)) {
                rd=req.getRequestDispatcher("/joinResponse.jsp");
                rd.forward(req, resp);
            } else {
                rd=req.getRequestDispatcher("error/joinAssDupError.jsp");
                rd.forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


    }


}
