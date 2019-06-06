package com.magneto.service;

import com.magneto.pojo.Emp;

import java.util.List;


public interface EmpService {

    /**
     * 雇员登陆
     * @param emp  雇员
     * @return 1或者0  1代表登陆成功 0代表登陆失败
     */
    int login(Emp emp);


    /**
     * 查询雇员信息列表
     * @return  返回雇员信息列表
     */
    List<Emp> selectAll();

    /**
     * 根据指定的信息查询雇员信息列表
     * @param key 指定的条件
     * @param value  关键字
     * @return 返回雇员信息列表
     */
    List<Emp> selectByKey(String key,String value);
}
