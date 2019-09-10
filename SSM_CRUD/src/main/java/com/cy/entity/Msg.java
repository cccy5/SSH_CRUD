package com.cy.entity;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: Administrator
 * @Date: 2019/9/9 21:58
 * @Description:通用返回类，用于提示信息
 */
public class Msg {
    //状态码 100成功  200失败
    private int code ;
    //提示信息
    private String message ;

    //用户要返回给浏览器的数据
    private Map<String,Object> stend = new HashMap<String, Object>() ;

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMessage("处理成功");
        return result ;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMessage("处理失败");
        return result ;
    }
    public Msg add(String key, Object value) {
        this.getStend().put(key, value) ;
        return this ;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getStend() {
        return stend;
    }

    public void setStend(Map<String, Object> stend) {
        this.stend = stend;
    }



}