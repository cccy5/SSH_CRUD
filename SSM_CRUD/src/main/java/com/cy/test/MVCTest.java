package com.cy.test;

import com.cy.entity.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @Auther: Administrator
 * @Date: 2019/9/8 14:20
 * @Description:测试分页
 */
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring.xml",

        "classpath:springmvc.xml"

})
public class MVCTest {

//    传入springmvc的ioc,不能直接自动装配ioc容器得先注入一个WebAppConfiguration
    @Autowired
    WebApplicationContext context ;

    //虚拟mvc请求，获取处理结果
    MockMvc mockMvc ;
    @Before
    public  void initMockMVC(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build() ;
    }

    @Test
    public void test()throws Exception {
        System.out.println("1111111");
            //模拟请求拿到返回值
            MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/all").param("pn", "10")).andReturn();
          //  throw new  Exception("分页异常") ;

            MockHttpServletRequest request = mvcResult.getRequest();

            PageInfo in = (PageInfo) request.getAttribute("pageInfo");
            System.out.println("当前页码:"+in.getPageNum());
            System.out.println("总页码:"+in.getPages());

            System.out.println("总记录数:"+in.getTotal());
            System.out.println("在页面连续显示的页码");
            int[] nums = in.getNavigatepageNums();
            for (int i :nums){
                System.out.print(" "+i);
            }
            //获取员工数据
            List<Employee> inList = in.getList();
            for (Employee employee : inList){
                System.out.println("员工信息id:"+employee.getEmpId()+"姓名:"+employee.getEmpName());
            }
            System.out.println("");


    }
}