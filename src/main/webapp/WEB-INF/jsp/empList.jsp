<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
    String date = format.format(new Date());
%>
<html>

<head>
    <title>Title</title>
    <meta charset="utf-8"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Vue.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/axios.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>

    <style>
        td {
            text-align: center;
        }
    </style>

</head>

<body>
<div id="container">

    <div id="main">


        <div class="form-inline" style="float: right">
            <div class="form-group">
                <label>查找条件：</label>
                <select class="form-control" v-model="key">
                    <option value="eid">雇员编号</option>
                    <option value="did">部门编号</option>
                    <option value="lid">雇员等级</option>
                    <option value="heid">添加该雇员的人员</option>
                    <option value="name">姓名</option>
                    <option value="password">密码</option>
                    <option value="phone">联系电话</option>
                    <option value="salary">工资收入</option>
                    <option value="aflag">管理员标记</option>
                    <option value="sex">性别</option>
                    <option value="photo">照片信息</option>
                </select>
            </div>
            <div class="form-group">
                <label>关键字</label>：
                <input class="form-control" v-model="value">
            </div>

            <input class="btn btn-default" id="select" name="select" value="查询" v-on:click="submitForm()"/>
            <input class="btn btn-default" value="添加" v-on:click="addEmp()"/>
        </div>
        <table align="center" class="table" id="content">
            <tr>
                <td>雇员编号</td>
                <td>姓名</td>
                <td>联系电话</td>
                <td>性别</td>
                <td>基本工资</td>
                <td>操作</td>
            </tr>
            <tbody>
            <tr v-for="(emp,index) in empList">
                <td>
                    {{emp.eid}}
                </td>
                <td>
                    {{emp.name}}
                </td>
                <td>
                    {{emp.phone}}
                </td>
                <td>
                    {{emp.sex}}
                </td>
                <td>
                    {{emp.salary}}
                </td>
                <td>
                    <button class="btn btn-warning">编辑</button>
                </td>
            </tr>
            </tbody>
        </table>
        <div align="center">
            <input type="button" class="btn" onclick="" value="首页"/>
            <input type="button" class="btn" onclick="" value="上一页"/> {{pageInfo.pageNum}}/{{pageInfo.pages}}
            <input type="button" class="btn" onclick="" value="下一页"/>
            <input type="button" class="btn" onclick="" value="尾页"/>

        </div>
    </div>
</div>
</body>
</html>
<script>
    var vm = new Vue({
        el: '#container',
        data: {
            id: '',
            key: '',
            value: '',
            pageInfo:[],
            empList: [],
        },
        methods: {
            submitForm: function (event) {
                $.ajax({
                    type: "post",
                    url: "/emp/selectByKey.action",
                    data: {
                        key: this.key,
                        value: this.value
                    },
                    success: function (res) {
                        var jsonStr = JSON.parse(res);
                        vm.empList = jsonStr.empList;
                        vm.pageInfo = jsonStr.pageInfo
                        console.log(vm.pageInfo)
                    }
                });
            },
            editEmp: function (event) {
                location.href = "${pageContext.request.contextPath}/user/toUpdate.action?id=" + this.id;
            },
            addEmp: function (event) {
                location.href="${pageContext.request.contextPath}/pages/addEmp.action"
            }
        },

        created() {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/emp/selectAll.action",
                success: function (res) {
                    var jsonStr = JSON.parse(res);
                    vm.empList = jsonStr.empList;
                    vm.pageInfo = jsonStr.pageInfo
                    console.log(vm.pageInfo)
                }
            });
        }
    });
</script>