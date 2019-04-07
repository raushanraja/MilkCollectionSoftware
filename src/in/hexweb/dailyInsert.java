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
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "dailyInsert",urlPatterns = "/insertData")
public class dailyInsert extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession(false);
      PrintWriter out = response.getWriter();
      RequestDispatcher rd;

      try {
          if (session.getAttribute("username").toString().equalsIgnoreCase("admin2")) {
              Connection con = DBServices.getConnection();
              PreparedStatement preparedStatement;
              int i=0;
              int id = Integer.parseInt(request.getParameter("farmer_id"));
              int serial = Integer.parseInt(request.getParameter("serial_no"));
              String name= (request.getParameter("farmer_name"));
              String shift= (request.getParameter("shift"));
              float qty = Float.parseFloat(request.getParameter("qty"));
              float fat = Float.parseFloat(request.getParameter("fat"));
              float snf = Float.parseFloat(request.getParameter("snf"));
              float rate = Float.parseFloat(request.getParameter("MilkRate"));
              float amount = Float.parseFloat(request.getParameter("DailyAmount"));
              int dailyID=Integer.parseInt(request.getParameter("D"));
              String dateString=request.getParameter("daily_date");
              String choice=request.getParameter("Q");
              System.out.println("Id="+id);
              System.out.println("Shift="+shift);
//              System.out.println(name);
              System.out.println(serial);
              System.out.println(qty);
              System.out.println(fat);
              System.out.println(snf);
              System.out.println(amount);
              System.out.println(dateString);
              System.out.println(choice);
              System.out.println(dailyID);
                if(choice.equalsIgnoreCase("i")){
                    preparedStatement = con.prepareStatement("insert into  daily_register(Serial_no, farmer_id, shift, qty, snf, fat, MilkRate, DailyAmount, Date) values(?,?,?,?,?,?,?,?,?) ");
                    preparedStatement.setInt(1,serial);
                    preparedStatement.setInt(2,id);
                    preparedStatement.setString(3,shift);
                    preparedStatement.setFloat(4,qty);
                    preparedStatement.setFloat(5,snf);
                    preparedStatement.setFloat(6,fat);
                    preparedStatement.setFloat(7,rate);
                    preparedStatement.setFloat(8,amount);
                    preparedStatement.setString(9,dateString);
                    i =preparedStatement.executeUpdate();
                }else if(choice.equalsIgnoreCase("u")) {
                    preparedStatement=con.prepareStatement("update daily_register set Serial_no=?, farmer_id=?, shift=?, qty=?, fat=?, snf=?, MilkRate=?, DailyAmount=?,Date=? where daily_id=?");
                    preparedStatement.setInt(1,serial);
                    preparedStatement.setInt(2,id);
                    preparedStatement.setString(3,shift);
                    preparedStatement.setFloat(4,qty);
                    preparedStatement.setFloat(5,fat);
                    preparedStatement.setFloat(6,snf);
                    preparedStatement.setFloat(7,rate);
                    preparedStatement.setFloat(8,amount);
                    preparedStatement.setString(9,dateString);
                    preparedStatement.setInt(10,dailyID);
                    i =preparedStatement.executeUpdate();
                }else if(choice.equalsIgnoreCase("d")) {
                    preparedStatement = con.prepareStatement("delete from daily_register where daily_id=?");
                    i=preparedStatement.executeUpdate();

                }
              System.out.println("Id="+id);
              System.out.println("Shift="+shift);
//              System.out.println(name);
              System.out.println(serial);
              System.out.println(qty);
              System.out.println(fat);
              System.out.println(snf);
              System.out.println(amount);
              System.out.println(dateString);



              if(i>0){
                 int t=Integer.parseInt(session.getAttribute("sno").toString());
                  session.removeAttribute("sno");
                  session.setAttribute("sno",serial+1);
                  session.removeAttribute("date");
                  session.setAttribute("date",dateString);
                  session.removeAttribute("shift");
                  session.setAttribute("shift",shift);
                  response.sendRedirect("daily.jsp");
              }else {
                  System.out.println("Error Occured duting updation");
              }
          } else {
              session.setAttribute("LoginError","Wrong User or Password");
              System.out.println("MSG after login");
//              response.sendRedirect("index.jsp");
          }
      } catch (Exception e) {
          session.setAttribute("LoginError","Wrong User or Password");
          System.out.println(e.getMessage());
          out.println(e.getMessage());
          System.out.println("Before login");
//          response.sendRedirect("index.jsp");
      }
    }
}
