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

    <script type="text/javascript">
        function deleteUser(id) {
            if (confirm("您确定要删除该用户吗？")) {
                location.href = "${pageContext.request.contextPath}/user/delete.action?id=" + id;
            }
        }

        function editUser(id) {
            location.href = "${pageContext.request.contextPath}/user/toUpdate.action?id=" + id;
        }

        function add() {
            location.href = "${pageContext.request.contextPath}/user/toAddUser.action"
        }
        function exit(){
            if(confirm('您确定要退出系统吗？' +
                '')){

            }
        }




    </script>
    <style>
        td {
            text-align: center;
        }
    </style>

</head>

<body>
<div id="container">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav col-md-4">
                    <li class="navbar-text">今天是<%=date%>
                    </li>

                </ul>


                <div class="nav navbar-nav navbar-brand col-md-4" style="text-align: center;">行政资源管理系统</div>


                <ul class="nav navbar-nav navbar-right">
                    <%--<li>--%>
                        <%--<a href="#">课表查询</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">消息中心</a>--%>
                    <%--</li>--%>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">欢迎${emp.name} <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">用户信息</a>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li>
                                <%--待处理--%>
                                <a href="javascript:void(0)" onclick="exit()">退出系统</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <ul class="nav nav-stacked col-md-2">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">人事管理</a>
            <ul class="dropdown-menu">
                <li style="text-align: center"><a href="/pages/empList.action" target="main">雇员列表</a></li>
                <li style="text-align: center"><a href="/pages/addEmp.action" target="main">添加雇员</a></li>
            </ul>
        </li>
        <li>
            <a href="#" target="main">权限</a>
        </li>
        <li>
            <a href="#">学生管理</a>
        </li>
    </ul>
    <div class="col-md-10" >
        <iframe name="main" id="main" frameborder="no" style="width: 100%;height: 85%;">
        <div class="jumbotron">
            <h1>Hello, ${emp.name}</h1>
            <p>欢迎来到，行政资源管理系统</p>
        </div>
        </iframe>
    </div>
    <footer align="center">
        <i>版权所有：Magneto</i>
    </footer>
</div>
</body>
</html>
