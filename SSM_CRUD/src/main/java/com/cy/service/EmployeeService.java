package com.cy.service;

import com.cy.dao.EmployeeMapper;
import com.cy.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/9/8 13:54
 * @Description:
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper ;

    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDepartment(null);
    }
}