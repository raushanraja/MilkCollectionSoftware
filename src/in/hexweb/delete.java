package in.hexweb;

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

@WebServlet(name = "delete",urlPatterns = "/delete")
public class delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;
        try {
            if (session.getAttribute("username").toString().equalsIgnoreCase("admin2")) {
                int id = Integer.parseInt(request.getParameter("dailyID"));
                Connection con = DBServices.getConnection();
                JSONObject obj=new JSONObject();
                PreparedStatement preparedStatement = con.prepareStatement("delete from daily_register where daily_id=?");
                preparedStatement.setInt(1,id);
                int i=preparedStatement.executeUpdate();

                if(i>0) {
                    obj.put("message", "Deleted Successfully");
                    out.print(obj);
                }else if(i==0){
                    obj.put("message","No such entery exists");
                    out.print(obj);

                }

                else {
//                    System.out.println("Error Occured duting deletion");
                    obj.put("message","No such entery exists");
                    out.print(obj);


                }
            } else {
                session.setAttribute("LoginError","Wrong User or Password");
                response.sendRedirect("daily.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("LoginError","Wrong User or Password");
            response.sendRedirect("daily.jsp");


        }
    }
}
