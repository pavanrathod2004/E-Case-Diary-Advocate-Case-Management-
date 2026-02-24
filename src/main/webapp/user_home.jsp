<%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 17-01-2026
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<%
    HttpSession session2 = request.getSession(false);
    Integer advId = (Integer) session2.getAttribute("Advocate_id");
    String name = (String) session2.getAttribute("username");
    if( advId==null||advId <0){
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>Advocate Dashboard</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 220px;
            height: 100%;
            background: #2c3e50;
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.3);
        }

        .sidebar h2 {
            color: #f1c40f;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: #ecf0f1;
            padding: 12px 20px;
            text-decoration: none;
            font-size: 15px;
            border-radius: 6px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #3498db;
            color: #fff;
            transform: scale(1.05);
        }

        /* Main content */
        .main {
            margin-left: 240px;
            padding: 20px;
        }

        .main h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }


        .card {
            display: inline-block;
            width: 220px;
            margin: 10px;
            padding: 20px;
            background: #2c3e50;
            color: #ecf0f1;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.3);
            text-align: center;
        }

        .card h3 {
            margin: 0;
            color: #f1c40f;
            font-size: 16px;
        }

        .card p {
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
            color: #2ecc71;
        }

        /* Table */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        table th {
            background: #3498db; /* blue header */
            color: white;
            padding: 12px;
            text-align: left;
        }

        table td {
            padding: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        table tr:hover {
            background: #f9f9f9;
        }

        h2 {
            margin-top: 30px;
            color: #2c3e50;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main {
                margin-left: 0;
            }

            .card {
                width: 90%;
            }
        }

        .card-link {
            text-decoration: none;
            color: inherit;
            display: inline-block;
        }

        #card1:hover {
            transform: scale(0.95);
            cursor: pointer;
        }

        #card1:active {
            transform: scale(0.90);
        }

    </style>

</head>
<body >
<%
    HttpSession session1 = request.getSession(false);
    if(session1==null||session1.getAttribute("Advocate_id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
   <div class="sidebar">
       <h2>Welcome,<%=name%></h2>

       <a href="user_home.jsp">Home</a>
       <a href="caseadd.jsp">Add Client and Case</a>
       <a href="pendig.jsp">Pending Case</a>
       <a href="solve.jsp">Solve Case</a>
       <a href="delete.jsp">Delete Case</a>
       <a href="logout.jsp" style="color: #f87171">LogOut</a>
   </div>

   <div class="main">
       <h1>Welcome To Advocate Dashboard</h1>
       <%
           int caseTotal =0 , casePending=0,caseSolved=0;
           Connection con = null;
           PreparedStatement tatalCase = null;
           PreparedStatement totalPending= null;
           PreparedStatement totalSolved = null;
      try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advocatedata","root","Pass@123");
           tatalCase = con.prepareStatement(" select count(*) from cases where advocate_id=?");
           tatalCase.setInt(1,advId);
           ResultSet rsTotal = tatalCase.executeQuery();
           if(rsTotal.next()){
               caseTotal=rsTotal.getInt(1);
           }

           // pending case
           totalPending = con.prepareStatement("select count(*) from cases where  advocate_id=? and case_status='Pending'");
           totalPending.setInt(1,advId);
           ResultSet rsTotalPending = totalPending.executeQuery();
           if(rsTotalPending.next()){
               casePending = rsTotalPending.getInt(1);
           }

           // solved case

          totalSolved= con.prepareStatement("select count(*) from cases where  advocate_id=? and case_status='Solved'");
           totalSolved.setInt(1,advId);
           ResultSet rsTotalSolve= totalSolved.executeQuery();
           if(rsTotalSolve.next()){
               caseSolved=rsTotalSolve.getInt(1);
           }
          con.close();
      } catch (Exception e) {
          e.printStackTrace();
      }

       %>
       <div class="card">
           <h3>Total Case</h3>
           <p><%=caseTotal%></p>
       </div>
       <div class="card">
           <h3>Total Solve</h3>
           <p><%=caseSolved%></p>
       </div>
       <div class="card">
           <h3>Total Pending</h3>
           <p><%=casePending%></p>
       </div>

       <a href="view_cases.jsp" class="card_link" >
           <div id="card1" class="card">
               <h3 style="color: deeppink">View Your</h3>
               <p style="color: deeppink">cases</p>
           </div>
       </a>
       <h2>Latest Cases</h2>
       <table>
           <tr>
           <th>Case Id</th>
           <th>Client Id</th>
           <th>Client Name</th>
           <th>Status</th>
           </tr>

           <%
               try{

                   Connection con2 =DriverManager.getConnection("jdbc:mysql://localhost:3306/advocatedata","root","Pass@123");
                   PreparedStatement caseData = con2.prepareStatement("select  c.case_id,c.client_id,c1.client_full_name,c.case_status from cases c join clients c1 on c.client_id=c1.client_id WHERE c.advocate_id=? order by case_id DESC  LIMIT 10 ");
                   caseData.setInt(1,advId);
                   ResultSet rsResultLates = caseData.executeQuery();
                   while (rsResultLates.next()) {%>
                <tr>
                 <td><%= rsResultLates.getInt("case_id") %></td>
                 <td><%= rsResultLates.getInt("client_id") %></td>
                <td><%= rsResultLates.getString("client_full_name") %></td>
                <td><%= rsResultLates.getString("case_status") %></td>
           </tr>

           <%}
                   con2.close();
               }catch (Exception e){
                   e.printStackTrace();
               }


           %>
       </table>
   </div>
<%--<%--%>
<%--     String uname = (String) session2.getAttribute("username");--%>
<%--     String phoneNo = (String) session2.getAttribute("Phone_no");--%>
<%--     String email = (String) session2.getAttribute("Email");--%>
<%--&lt;%&ndash;%>&ndash;%&gt;--%>
<%--<h2 >UserName : <%=uname %></h2>--%>
<%--<h2 >Password : <%=phoneNo%></h2>--%>
<%--<h2>Email    : <%=email%></h2>--%>
</body>
</html>
