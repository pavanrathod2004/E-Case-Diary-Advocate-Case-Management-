<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 17-01-2026
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>validation_page</title>
</head>
<body>
<h1>hello this is validation page</h1>
   <%
       String email = request.getParameter("email");
       String pass = request.getParameter("password");
       Connection con = null;
       PreparedStatement ps = null;
       ResultSet rs = null;

       try{
            Class.forName("com.mysql.cj.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advocatedata","root","Pass@123");
           ps=con.prepareStatement("select * from advocates where email=? and password=?");
           ps.setString(1,email);
           ps.setString(2,pass);
           rs= ps.executeQuery();
           if(rs.next()){
               //login
               HttpSession session1 = request.getSession();
               session1.setAttribute("username",rs.getString("username"));
               session1.setAttribute("Phone_no",rs.getString("phone"));
               session1.setAttribute("Email",rs.getString("email"));
               session1.setAttribute("Advocate_id",rs.getInt("advocate_id"));
               RequestDispatcher dis = request.getRequestDispatcher("user_home.jsp");
               dis.forward(request,response);
           }else {
               //invlid
               response.sendRedirect("error.jsp");
           }

       }catch (Exception e){
           e.printStackTrace();
       }
       finally {
           if(rs!=null)
                rs.close();
           if(con!= null)
               con.close();
       }
   %>

</body>
</html>
