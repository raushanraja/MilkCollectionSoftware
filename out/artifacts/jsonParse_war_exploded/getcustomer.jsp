<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="in.hexweb.DBServices" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
    Connection con = DBServices.getConnection();
    JSONObject obj=new JSONObject();
    try {
        PreparedStatement preparedStatement = con.prepareStatement("select * from farmer_info where farmer_id=?");
        preparedStatement.setInt(1,Integer.parseInt(request.getParameter("id")));
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            obj.put("id",(resultSet.getInt("farmer_id")));
            obj.put("name",(resultSet.getString("farmer_name")));
            obj.put("parents_name",(resultSet.getString("parents_name")));
            obj.put("address",(resultSet.getString("address")));
            obj.put("type",(resultSet.getString("type")));
            obj.put("mobile",(resultSet.getString("mobile")));
            obj.put("savings",(resultSet.getString("savings_account")));


        }

    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
    out.print(obj);

%>