package in.hexweb;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "farmerRegister",urlPatterns = "/fregister")
public class farmerRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = DBServices.getConnection();
        HttpSession session = request.getSession(false);
        farmerJSON fr= new farmerJSON();
        System.out.println("Enterd");
        try {

            if (session.getAttribute("type").toString().equalsIgnoreCase("admin")) {
                try {
                    int id=Integer.parseInt(request.getParameter("id"));
                    String date1=request.getParameter("date1");
                    String date2=request.getParameter("date2");
                    PreparedStatement preparedStatement  = con.prepareStatement("select farmer_id,shift,qty,fat,snf,DailyAmount, MilkRate,Date from daily_register where farmer_id=? and Date>=? and Date<=?");
                    preparedStatement.setInt(1,id);
                    preparedStatement.setString(2,date1);
                    preparedStatement.setString(3,date2);
                    ResultSet resultSet=preparedStatement.executeQuery();
                    while (resultSet.next()){
                        System.out.println(resultSet.getInt("farmer_id"));
                        System.out.println(resultSet.getString("shift"));
                        System.out.println(resultSet.getFloat("qty"));
                        System.out.println(resultSet.getFloat("fat"));
                        System.out.println(resultSet.getFloat("snf"));
                        System.out.println(resultSet.getFloat("DailyAmount"));
                        System.out.println(resultSet.getFloat("MilkRate"));
                        System.out.println(resultSet.getString("Date"));
                        int ID = (resultSet.getInt("farmer_id"));
                        String shift= (resultSet.getString("shift"));
                        float qty= (resultSet.getFloat("qty"));
                        float fat= (resultSet.getFloat("fat"));
                        float snf=(resultSet.getFloat("snf"));
                        float amount=(resultSet.getFloat("DailyAmount"));
                        float rate=(resultSet.getFloat("MilkRate"));
                        String DatE=(resultSet.getString("Date"));
                        fr.jsonAdd(shift,qty,fat,snf,rate,amount,DatE);


                    }
                    System.out.println(fr.getJsonArray());

                    PrintWriter out = response.getWriter();
                    out.print(fr.getJsonArray());

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }else {
                response.sendRedirect("index.jsp");
            }


        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
    }
}
