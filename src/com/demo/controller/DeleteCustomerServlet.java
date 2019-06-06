package com.demo.controller;

import com.demo.dao.CustomerDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  DeleteCustomerServlet
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/28 16:42
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/

@WebServlet("/deleteCustomer.do")
public class DeleteCustomerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cust_id=req.getParameter("cust_id");
        String message;
        CustomerDao dao=new CustomerDao();
        if(dao.deleteCustomer(cust_id)) {
            message="<li>删除客户信息成功</li>";
        } else {
            message="<li>删除客户信息失败</li>";
        }
        req.setAttribute("result", message);
        RequestDispatcher rd =getServletContext().getRequestDispatcher("/deleteCustomer.jsp");
        rd.forward(req, resp);
    }
}
