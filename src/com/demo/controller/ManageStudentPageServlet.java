package com.demo.controller;

import com.demo.dao.AdditionDao;
import com.demo.dao.MemberDao;
import com.demo.model.Addition;
import com.demo.model.Association;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  ManageStudentPageServlet
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/31 22:14
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/manageStudent.do")
public class ManageStudentPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Addition addition=new Addition();
        Association association=(Association)req.getSession().getAttribute("association");
        int joinAss=-1;
        try {
            joinAss=association.getId();
            System.out.println(joinAss);
        } catch (Exception e) {
            e.printStackTrace();
        }
        AdditionDao dao=new AdditionDao();
        List<Addition> additionList;
        if((additionList=dao.findAllAdditionByJoinass(joinAss))!=null) {
            for(Addition a:additionList) {
                System.out.println(a.getIntroduction());
            }
            req.getSession().setAttribute("additionList", additionList);
        } else {
            System.out.println("fuck");
            System.out.println("1234");

        }
//        req.getRequestDispatcher("/manage/manageStudentPage.jsp").forward(req, resp);
        resp.sendRedirect("manage/manageStudentPage.jsp");
    }



    /**
     * 处理 是否接受学生加入社团 操作addition模式
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id= req.getParameter("id");
        String status= req.getParameter("status");
        AdditionDao dao=new AdditionDao();
        MemberDao mDao=new MemberDao();
        Association association=(Association)req.getSession().getAttribute("association");
        if(status.equals("join")) {
            Addition addition=dao.findAdditionById(id);
            dao.addMemberinfo(addition);
            dao.deleteAddition(id);
            mDao.addMember(addition);
            System.out.println(addition.getJoinass());
        } else if (status.equals("deny")) {
            System.out.println("deleteSuccess");
            dao.deleteAddition(id);
        }

    }
}
