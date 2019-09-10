package com.cy.controller;

import com.cy.entity.Employee;
import com.cy.entity.Msg;
import com.cy.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/9/8 13:42
 * @Description:employee控制器
 */
@Controller
@RequestMapping("emp")
public class EmployeeController {

   @Autowired
   EmployeeService employeeService ;


    public  String getAllEmpls(@RequestParam(value = "pn",defaultValue = "1") int pn, Model model){
        //引入pagehelper分页插件
        //在查询前只需要调用，传入页码 以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的就是一个分页查询

        List<Employee> list =  employeeService.getAll() ;
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(list,5);
        model.addAttribute("pageInfo",page) ;

        return "list" ;
    }
    @RequestMapping("test")
    public void test(HttpServletResponse response, HttpServletRequest request) throws Exception {
        response.sendRedirect(request.getContextPath()+"/emp/all");
    }


    @RequestMapping("getAll")
    @ResponseBody
    public Msg getALL(@RequestParam(value = "pn",defaultValue = "1") int pn){
        //在查询前只需要调用，传入页码 以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的就是一个分页查询

        List<Employee> list =  employeeService.getAll() ;
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(list,5);
        return Msg.success().add("pageInfo",page) ;
    }


}