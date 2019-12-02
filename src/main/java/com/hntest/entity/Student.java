package com.hntest.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable {

    private static final long serialVersionUID = -2660229540935779265L;
    private Integer sno;
    private String sname;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate;
    private String sPass;
    private Grade grade;

    public Student(Integer sno, String sname, Date birthdate, String sPass, Grade grade) {
        this.sno = sno;
        this.sname = sname;
        this.birthdate = birthdate;
        this.sPass = sPass;
        this.grade = grade;
    }

    public Student() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno=" + sno +
                ", sname='" + sname + '\'' +
                ", birthdate=" + birthdate +
                ", sPass='" + sPass + '\'' +
                ", grade=" + grade +
                '}';
    }

    public Integer getSno() {
        return sno;
    }

    public void setSno(Integer sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getsPass() {
        return sPass;
    }

    public void setsPass(String sPass) {
        this.sPass = sPass;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }
}
