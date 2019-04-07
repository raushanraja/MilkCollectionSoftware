package in.hexweb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "addrecord",urlPatterns = "/add")
public class addrescor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Connection con = DBServices.getConnection();
        HttpSession session = request.getSession(false);
        try {
            if (session.getAttribute("type").toString().equalsIgnoreCase("admin")) {
                PreparedStatement preparedStatement = con.prepareStatement("insert into farmer_info values (?,?,?,?,?,?,?)");
                int id = Integer.parseInt(request.getParameter("farmer_id"));
                String name = request.getParameter("farmer_name");
                String parents =  request.getParameter("parents_name");
                String type = request.getParameter("type");
                String address = request.getParameter("address");
                String mobile = (request.getParameter("mobile"));
                String account = (request.getParameter("savings_account"));
                System.out.println(id);
                System.out.println(name);
                System.out.println(parents);
                System.out.println(type);
                System.out.println(address);
                System.out.println(mobile);
                System.out.println(account);
                preparedStatement.setInt(1, id);
                preparedStatement.setString(2,name);
                preparedStatement.setString(3,parents);
                preparedStatement.setString(4,address);
                preparedStatement.setString(5,type);
                preparedStatement.setString(6, mobile);
                preparedStatement.setString(7, account);
                int i = preparedStatement.executeUpdate();
                if (i > 0) {
                    session.setAttribute("addFlag",1);
                    response.sendRedirect("address.jsp");
                }else {
                    session.setAttribute("addFlag",0);
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            response.sendRedirect("index.jsp");
        }
    }
}
