<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: raushan
  Date: 22/10/18
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection con = DBServices.getConnection();
    JSONObject obj=new JSONObject();
    try {
        int id=Integer.parseInt(request.getParameter("id"));
        float fat=Float.parseFloat(request.getParameter("fat"));
        Float snf=Float.parseFloat(request.getParameter("snf"));
        CallableStatement callableStatement = con.prepareCall("{CALL daily(?,?,?)}");
        callableStatement.setInt(1,id);
        callableStatement.setDouble(2,fat);
        callableStatement.setDouble(3,snf);
        boolean hadResults = callableStatement.execute();
        while (hadResults) {
            ResultSet resultSet = callableStatement.getResultSet();
            while (resultSet.next()) {
                obj.put("name",(resultSet.getString(1)));
                obj.put("MilkRate",(resultSet.getFloat(2)));
            }
            hadResults=callableStatement.getMoreResults();

        } }catch (SQLException e) {
        e.printStackTrace();
    }
    out.print(obj);
%>