<%-- 
    Document   : login
    Created on : 2020-5-13, 7:10:02
    Author     : thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <style type="text/css">
        div {
            text-align: center
        }

        p.topmargin {
            margin-top: 7.5cm
        }

        div.loginBorder {
            overflow: hidden;
            position: absolute;
            width: 300px;
            height: 300px;
            background-color: white;
            padding: 2.5%;
            border-radius: 2.5%;
            left: 50%;
            top: 45%;
            margin-left: -190px;
            margin-top: -150px;
            border-radius: 15px;
        }

    </style>
    <head>
        <meta charset="UTF-8">
        <title>用户登录</title>
    </head>
    <body>
        <img width="100%" height="100%" src="image/welcome.jpg" style="position:absolute; left:0; top:0; z-index:-1;"/>
        <div>
            <h1><font color="white" size="9">欢迎来到图书管理系统</font></h1>
        </div>
        <p class="topmargin">
        <div class="loginBorder">
            <div style="font-size: 25px;">Welcome</div>
            <form class="form-horizontal" action="/bookSystem/LoginServlet" method="post">
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">

                        <input type="text" class="form-control" name="name" id="name" placeholder="请输入用户名"
                               style="width: 250px;height: 30px">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6">

                        <input type="password" class="form-control" name="password" id="inputPassword" placeholder="请输入密码"
                               style="width: 250px;height: 30px">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputyzm" class="col-sm-2 control-label">验证码</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="yzm" id="inputyzm" placeholder="请输入验证码"
                               style="width: 250px;height: 30px"><br/>
                        <font color="red" size="2"><%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%></font>
                    </div>
                    <div class="col-sm-3">
                        <img id="imgId" src="/bookSystem/code" onclick="changeImg()">
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="autoLogin"> 自动登录
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label>
                                <input type="checkbox"> 记住用户名
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input class="form-group" type="submit" width="100" value="登录" name="submit"
                               style="width: 200px;height: 30px;background-color: rgba(0,184,228,1.00);border: none;border-radius:15px;font-size:15px;"/>
                    </div>
                </div>
                <div class="form-group">
                    <a href="register.html" style="font-size: 15px;display: block; text-align: right;">注册账号-></a>
                </div>
            </form>
        </div>
    </p>
    <div algin="right"><font color="white" size="5">书籍是人类进步的阶梯</font></div>
    <div algin="right"><font color="white" size="5">--高尔基</font></div>
</body>

<script type="text/javascript">
    function changeImg() {
        //获取图片对象
        var imgObj = document.getElementById("imgId");
        //操作src属性
        imgObj.src = "/bookSystem/code?date=" + new Date().getTime();
    }
</script>
</html>
