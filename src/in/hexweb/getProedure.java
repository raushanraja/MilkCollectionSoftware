package in.hexweb;

import java.sql.*;
import java.util.ResourceBundle;

public class getProedure {
    public static void main(String[] args) throws SQLException {
        Connection con = DBServices.getConnection();
        for (int i = 1; i < 4; i++) {
            CallableStatement callableStatement = con.prepareCall("{call register(?,'2018-10-01','2018-10-26')}");
            callableStatement.setInt(1,i);
            Boolean b= callableStatement.execute();
            ResultSet resultSet=callableStatement.getResultSet();
            while (resultSet.next()) {
                System.out.println(resultSet.getInt("ids"));
                System.out.println(resultSet.getString("name"));
                System.out.println(resultSet.getFloat("qty"));
                System.out.printf("%.2f\n",resultSet.getFloat("Amount"));
            }
        }
    }
}
