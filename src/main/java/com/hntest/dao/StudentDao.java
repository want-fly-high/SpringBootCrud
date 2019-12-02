package com.hntest.dao;

import com.hntest.entity.Grade;
import com.hntest.entity.Student;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("studentDao")
public interface StudentDao {
    List<Student> listByPager(Map<String, Object> map);

    int getCounts(Student student);

    List<Grade> getAllGrade();

    int update(Student student);

    int insert(Student student);

    int delete(Integer sno);

    Student getStudentBySno(Integer sno);
}
