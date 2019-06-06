package com.demo.dao;

import com.demo.model.Addition;
import com.demo.model.Association;
import com.demo.model.Student;
import com.sun.org.glassfish.external.statistics.annotations.Reset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
  *ClassNmae:  StudentDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/5/30 19:38
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class StudentDao extends BaseDao {

    // 通过学号查找
    public Student findBySid(String sid) {

        String sql="select * from students where sid=?";
        Student student=new Student();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            try(ResultSet rset=pstmt.executeQuery()) {
                if(rset.next()) {
                    student.setSid(sid);
                    student.setEmail(rset.getString("email"));
                    student.setPassword(rset.getString("password"));
                    student.setSname(rset.getString("sname"));
                    student.setSclass(rset.getString("sclass"));
                    student.setspeciaty(rset.getString("speciaty"));

                }
            }


        } catch (SQLException e) {
            return null;
        }
        return student;
    }

    // 判断该学生是否为社长
    public Association isCaptain(String sid) {
        String sql="select * from association where captain=?";
        Association association=new Association();
        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            ResultSet rset=pstmt.executeQuery();
            if(rset.next()) {
                association.setId(rset.getInt("id"));
                association.setAssname(rset.getString("assname"));
                association.setCount(rset.getInt("count"));
                association.setCaptain(rset.getString("captain"));
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return association;
    }

}
