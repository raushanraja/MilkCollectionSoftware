package in.hexweb;

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

@WebServlet(name = "edit",urlPatterns = "/edit")
public class edit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;
        try {
            if (session.getAttribute("username").toString().equalsIgnoreCase("admin2")) {
                int id = Integer.parseInt(request.getParameter("farmer_id"));
                Connection con = DBServices.getConnection();
                PreparedStatement preparedStatement = con.prepareStatement("UPDATE farmer_info SET farmer_name=?,parents_name=?,address=?,type=?,mobile=?,savings_account=? where farmer_id=?");
                String name = request.getParameter("farmer_name");
                String parents =  request.getParameter("parents_name");
                String type = request.getParameter("type").toString();
                String address = request.getParameter("address");
                String mobile = (request.getParameter("mobile"));
                String account = (request.getParameter("savings_account"));
                preparedStatement.setString(1,name);
                preparedStatement.setString(2,parents);
                preparedStatement.setString(3,address);
                preparedStatement.setString(4,type);
                preparedStatement.setString(5,mobile);
                preparedStatement.setString(6,account);
                preparedStatement.setInt(7,id);
                int i = preparedStatement.executeUpdate();

                if(i>0){
                    response.sendRedirect("address.jsp");
                }else {
                    System.out.println("Error Occured duting updation");
                }
            } else {
                session.setAttribute("LoginError","Wrong User or Password");
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            session.setAttribute("LoginError","Wrong User or Password");
            response.sendRedirect("index.jsp");


        }
    }
}
