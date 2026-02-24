<%--
  Created by IntelliJ IDEA.
  User: pavan
  Date: 21-01-2026
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view_cases</title>
</head>
<body>
<%
    HttpSession session1=request.getSession(false);
    if(session1==null||session1.getAttribute("Advocate_id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
%>
<form action="addcasedatabase.jsp" method="post">
    <label for="state">State</label>
    <select id="state" name="state" onchange="loadDistricts()">
        <option value="">--Select State--</option>
        <option value="Maharashtra">Maharashtra</option>
        <option value="Andhra Pradesh">Andhra Pradesh</option>
        <option value="Assam">Assam</option>
        <option value="Bihar">Bihar</option>
        <option value="Chhattisgarh">Chhattisgarh</option>
        <option value="Goa">Goa</option>
        <option value="Gujarat">Gujarat</option>
        <option value="Haryana">Haryana</option>
        <option value="Himachal Pradesh">Himachal Pradesh</option>
        <option value="Jharkhand">Jharkhand</option>
        <option value="Karnataka">Karnataka</option>
        <option value="Kerala">Kerala</option>
        <option value="Madhya Pradesh">Madhya Pradesh</option>
        <option value="Odisha">Odisha</option>
        <option value="Punjab">Punjab</option>
        <option value="Rajasthan">Rajasthan</option>
        <option value="Tamil Nadu">Tamil Nadu</option>
        <option value="Telangana">Telangana</option>
        <option value="Tripura">Tripura</option>
        <option value="Uttar Pradesh">Uttar Pradesh</option>
        <option value="Uttarakhand">Uttarakhand</option>
        <option value="West Bengal">West Bengal</option>
        <option value="Other">Other</option>
    </select>

    <label for="district">District</label>
    <select id="district" name="district" onchange="loadTalukas()">
        <option value="">--Select District--</option>
    </select>

    <label for="taluka">Taluka</label>
    <select id="taluka" name="taluka">
        <option value="">--Select Taluka--</option>
    </select>

    <button type="submit">Submit</button>
</form>

</body>
</html>
