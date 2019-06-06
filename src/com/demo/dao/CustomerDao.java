package com.demo.dao;
import java.sql.*;

import java.util.ArrayList;

import com.demo.model.Customer;



public class CustomerDao extends BaseDao{

    // 插入一条客户记录

    public boolean addCustomer(Customer customer){

        String sql = "INSERT INTO customers" +

                "(cust_id,cname,email,balance)VALUES(?,?,?,?)";

        try(

                Connection conn = dataSource.getConnection();

                PreparedStatement pstmt = conn.prepareStatement(sql))

        {

            pstmt.setString(1,customer.getCust_id());

            pstmt.setString(2,customer.getCname());

            pstmt.setString(3,customer.getEmail());

            pstmt.setDouble(4,customer.getBalance());

            pstmt.executeUpdate();

            return true;

        }catch(SQLException se){

            se.printStackTrace();

            return false;

        }

    }


    // 删除客户信息

    public boolean deleteCustomer(String cust_id) {
        String sql="delete from customers where cust_id=?";
        if(findById(cust_id).getCust_id()==null) {
            return false;
        }
        try {
            Connection conn= dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, cust_id);
            pstmt.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 更新客户记录

    public boolean updateCustomer(Customer customer) {
        String sql ="update customers set email=?,balance=? where cust_id=?";

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            if(findById(customer.getCust_id()).getCust_id()==null) {
                return false;
            }
            pstmt.setString(1, customer.getEmail());
            pstmt.setDouble(2, customer.getBalance());
            pstmt.setString(3, customer.getCust_id());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


    }



    public Customer findById(String cust_id){

        String sql = "SELECT cust_id,cname,email,balance" +

                " FROM customers WHERE cust_id=?";

        Customer  customer = new Customer();

        try(

                Connection conn = dataSource.getConnection();

                PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,cust_id);

            try(ResultSet rst = pstmt.executeQuery()){

                if(rst.next()){

                    customer.setCust_id(rst.getString("cust_id"));

                    customer.setCname(rst.getString("cname"));

                    customer.setEmail(rst.getString("email"));

                    customer.setBalance(rst.getDouble("balance"));

                }

            }

        }catch(SQLException se){

            return null;

        }

        return customer;

    }



    // 按姓名检索客户记录

    public Customer findByName(String cname){

        String sql = "SELECT cust_id,cname,email,balance" +

                " FROM customers WHERE cname=?";

        Customer  customer = new Customer();

        try(

                Connection conn = dataSource.getConnection();

                PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1,cname);

            try(ResultSet rst = pstmt.executeQuery()){

                if(rst.next()){

                    customer.setCust_id(rst.getString("cust_id"));

                    customer.setCname(rst.getString("cname"));

                    customer.setEmail(rst.getString("email"));

                    customer.setBalance(rst.getDouble("balance"));

                }

            }

        }catch(SQLException se){

            return null;

        }

        return customer;

    }

    // 查询所有客户信息

    public ArrayList<Customer> findAllCustomer(){



        ArrayList<Customer> custList = new ArrayList<>();

        String sql = "SELECT * FROM customers";

        try(

                Connection conn = dataSource.getConnection();

                PreparedStatement pstmt = conn.prepareStatement(sql);

                ResultSet rst = pstmt.executeQuery()){

            while(rst.next()){
                Customer  customer = new Customer();
                customer.setCust_id(rst.getString("cust_id"));

                customer.setCname(rst.getString("cname"));

                customer.setEmail(rst.getString("email"));

                customer.setBalance(rst.getDouble("balance"));

                custList.add(customer);

            }

            return custList;

        }catch(SQLException e){

            e.printStackTrace();

            return null;

        }

    }

}

