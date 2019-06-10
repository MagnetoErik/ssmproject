<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

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

<body style="width: 90%;">
<div id="container">
    <h2 style="margin-left: 0.5%;margin-top: 0.5%;">添加新雇员</h2>
    <div class="form-horizontal col-md-offset-3" style="margin-top: 1%;">
        <div class="form-group" >
            <label class="control-label col-md-2">雇员编号</label>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="请输入雇员编号" />
            </div>
        </div>
        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">雇员姓名</label>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="请输入雇员姓名" />
            </div>
        </div>
        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">
                性别
            </label>
            <div class="col-md-6">
                <label class="checkbox-inline">
                    <input type="checkbox" id="man" value="man" name="sex"> 男
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" id="woman" value="woman" name="sex"> 女
                </label>
            </div>
        </div>

        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">所属部门</label>
            <div class="col-md-4">
                <select class="form-control">
                    <option>市场部</option>
                    <option>人事部</option>
                    <option>财务部</option>
                    <option>研发部</option>
                    <option>测试部</option>
                </select>
            </div>
        </div>

        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">登陆密码</label>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="请输入登陆密码" />
            </div>
        </div>

        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">联系电话</label>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="请输入联系电话" />
            </div>
        </div>


        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">员工级别</label>
            <div class="col-md-4">
                <select class="form-control">
                    <option>1</option>
                    <option>1</option>
                    <option>1</option>
                    <option>1</option>
                </select>
            </div>
        </div>

        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">基本工资</label>
            <div class="col-md-4">
                <input type="text" class="form-control" placeholder="请输入基本工资" />
            </div>
        </div>

        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">雇员照片</label>
            <div class="col-md-4">
                <input type="file" class="form-control"/>
            </div>
        </div>
        <div class="form-group col-md-offset-4">
            <label class="control-label col-md-2">雇员备注</label>
            <div class="col-md-4">
                <textarea class="form-control"></textarea>
            </div>
        </div >
        <div class="form-group col-md-offset-6">
            <div class="col-md-8 col-md-offset-2">
                <button class="btn btn-primary">增加</button>
                <button class="btn btn-warning">重置</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    var vm = new Vue({
        el: '#container',
        data: {

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
            }
        },
    });
</script>