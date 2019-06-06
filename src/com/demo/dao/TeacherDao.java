package com.demo.dao;

import com.demo.model.Teacher;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  TeacherDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/5 0:15
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class TeacherDao extends BaseDao {

    String[] titles={"院士","讲师","教授","副教授"};
    public boolean addTeacher(Teacher t) {
        String sql="insert into teacher (tname,title,phone) values(?,?,?)";
        List<Teacher> teacherList=new LinkedList<>();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, t.gettName());
            pstmt.setString(2, titles[Integer.parseInt(t.getTitle())]);
            pstmt.setString(3, t.getPhone());
            pstmt.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }


        return true;
    }

    public List<Teacher> findAllTeachers() {


        String sql="select * from teacher";
        List<Teacher> teacherList=new LinkedList<>();
        try {
            Connection conn=dataSource.getConnection();
            Statement stmt=conn.createStatement();
            ResultSet rset= stmt.executeQuery(sql);
            while(rset.next()) {
                Teacher teacher=new Teacher(rset.getInt("tid"),
                        rset.getString("tname"),
                        rset.getString("title"),
                        rset.getString("phone")
                        );
                teacherList.add(teacher);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


        return teacherList;
    }
}
