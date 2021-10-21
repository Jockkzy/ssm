package com.stu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.stu.entity.Employee;
import com.stu.entity.Msg;
import com.stu.services.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.xml.transform.Source;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /*单个删除and批量删除*/
    @RequestMapping(value = "/delemp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable String ids){
        if(ids.contains("-")){
            List<Integer> del_list = new ArrayList<>();
            String[] arr_ids = ids.split("-");
            for (String id : arr_ids) {
                del_list.add(new Integer(id));
            }
            System.out.println(del_list+"??????????????");
            employeeService.deleteBatch(del_list);
        }else{
            employeeService.delemp(Integer.parseInt(ids));
        }

        return Msg.success();
    }

    @RequestMapping(value = "/updateEmp/{empId}",method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        System.out.println("-----"+employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @RequestMapping("/emp")
    public Msg getEmpByJson(@RequestParam(value = "pagenumber",defaultValue = "1")Integer pagenumber){
        PageHelper.startPage(pagenumber,5);
        List<Employee> list = employeeService.getAll();
        PageInfo page = new PageInfo(list,5);
        System.out.println(page);
        return Msg.success().add("PageInfo",page);
    }

    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    public Msg saveMsg(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            System.out.println(result.hasErrors());
            HashMap<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名："+error.getField());
                System.out.println("错误信息："+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errormsg",map);
        }else{
            int i = employeeService.saveEmp(employee);
            System.out.println(i);
            if(i>0){
                return Msg.success();
            }else{
                return Msg.fail();
            }
        }


    }

    @RequestMapping("/checkuser")
    public Msg checkUser(String empName){
        String regx="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是2-5位中文或者6-16位英文和数字的组合!");
        }
       Boolean b= employeeService.checkUser(empName);
       if(b){
           return Msg.success();
       }else {
           return Msg.fail().add("va_msg","用户名不可用");
       }
    }

    @RequestMapping("/getemp/{id}")
    public Msg getEmp(@PathVariable Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }



}
