<%--
  Created by IntelliJ IDEA.
  User: raushan
  Date: 28/10/18
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
    String newShift=request.getParameter("shift");
    String newDate=request.getParameter("dailyDate");
    session.removeAttribute("date");
    session.setAttribute("date",newDate);
    session.removeAttribute("shift");
    session.setAttribute("shift",newShift);
    %>
</head>
<body>

</body>
</html>
