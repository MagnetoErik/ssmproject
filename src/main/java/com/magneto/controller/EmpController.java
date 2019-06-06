package com.magneto.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.magneto.pojo.Emp;
import com.magneto.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    /**
     * 超级管理员登陆
     *
     * @param emp 超级管理员
     * @return 返回1登陆成功  0登陆失败
     */
    @RequestMapping("/login")
    @ResponseBody
    public String login(Emp emp, String verify, HttpSession session) {

        String trueVerify = (String) session.getAttribute("rand");
        if (verify.equals(trueVerify)) {
            //查询用户名密码是否存在 返回1登陆成功  0登陆失败
            int result = empService.login(emp);
            if (result > 0) {
                //将雇员信息存入session作用域
                session.setAttribute("emp", emp);
                return "success";
            } else {
                return "error";
            }
        } else {
            return "verifyError";
        }

    }


    /**
     * 分页显示雇员数据
     * @param pageNum 页码
     * @return 返回每页为9条记录的雇员信息
     */
    @RequestMapping(value="/selectAll",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String selectAll(String pageNum) {

        //分页插件
        PageHelper.startPage(1,9);
        //使用分页插件之后的雇员信息列表
        List<Emp> empList = empService.selectAll();
        //分页的所有数据
        PageInfo<Emp> pageInfo = new PageInfo<>(empList);
        //new一个Map存放分页数据和雇员信息列表
        Map<String,Object> map = new HashMap<>();
        map.put("pageInfo",pageInfo);
        map.put("empList",empList);

        //返回JSON字符串
        return JSON.toJSONString(map);


    }



    @RequestMapping(value = "/selectByKey",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String selectByKey(String key ,String value){
        //分页插件
        PageHelper.startPage(1,9);
        //使用分页插件之后的雇员信息列表
        List<Emp> empList = empService.selectByKey(key,value);
        //分页的所有数据
        PageInfo<Emp> pageInfo = new PageInfo<>(empList);
        //new一个Map存放分页数据和雇员信息列表
        Map<String,Object> map = new HashMap<>();
        map.put("pageInfo",pageInfo);
        map.put("empList",empList);

        //返回JSON字符串
        return JSON.toJSONString(map);
    }
}
