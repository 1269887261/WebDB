package com.demo.dao;

import com.demo.model.CourseDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
  *ClassNmae:  CourseDetailsDao
  *Description:  TODO
  *@author  MasonWu
  *@date  2019/6/4 19:28
  *@version  1.0
  *Copyright (c) 2018-2020 Koreancoco All Rights Reserved.
  **/
public class CourseDetailsDao extends BaseDao {

    public List<CourseDetails> findAllCourseDetailsBySid(String sid) {

        String sql="select DISTINCT assname, takecourse.cid,cname,maxnum,tname,introduction from takecourse,teacher,course,\n" +
                "association\n" +
                "where course.assid=association.id and sid=? and takecourse.cid=course.cid and teacher.tid=course.teacherid";
        List<CourseDetails> courseDetailsList=new LinkedList<>();

        try {
            Connection conn=dataSource.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, sid);
            ResultSet rset=pstmt.executeQuery();
            while (rset.next()) {
                CourseDetails couseDetailes=new CourseDetails();
                couseDetailes.setCid(rset.getInt("takecourse.cid"));
                couseDetailes.setCname(rset.getString("cname"));
                couseDetailes.setMaxnum(rset.getInt("maxnum"));
                couseDetailes.setIntroduction(rset.getString("introduction"));
                couseDetailes.setAssname(rset.getString("assname"));
                couseDetailes.settName(rset.getString("tname"));
                courseDetailsList.add(couseDetailes);
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }


        return  courseDetailsList;
    }

}
