<%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 21-01-2026
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Client</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>
<%
    HttpSession session1=request.getSession(false);
    if(session1==null||session1.getAttribute("Advocate_id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
  <div class="addcase">
      <form action="addcasedatabase.jsp" method="post">
          <h2 style="text-align:center">Add Case</h2>
          <!-- First row: Full Name (single line) -->
          <label for="clientname">Full Name</label>
          <input id="clientname" type="text" name="clientName">

          <!-- Second row: Gaon + Post -->
          <div class="form-row">
              <div>
                  <label for="At">Gaon</label>
                  <input id="At" type="text" name="gaon" required>
              </div>
              <div>
                  <label for="Po">Post</label>
                  <input id="Po" type="text" name="post" required>
              </div>
          </div>

          <!-- Third row: Taluka + District -->
          <div class="form-row">
              <div>
                  <label for="Tq">Taluka</label>
                  <input id="Tq" type="text" name="taluka" required>
              </div>
              <div>
                  <label for="Dist">District</label>
                  <input id="Dist" type="text" name="dist" required>
              </div>
          </div>

          <!-- Fourth row: Phone + Email -->
          <div class="form-row">
              <div>
                  <label for="phone">Phone No</label>
                  <input id="phone" type="tel" name="phone" required>
              </div>
              <div>
                  <label for="email">Email</label>
                  <input type="email" id="email" name="email">
              </div>
          </div>

          <!-- Fifth row: Case Details -->
          <label for="caseDetails">Case Details</label>
          <input id="caseDetails" name="casedetails" style="height: 45px" required></input>

          <div class="btn-group">
              <button type="button" class="back-btn" onclick="location.href='user_home.jsp'">Back</button>

              <button type="submit" class="btn">Add Client</button>
          </div>

      </form>
      <%
          String smg2 = (String) session1.getAttribute("msg");
          if(smg2!= null){
      %>
      <p style="color: #3498db; font-weight: bold; text-align: center; margin-top:10px;"><%= smg2 %></p>
      <%
          }
          session1.removeAttribute("msg");
      %>
  </div>
</body>
</html>
