package com.stu.services;

import com.stu.entity.Employee;
import com.stu.entity.Msg;

import java.util.List;

public interface EmployeeService {

    List<Employee> getAll();

    int saveEmp(Employee employee);

    Boolean checkUser(String empName);

    Employee getEmp(Integer id);

    int updateEmp(Employee employee);

    int delemp(Integer empId);

    void deleteBatch(List<Integer> del_list);
}
