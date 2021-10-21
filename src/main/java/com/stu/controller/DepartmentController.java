package com.stu.controller;

import com.stu.entity.Department;
import com.stu.entity.Msg;
import com.stu.services.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/dept")
    public Msg getDept(){
        List<Department> list = departmentService.getdept();
        return Msg.success().add("depts",list);
    }
}
