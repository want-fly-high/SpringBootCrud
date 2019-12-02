package com.hntest.service;

import com.github.pagehelper.PageInfo;
import com.hntest.entity.Grade;
import com.hntest.entity.Student;

import java.util.List;

public interface CrudService {
    PageInfo<Student> listByPager(Student student, Integer currPage);

    List<Grade> getAllGrade();

    int update(Student student);

    int insert(Student student);

    int delete(Integer sno);

    Student getStudentBySno(Integer sno);
}
