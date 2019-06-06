package com.demo.dao;

import com.demo.model.TakeCourse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  TakeCourseDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/2 14:14
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class TakeCourseDao extends BaseDao {


    public boolean quitCourse(String sid,int cid) {

        String sql="delete from takecourse where sid=? and cid=?";
        int count=0;
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            pstmt.setInt(2,cid);
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }

    // 通过课程id获取该课程选择的学生人数
    public  int getStuCountByCid( String cid) {
        String sql="select COUNT(*) count from takecourse " +
                "where cid=?";
        int count=0;
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, cid);
            ResultSet rset=pstmt.executeQuery();
            if(rset.next()) {
                count=rset.getInt("count");
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return count;
    }

    // 通过学生学号查询学生选择的课程总数
    public int getCoursesCountBySid(String sid) {
        String sql="select COUNT(*) count from takecourse " +
                "where sid=?";
        int count=0;
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            ResultSet rset=pstmt.executeQuery();
            if(rset.next()) {
                count=rset.getInt("count");
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return count;
    }


    // 通过学号获取此人参加的课程cid
    public List<Integer> findAllTakeCourseBySid(String sid) {

        String sql="select cid from takecourse where sid=?";

        List<Integer> takeCourseList=new LinkedList<>();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            ResultSet rset=pstmt.executeQuery();
            while (rset.next()) {
                takeCourseList.add(rset.getInt("cid"));
            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


        return takeCourseList;
    }

    public boolean addTakeCourse(TakeCourse tc) {
        String sql = "insert into takecourse (sid,cid) values(?,?)";
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, tc.getSid());
            pstmt.setInt(2, tc.getCid());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
