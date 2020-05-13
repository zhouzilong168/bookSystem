<%-- 
    Document   : self
    Created on : 2020-5-13, 9:20:06
    Author     : thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user_list</title>
    </head>
    <style>
        table,table tr th, table tr td { border:1px solid #0094ff; }
        table { text-align: center; border-collapse: collapse; padding:2px;}   
    </style>
    <body>
        <img width="100%" height="100%" src="image/welcome.jpg" style="position:absolute; left:0; top:0; z-index:-1;"/>
        <jsp:include page="head.jsp"/>
        <h3 align="center"><font color="white">用户列出如下</font></h3>
        <table align="center">
            <thead>
            <td><font color="white">用户ID</font></td>
            <td><font color="white">用户名</font></td>
            <td><font color="white">上次登陆时间</font></td>
            <td><font color="white">登陆次数</font></td>
        </thead>
        <c:forEach items="${users}" var="v">
            <tr>
                <td><font color="white">${v.id}</font></td>
                <td><font color="white">${v.username}</font></td>
                <td><font color="white"><fmt:formatDate value="${v.beforeDate}" pattern="yyyy-MM-dd"/></font></td>
                <td><font color="white">${v.loginTimes}</font></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
