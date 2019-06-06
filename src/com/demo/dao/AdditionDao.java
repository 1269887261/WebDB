package com.demo.dao;

import com.demo.model.Addition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  AdditionDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/31 15:50
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class AdditionDao extends BaseDao {
    // 向addition表中添加记录
    public boolean addAddition(Addition addition) {
        String sql="insert into addition"+
                "(id,reason,idea,othername,speciality,phone,joinass,introduction)"+
                "values(?,?,?,?,?,?,?,?)";
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, addition.getId());
            pstmt.setString(2, addition.getReason());
            pstmt.setString(3, addition.getIdea());
            pstmt.setString(4, addition.getOthername());
            pstmt.setString(5, addition.getSpeciality());
            pstmt.setString(6, addition.getPhone());
            pstmt.setInt(7, addition.getJoinass());
            pstmt.setString(8, addition.getIntroduction());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }

    // 筛选出所有报名同一个社团的学生列表
    public List<Addition> findAllAdditionByJoinass(int joinass) {
        String sql="select * from addition where joinass=?";
        List<Addition> additionList=new LinkedList<>();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, joinass);
            ResultSet rset=pstmt.executeQuery();
            while(rset.next()) {
                Addition addition=new Addition(rset.getString("id"),
                        rset.getString("reason"),
                        rset.getString("idea"),
                        rset.getString("othername"),
                        rset.getString("speciality"),
                        rset.getString("phone"),
                        rset.getInt("joinass"),
                        rset.getString("introduction"));
                additionList.add(addition);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return additionList;
    }

    public boolean deleteAddition(String id) {
        String sql="delete from addition where id=?";

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }


    // 向addition表中添加记录
    public boolean addMemberinfo(Addition addition) {
        String sql="insert into memberinfo"+
                "(id,reason,idea,othername,speciality,phone,joinass,introduction)"+
                "values(?,?,?,?,?,?,?,?)";
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, addition.getId());
            pstmt.setString(2, addition.getReason());
            pstmt.setString(3, addition.getIdea());
            pstmt.setString(4, addition.getOthername());
            pstmt.setString(5, addition.getSpeciality());
            pstmt.setString(6, addition.getPhone());
            pstmt.setInt(7, addition.getJoinass());
            pstmt.setString(8, addition.getIntroduction());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }

    public Addition findAdditionById(String id) {
        String sql="select * from addition where id=?";
        Addition addition=new Addition();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rset= pstmt.executeQuery();
            if(rset.next()) {
                addition=new Addition(rset.getString("id"),
                        rset.getString("reason"),
                        rset.getString("idea"),
                        rset.getString("othername"),
                        rset.getString("speciality"),
                        rset.getString("phone"),
                        rset.getInt("joinass"),
                        rset.getString("introduction"));
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return addition;
    }

}
