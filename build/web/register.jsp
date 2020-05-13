<%-- 
    Document   : record
    Created on : 2020-5-10, 10:53:29
    Author     : thinkpad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>books_input</title>
    </head>
    <body>
        <img width="100%" height="100%" src="image/welcome.jpg" style="position:absolute; left:0; top:0; z-index:-1;"/>
        <jsp:include page="head.jsp"/>
        <div align="center">
            <h2><font color="white">欢迎录入图书</font></h2>
            <form action="RegisterServlet" method="post">
                <table>
                    <tr>
                        <td><font color="white">ISBN:</font></td>
                        <td><input type="text" name="ISBN"/><br/></td>
                    </tr>
                    <tr>
                        <td><font color="white">title:</font></td>
                        <td><input type="text" name="title"/><br/></td>
                    </tr>
                    <tr>
                        <td><font color="white">author:</font></td>
                        <td><input type="text" name="author"/><br/></td>
                    </tr>
                    <tr>
                        <td><font color="white">publisher:</font></td>
                        <td><input type="text" name="publisher"/><br/></td>
                    </tr>
                    <tr>
                        <td><font color="white">price:</font></td>
                        <td><input type="text" name="price"/><br/></td>
                    </tr>
                    <tr>
                        <td><font color="white">date:</font></td>
                        <td><input type="text" name="date"/><br/></td>
                    </tr>
                </table>
            <input type="submit" value="submit"/>
            </form>
        </div>
    </body>
</html>
