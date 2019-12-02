package com.hntest.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hntest.dao.StudentDao;
import com.hntest.entity.Grade;
import com.hntest.entity.Student;
import com.hntest.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("crudServiceImpl")
public class CrudServiceImpl implements CrudService {
    @Autowired
   private StudentDao studentDao;

    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Override
    public PageInfo<Student> listByPager(Student student, Integer currPage) {
        Map<String,Object> map = new HashMap<>();
        map.put("stu", student);
        currPage=currPage==null?1:currPage;
        PageHelper.startPage(currPage, 2);
        List<Student> students =  studentDao.listByPager(map);
        PageInfo<Student> page  = new PageInfo<>(students);
        System.out.println(page);
        return page;
    }

    @Override
    public List<Grade> getAllGrade() {
        List<Grade> grades = studentDao.getAllGrade();
        return grades;
    }

    @Override
    public int update(Student student) {
        int n = studentDao.update(student);
        return n;
    }

    @Override
    public int insert(Student student) {
        int n = studentDao.insert(student);
        return n;
    }

    @Override
    public int delete(Integer sno) {
        int n = studentDao.delete(sno);
        return n;
    }

    @Override
    public Student getStudentBySno(Integer sno) {
        Student student = studentDao.getStudentBySno(sno);
        return student;
    }
}
