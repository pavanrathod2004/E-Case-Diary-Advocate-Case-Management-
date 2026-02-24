<%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 23-01-2026
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Case</title>
    <style>
        /* Page background */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: flex-start; /* top alignment */
            min-height: 100vh;
            margin: 0;
            padding: 40px 0;
        }

        /* Main form container */
        .delete1 {
            background-color: #2c3e50;
            color: #ecf0f1;
            width: 450px;
            height: 400px;           /* height reduced */
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.3);
            margin-top: 55px;        /* push down slightly */
            margin-bottom: 40px;     /* distance from bottom */
            box-sizing: border-box;
            position: relative;
        }

        /* Form title */
        .delete1 h2 {
            text-align: center;
            margin-bottom: 15px;
            color: #e74c3c;
        }

        /* Labels */
        .delete1 label {
            display: block;
            margin-top: 8px;
            font-weight: bold;
            font-size: 13px;
        }

        /* Inputs */
        .delete1 input {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: none;
            border-radius: 6px;
            outline: none;
            font-size: 13px;
            box-sizing: border-box;
        }

        /* Input focus effect */
        .delete1 input:focus {
            border: 2px solid #3498db;
            background-color: #f9f9f9;
        }

        /* Submit button */
        .delete1 button {
            width: 100%;
            margin-top: 18px;
            padding: 9px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 13px;
            font-weight: bold;
            background-color: #e74c3c;
            color: #ffffff;
            transition: 0.3s ease;
        }

        .delete1 button:hover {
            background-color: #c0392b;
            transform: scale(1.03);
        }

        /* Message text */
        .delete1 .msg {
            position: absolute;
            bottom: 15px;
            left: 0;
            width: 100%;
            text-align: center;
            font-weight: bold;
            font-size: 13px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #ecf0f1;
        }

        /* Mobile responsive */
        @media (max-width: 400px) {
            .delete1 {
                width: 90%;
                height: 400px;
                padding: 20px;
            }

            .delete1 .msg {
                font-size: 12px;
            }

            .delete1 button {
                font-size: 12px;
                padding: 8px;
            }
        }
    </style>

</head>
<body>
<%
    HttpSession session1=request.getSession(false);
    if(session1==null || session1.getAttribute("Advocate_id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
<div class="delete1">
    <form action='delete'  method="post">
        <h2>Delete Case</h2>


        <label for="clientId">ClientId</label>
        <input type="number" id="clientId" name="clientid" placeholder="Client Id" required>
        <button type="button" onclick="location.href='user_home.jsp'">Back</button>
        <button type="submit" >Delete Case</button>
        <%
            String msg =(String) session1.getAttribute("msg");
            if(msg!=null){
                %>
        <div class="msg"><%= msg %></div>

        <%
                session1.removeAttribute("msg");
            }
        %>

    </form>
</div>

</body>
</html>
