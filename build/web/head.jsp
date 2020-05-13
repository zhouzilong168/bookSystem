<%-- 
    Document   : head
    Created on : 2020-5-13, 8:17:26
    Author     : thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>head</title>
    </head>
    <body>
        <div align="center">
            <font color="white" size="9">欢迎来到图书管理系统</font>
        </div>
        <span align="left">
            <font color="green" size="6">欢迎回来^v^</font>
            <font color="red" size="5">---${username}</font>
        </span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span align="center">
            <font color="green" size="6">上次登登陆时间：</font>
            <font color="red" size="5">${beforeDate}</font>
        </span>
        <span align="right">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <font color="green" size="6">当前登陆次数：</font>
            <font color="red" size="5">${loginTimes}</font>
        </span>
    </body>
</html>
