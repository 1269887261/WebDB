package com.demo.dao;

import com.demo.model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  CourseDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/1 16:37
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class CourseDao extends BaseDao {


    public boolean addCourse(Course c) {
        String sql="insert into course (cname,maxnum,teacherid,assid,introduction) "
                +"values(?,?,?,?,?)";

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, c.getCname());
            pstmt.setInt(2, c.getMaxnum());
            pstmt.setInt(3, c.getTeacherid());
            pstmt.setInt(4, c.getAssid());
            pstmt.setString(5, c.getIntroduction());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    // 通过学号获取此人参加的所有课程
    public List<Course> findAllCourseBySid(String sid) {
        TakeCourseDao dao=new TakeCourseDao();
        List<Integer> integerList=dao.findAllTakeCourseBySid(sid);

        String sql="select * from course where cid=?";

        List<Course> courses=new LinkedList<>();

        try {

            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);

            for(int cid:integerList) {
                pstmt.setInt(1, cid);
                ResultSet rset= pstmt.executeQuery();
                if(rset.next()) {
                    Course course=new Course(rset.getInt("cid"),
                            rset.getString("cname"),
                            rset.getInt("maxnum"),
                            rset.getInt("teacherid"),
                            rset.getInt("assid"),
                            rset.getString("introduction"));
                    courses.add(course);
                }
            }


        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


        return courses;
    }

    // 查找属于社团的课程
    public List<Course> findAllCourseByAssID(int assid) {
        String sql="select * from course where assid=?";
        List<Course> courseList=new LinkedList<>();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, assid);
            ResultSet rset=pstmt.executeQuery();
            while(rset.next()) {
                Course course=new Course(rset.getInt("cid"),
                        rset.getString("cname"),
                        rset.getInt("maxnum"),
                        rset.getInt("teacherid"),
                        rset.getInt("assid"),
                        rset.getString("introduction"));
                courseList.add(course);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return courseList;
    }
}
