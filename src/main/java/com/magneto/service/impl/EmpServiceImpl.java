package com.magneto.service.impl;

import com.magneto.mapper.EmpMapper;
import com.magneto.pojo.Emp;
import com.magneto.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("empService")
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    @Override
    public int login(Emp emp) {
////        MD5密码加密方式
//        String MD5Password = Md5Encrypt.MD5(emp.getPassword());
//        emp.setPassword(MD5Password);
        return empMapper.login(emp);
    }


    @Override
    public List<Emp> selectAll(){
        return empMapper.selectAll();
    }

    @Override
    public List<Emp> selectByKey(String key, String value) {
        return empMapper.selectByKey(key,value);
    }
}
