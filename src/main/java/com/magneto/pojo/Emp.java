package com.magneto.pojo;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("emp")
public class Emp {

    private int eid;//雇员编号
    private int did;//雇员所属部门编号
    private int lid;//雇员等级
    private int heid;//添加该雇员的人员（雇员）编号
    private String name;//雇员真实姓名
    private String password;//登录密码
    private String phone;//联系电话
    private double salary;//工资收入
    private String note;//备注
    //超级管理员标记  0:表示普通雇员,1:表示超级管理员,2:表示普通管理员。
    private int aflag;
    private String sex;//性别
    private String photo;//雇员照片

}
