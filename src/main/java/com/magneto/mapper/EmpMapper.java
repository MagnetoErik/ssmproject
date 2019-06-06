package com.magneto.mapper;

import com.magneto.pojo.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {

    int login(Emp emp);

    List<Emp> selectAll();

    List<Emp> selectByKey(@Param("key") String key,@Param("value") String value);
}
