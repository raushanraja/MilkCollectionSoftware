package in.hexweb;

import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "getname")
public class getname extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = DBServices.getConnection();
        JSONObject obj=new JSONObject();
        PrintWriter out  = response.getWriter();
        try {
            int id=Integer.parseInt(request.getParameter("id"));

            CallableStatement callableStatement = con.prepareCall("{CALL daily(?,?,?)}");
            callableStatement.setInt(1,id);
            callableStatement.setDouble(2,4.0);
            callableStatement.setDouble(3,8.0);
            boolean hadResults = callableStatement.execute();
            while (hadResults) {
                ResultSet resultSet = callableStatement.getResultSet();
                while (resultSet.next()) {
                    obj.put("name",(resultSet.getString(1)));
                }
                hadResults=callableStatement.getMoreResults();
            } }catch (SQLException e) {
            e.printStackTrace();
        }
        out.print(obj);



    }
}

