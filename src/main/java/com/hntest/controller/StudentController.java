package com.hntest.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hntest.entity.Grade;
import com.hntest.entity.Student;
import com.hntest.service.CrudService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller("studentController")
public class StudentController {
    @Autowired
    private CrudService crudService;

    public void setCrudService(CrudService crudService) {
        this.crudService = crudService;
    }

    @RequestMapping("/select")
    public String selectByPager(@RequestParam(value = "currPage",required = false)Integer currPage, Student student, ModelMap modelMap){
        PageInfo<Student> page =  crudService.listByPager(student,currPage);
        System.out.println(student);
        List<Student> students = page.getList();
        modelMap.put("gradeAll", crudService.getAllGrade());
        modelMap.put("list", students);
        modelMap.put("pager", page);
        for (Student student1 : students){
            System.out.println(student1);
        }
        return "select";
    }

    @RequestMapping("/delete/{sno}")
    public String delete(@PathVariable(value="sno") int sno){
        int n=crudService.delete(sno);
        if(n>0)
            return "redirect:/select?op=delYes";
        else
            return "redirect:/select?op=delNo";
    }

    @RequestMapping("/toInsert")//去往新增页面(得到年级下拉框的值)
    public String toInsert(ModelMap modelMap){
        modelMap.put("gradeAll", crudService.getAllGrade());
        return "insert";
    }

    @RequestMapping("/doInsert")//提交新增数据，成功后重定向到分页查询
    public String doInsert(Student stu){
        int n=crudService.insert(stu);
        if(n>0)
            return "redirect:/select?op=insertYes";
        else
            return "redirect:/select?op=insertNo";
    }

    @RequestMapping("/toUpdate/{sno}")//根据学号查询出原始学生信息，然后把信息转发到修改页面
    public String toUpdate(@PathVariable(value="sno") int sno, ModelMap modelMap){
        Student stu=crudService.getStudentBySno(sno);
        modelMap.put("old", stu);//
        modelMap.put("gradeAll", crudService.getAllGrade());//年级下拉框
        return "update";
    }

    @RequestMapping("/doUpdate")//提交更新后的数据，成功后重定向到分页查询
    public String doUpdate(Student stu){
        int n=crudService.update(stu);
        if(n>0)
            return "redirect:/select?op=updateYes";
        else
            return "redirect:/select?op=updateNo";
    }

}
