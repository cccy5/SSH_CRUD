package com.cy.test;

import com.cy.dao.DepartmentMapper;
import com.cy.dao.EmployeeMapper;
import com.cy.entity.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @Auther: Administrator
 * @Date: 2019/8/30 22:49
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})

public class MapperTest {


    @Autowired
   EmployeeMapper employeeMapper;

    @Autowired
    DepartmentMapper departmentMapper ;
    @Autowired
    SqlSession sqlSession ;
    @Test
    public void T(){
//        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml") ;
//
//        DepartmentMapper departmentMapper  = ac.getBean(DepartmentMapper.class) ;

//        Department department = new Department() ;
//
//        department.setDeptName("资源部");
//        departmentMapper.insert(department) ;

        EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class) ;

        for (int i = 0 ; i < 1000 ; i++){
            String uid = UUID.randomUUID().toString().substring(1, 7)+i;
            employeeMapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",2)) ;
        }
        System.out.println("执行完成");
    }
}