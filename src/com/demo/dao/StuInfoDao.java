package com.demo.dao;

import com.demo.model.StuInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
  *ClassNmae:  StuInfoDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/2 19:13
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class StuInfoDao extends BaseDao {


    public boolean findStuInfoByID(String id) {
        String sql="select * from stuinfo where id=?";
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rset= pstmt.executeQuery();

            if(rset.next()) {
                conn.close();

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public StuInfo getStuInfoById(String id ) {
        String sql="select * from stuinfo where id=?";
        System.out.println("ddd"+id);
        StuInfo stuInfo=new StuInfo();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);

            ResultSet rset= pstmt.executeQuery();
            if(rset.next()) {
                stuInfo.setId(rset.getString("id"));
                stuInfo.setStuNikeName(rset.getString("stuNikeName"));
                stuInfo.setStuProfile(rset.getString("stuProfile"));
                stuInfo.setStuInterest(rset.getString("stuInterest"));
                stuInfo.setStuSignature(rset.getString("stuSignature"));
                stuInfo.setStuAddress(rset.getString("stuAddress"));

            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return stuInfo;

    }

    public boolean addStuInfo(StuInfo stuInfo) {


        String sql="insert into stuinfo (id, stuNikeName,stuProfile,stuInterest,stuSignature,stuAddress) values(?,?,?,?,?,?)";

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, stuInfo.getId());
            pstmt.setString(2, stuInfo.getStuNikeName());
            pstmt.setString(3, stuInfo.getStuProfile());
            pstmt.setString(4, stuInfo.getStuInterest());
            pstmt.setString(5, stuInfo.getStuSignature());
            pstmt.setString(6, stuInfo.getStuAddress());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    public boolean updateStuInfo(StuInfo stuInfo) {
        String sql="update  stuinfo set stuNikeName=?,stuProfile=?,stuInterest=?,stuSignature=?,stuAddress=? where id=?";

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, stuInfo.getStuNikeName());
            pstmt.setString(2, stuInfo.getStuProfile());
            pstmt.setString(3, stuInfo.getStuInterest());
            pstmt.setString(4, stuInfo.getStuSignature());
            pstmt.setString(5, stuInfo.getStuAddress());
            pstmt.setString(6, stuInfo.getId());

            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }



}
