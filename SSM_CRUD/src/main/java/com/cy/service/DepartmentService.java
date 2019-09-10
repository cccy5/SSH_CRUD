package com.cy.service;

import com.cy.dao.DepartmentMapper;
import com.cy.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/9/10 23:28
 * @Description: depart
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper ;


    public List<Department> getAllDept() {

        List<Department> departments = departmentMapper.selectByExample(null);
        return departments ;
    }
}