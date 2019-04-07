//package in.hexweb;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class abc {
//
//    /**
//     * JSON Array Example in Java
//     * This example helps how to use Array in JSON Object
//     */
//    public static void main(String[] args) {
//
//        JSONObject json = new JSONObject();
//        JSONArray First = new JSONArray();
//        JSONArray Last = new JSONArray();
//        Connection con = DBServices.getConnection();
//        try {
//            PreparedStatement preparedStatement = con.prepareStatement("select * from student where id=?");
//            preparedStatement.setInt(1, 123456789);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                System.out.println(resultSet.getInt("id"));
//                System.out.println(resultSet.getString("name"));
//                System.out.println(resultSet.getString("address"));
//                System.out.println(resultSet.getInt("age"));
//                System.out.println(resultSet.getString("branch"));
//
//            }
////        System.out.println("json Array :"+First);
////        json.put("firstnames", First);
////        json.put("lastnames", Last);
////        System.out.println("json Object :"+json);
////        for (int i = 0; i < 2; i++) {
////            String a=json.names().getString(i);
////            System.out.println(json.get(a));
////        }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}