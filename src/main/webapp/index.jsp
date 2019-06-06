<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {
                var name = $("#name").val();
                if (name == null && name == '') {
                    alert('请输入用户名!');
                    return;
                }
                var password = $("#password").val();
                if (password == null && password == '') {
                    alert('请输入密码!');
                    return;
                }
                var verify = $("#verify").val();
                if (verify == null && verify == '') {
                    alert('请输入验证码!');
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "/emp/login.action",
                    data: {name: name, password: password, verify: verify},
                    success: function (str) {
                        if (str == "success") {
                            window.location.href = "/pages/home.action";
                        }
                        else if (str == "verifyError") {
                            alert('验证码错误');
                            window.location.href = "index.jsp"
                        }
                        else {
                            alert('用户名或密码错误');
                            window.location.href = "index.jsp"
                        }
                    }
                })

            });
        });

        function refresh(){
            document.getElementById("verifyImg").src="verify.action?"+Math.random()
        }

    </script>
</head>
<body>
<div class="container">
    <h2 class="col-sm-offset-1">用户登录</h2>
    <hr style="border: 1px solid black; width: 100%"/>
    <form action="${pageContext.request.contextPath}/user/login.action" method="post" id="loginForm"
          class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名:</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="name" name="name"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">密码:</label>
            <div class="col-sm-3">
                <input type="password" class="form-control" id="password" name="password"/>
                <%--<a href="../reg.jsp">还没有账号？点击注册</a>--%>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">验证码:</label>
            <div class="col-sm-3 form-inline">
                <input type="text" id="verify" name="verify" class="form-control" style="width: 160px"/>
                <a href="javascript:void(0);" onclick="refresh()"><img id="verifyImg" src="verify.action" title="验证码"></a>
            </div>
        </div>
        <div class="form-group">
            <input type="button" class="btn col-sm-offset-3" value="登录" id="login"/>
            <input type="reset" class="btn" value="重置"/>
        </div>
    </form>
    <hr style="border: 1px solid black; width: 100%"/>
    <span style="color: red">${msg}</span>
</div>
</body>
</html>
