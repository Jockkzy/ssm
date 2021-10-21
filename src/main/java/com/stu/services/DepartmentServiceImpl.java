package com.stu.services;

import com.stu.dao.DepartmentMapper;
import com.stu.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService{

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getdept() {
        return departmentMapper.selectByExample(null);
    }
}
