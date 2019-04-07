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
import java.sql.ResultSet;
import java.sql.SQLWarning;

import static java.time.LocalDate.now;

//@WebServlet(name = "login",urlPatterns ="/login" )
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
//        response.setHeader("Pragma", "no-cache");
        PrintWriter out = response.getWriter();
        Connection con = DBServices.getConnection();
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            PreparedStatement preparedStatement = con.prepareStatement("select * from admin_info where username=? and password=?");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                if (resultSet.getString("type").equalsIgnoreCase("admin")) {

                    session.setAttribute("username", username);
                    session.setAttribute("type", "admin");
                    session.setAttribute("sno", 1);
                    session.setAttribute("date", now());
                    session.setAttribute("shift","Morning");

                    response.sendRedirect("dashboard.jsp");
//                    rd = request.getRequestDispatcher("profileservlet");
//                    rd.forward(request, response);
//                    out.println(" <script>\n" +
//                            " var name='" + username +"'"+
//                            " </script>");
                    rd=request.getRequestDispatcher("dashboard.jsp");
//                    rd.include(request, response);

                }
            } else {
                out.println(" <script>\n" +
                        " var msg='Wrong Username or password" +
                        "'" +
                        " </script>");
                rd = request.getRequestDispatcher("index.jsp");
                rd.include(request, response);

            }

        } catch (Exception e) {
            out.println(e.getMessage());

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
