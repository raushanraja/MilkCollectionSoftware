<%@ page import="in.hexweb.DBServices" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection con = DBServices.getConnection();
    JSONObject obj=new JSONObject();
    try {
        int id=Integer.parseInt(request.getParameter("id"));
        PreparedStatement preparedStatement=con.prepareStatement("select farmer_name from farmer_info where farmer_id=?");
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()){
//            System.out.println("Hello");
            obj.put("name",(resultSet.getString("farmer_name")));
        }else {
            obj.put("error","no farmer with this id");
        }
    }catch (SQLException e) {
        System.out.println("Error");
        System.out.println(e.getMessage());

    }
    out.print(obj);
    System.out.println(obj);
%>