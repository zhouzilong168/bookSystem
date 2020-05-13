<%-- 
    Document   : main
    Created on : 2020-5-12, 16:09:34
    Author     : thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
    </head>
    <body>
        <img width="100%" height="100%" src="image/welcome.jpg" style="position:absolute; left:0; top:0; z-index:-1;"/>
        <jsp:include page="head.jsp"/>
        <div style="float:left;width:33%;height:450px;text-align:center;line-height:height;">
            <a href="register.jsp" style="display:block;border: 2px solid rgba(170,50, 220, .6);margin: 20px;background-image:url(image/input.jpg);height:450px;line-height:450px;color:blueviolet;text-decoration:none;">
                <font size="6">录入图书</font>
            </a>
        </div>
        <div style="float:left;width:34%;height:450px;text-align:center;line-height:height;">
            <a href="ListServlet" style="display:block;border: 2px solid rgba(170,50, 220, .6);margin: 20px;background-image:url(image/query.jpg);height:450px;line-height:450px;color:blueviolet;text-decoration:none;">
                <font size="6">查询图书</font>
            </a>
        </div>
        <div style="float:left;width:33%;height:450px;text-align:center;line-height:height;">
            <a href="ListUserServlet" style="display:block;border: 2px solid rgba(170,50, 220, .6);margin: 20px;background-image:url(image/self.jpg);height:450px;line-height:450px;color:blueviolet;text-decoration:none;">
                <font size="6">列出用户</font>
            </a>
        </div>

        <!--        <table>
                    <tr>
                        <td>
                            <div style="float:left">
                                <a href="register.jsp">录入图书</a>
                            </div>
                        </td>
                        <td>
                            <div style="float:left">
                                <a href="ListServlet">查询图书</a>
                            </div>
                        </td>
                        <td>
                            <div style="float:left">
                                <a href="list.jsp">列出图书</a>
                            </div>
                        </td>
                    </tr>
                </table>-->
        <!--        <span>
                    <a href="register.jsp">录入图书</a>
                </span>
                <span>
                    <a href="ListServlet">查询图书</a>
                </span>
                <span>
                    <a href="list.jsp">列出图书</a>
                </span>-->
    </body>
</html>
