package com.cy.controller;

import com.cy.entity.Department;
import com.cy.entity.Msg;
import com.cy.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/9/10 23:26
 * @Description:部门控制器
 */
@Controller
@RequestMapping("dept")
public class DepatrmentController {
    @Autowired
    private DepartmentService departmentService ;

    /**
     * @param:
     * @return:返回所有的部门信息
     * @date: 2019/9/10
     */
    @RequestMapping("all")
    @ResponseBody
    public Msg getDepts(){
        //
        List<Department> departments = departmentService.getAllDept() ;
        return Msg.success().add("depts",departments);
    }
}