package com.demo.controller;

import com.demo.dao.CustomerDao;
import com.demo.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
  *ClassNmae:  QueryCustomerServlet
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/28 15:39
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
@WebServlet("/queryCustomer.do")
public class QueryCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDao dao=new CustomerDao();
        ArrayList<Customer> custList;
        custList= dao.findAllCustomer();
        if(custList.isEmpty())
        {
            resp.sendRedirect("/webDB/error2.jsp");

        } else {
            req.getSession().setAttribute("customerList", custList);
            resp.sendRedirect("/webDB/displayAllCustomer.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         String cname=req.getParameter("cname");
        System.out.println(cname);
        CustomerDao dao=new CustomerDao();
        String message=null;
        Customer customer;
         try {
             customer= dao.findByName(cname);
             if(customer.getCust_id()==null)
             {
                 resp.sendRedirect("/webDB/error2.jsp");

             } else {
                 req.getSession().setAttribute("customer", customer);
                 resp.sendRedirect("/webDB/displayCustomer.jsp");
             }



         } catch (Exception e) {
             e.printStackTrace();
         }

    }


}
