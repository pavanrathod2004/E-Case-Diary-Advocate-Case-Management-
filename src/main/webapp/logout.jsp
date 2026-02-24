<%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 21-01-2026
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LogOut</title>
</head>
<body>
<%
    HttpSession session2 = request.getSession(false);
    if(session2!=null){
        session2.invalidate(); // invalidate() function used for destroy the sesstion.
    }
    response.sendRedirect("index.jsp");
%>
</body>
</html>
