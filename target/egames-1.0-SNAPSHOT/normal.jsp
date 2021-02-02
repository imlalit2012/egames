<%@page import="java.util.List"%>
<%@page import="com.learn.egames.entities.Category"%>
<%@page import="com.learn.egames.helper.FactoryProvider"%>
<%@page import="com.learn.egames.dao.CategoryDao"%>
<%@page import="com.learn.egames.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getType() == "admin") {
            session.setAttribute("message", "You are not an user !! Cannot access the page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-Login</title>
    </head>
    <body>
        <h1>Welcome to User Panel!</h1>
    </body>
</html>