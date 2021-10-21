package com.stu.services;

import com.stu.dao.EmployeeMapper;
import com.stu.entity.Employee;
import com.stu.entity.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService{

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public int saveEmp(Employee employee) {
        return employeeMapper.insertSelective(employee);
    }

    @Override
    public Boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count= employeeMapper.countByExample(example);
        return count==0;
    }

    @Override
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateEmp(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee);
    }

    @Override
    public int delemp(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public void deleteBatch(List<Integer> del_list) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(del_list);
        employeeMapper.deleteByExample(example);
    }
}
