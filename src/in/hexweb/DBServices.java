package in.hexweb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBServices {
    static private Connection con;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/milk","root","password");
            if (con != null) {
                System.out.println("Connection is ok");
            } else {
                System.out.println("Connection is not okay");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        return con;
    }
}
