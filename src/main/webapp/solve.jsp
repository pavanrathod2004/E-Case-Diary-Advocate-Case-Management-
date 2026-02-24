<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 21-01-2026
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        Solved Case
    </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            margin: 0;
            padding-top: 30px;
        }

        .container {
            width: 90%;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.3);
            text-align: left;
        }

        h2 {
            margin-bottom: 20px;
            color: #f1c40f;
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        th {
            background: #3498db;
            color: white;
            padding: 10px;
            text-align: left;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #e5e7eb;
        }

        tr:hover {
            background: #ecf0f1;
        }
            .back-btn {
                background-color: #6c5ce7;
                color: white;
                border: none;
                padding: 10px 20px;
                margin-bottom: 15px;
                border-radius: 6px;
                cursor: pointer;
                transition: 0.3s;
                font-size: 14px;
                font-weight: 600;
                box-shadow: 0 4px 8px rgba(0,0,0,0.15);
                display: inline-block;
            }

            .back-btn:hover {
                background-color: #5a4bdc;
                transform: scale(1.05);
            }

            .back-btn:active {
                transform: scale(0.97);
            }

    </style>
</head>
<body>
<%
   HttpSession session1=request.getSession(false);
    Integer advId=null;
   if(session1!=null || session1.getAttribute("Advocate_id")!=null){
       advId = (Integer) session1.getAttribute("Advocate_id");
  }else{
       response.sendRedirect("index.jsp");
       return;
   }
%>
<div class="container">
    <table>
        <h2>Solved Cases</h2>
        <tr>
            <th>Case Id</th>
            <th>Client Id</th>
            <th>Client Name</th>
            <th>Phone</th>
        </tr>
        <%
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advocatedata","root","Pass@123");
                PreparedStatement sta = con.prepareStatement("select  c.case_id,c.client_id,c1.client_full_name,c1.client_phone,c.case_status from cases c join clients c1 on c.client_id=c1.client_id WHERE c.advocate_id=? and lower(case_status)='solved'");
                sta.setInt(1,advId);
                ResultSet solveResult = sta.executeQuery();
                while (solveResult.next()){
                    %>
                     <tr>
                         <td><%=solveResult.getInt(1)%></td>
                         <td><%=solveResult.getInt(2)%></td>
                         <td><%=solveResult.getString(3)%></td>
                         <td><%=solveResult.getString(4)%></td>
                     </tr>
                <%}
                con.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        %>
        <button type="button" class="back-btn" onclick="location.href='user_home.jsp' ">Back</button>
    </table>
</div>
</body>
</html>
