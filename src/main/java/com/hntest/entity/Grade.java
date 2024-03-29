package com.hntest.entity;

import java.io.Serializable;

public class Grade implements Serializable {
    private static final long serialVersionUID = -7234596367084723169L;
    private Integer gid;
    private String gname;

    public Grade(Integer gid, String gname) {
        this.gid = gid;
        this.gname = gname;
    }

    public Grade() {
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                '}';
    }
}
