package com.demo.controller;

import com.demo.dao.CustomerDao;
import com.demo.model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *ClassNmae:  UpdateCustomerServlet
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/28 16:41
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/

@WebServlet("/updateCustomer.do")
public class UpdateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CustomerDao dao=new CustomerDao();
        Customer customer=new Customer();
        customer.setCust_id(req.getParameter("cust_id"));
        customer.setCname(req.getParameter("cname"));
        customer.setEmail(req.getParameter("email"));
        String message=null;
        try {
            customer.setBalance(Double.parseDouble(req.getParameter("balance")));

            boolean success= dao.updateCustomer(customer);

            if(success) {
                message = "<li>成功修改一条记录！</li>";

            } else {
                message = "<li>修改记录错误,不存在该id号！</li>";

            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "<li>修改记录错误,不存在该id号！</li>";

        }
        req.setAttribute("result", message);

        RequestDispatcher rd =

                getServletContext().getRequestDispatcher("/updateCustomer.jsp");

        rd.forward (req,resp);




    }


}
