<%-- 
    Document   : list
    Created on : 2020-5-10, 10:53:44
    Author     : thinkpad
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>books_list</title>
    </head>
     <style>
        table,table tr th, table tr td { border:1px solid #0094ff; }
        table { text-align: center; border-collapse: collapse; padding:2px;}   
    </style>
    <body>
        <img width="100%" height="100%" src="image/welcome.jpg" style="position:absolute; left:0; top:0; z-index:-1;"/>
        <jsp:include page="head.jsp"/>
        <h3 align="center"><font color="white">图书馆馆存图书如下</font></h3>
        <table align="center">
            <thead>
            <font color="white">
                <td><font color="white">ISBN</font></td>
                <td><font color="white">title</font></td>
                <td><font color="white">author</font></td>
                <td><font color="white">publisher</font></td>
                <td><font color="white">price</font></td>
                <td><font color="white">date</font></td>
            </font>
        </thead>
        <c:forEach items="${lists}" var="val">
            <tr>
                <td><font color="white">${val.isbn}</font></td>
                <td><font color="white">${val.title}</font></td>
                <td><font color="white">${val.author}</font></td>
                <td><font color="white">${val.publisher}</font></td>
                <td><font color="white">${val.price}</font></td>
                <td><font color="white"><fmt:formatDate value="${val.date}" pattern="yyyy-MM-dd"/></font></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
