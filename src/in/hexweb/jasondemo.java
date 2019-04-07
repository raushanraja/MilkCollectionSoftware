package in.hexweb;

import org.json.JSONArray;
import org.json.JSONObject;

public class jasondemo {

    public static void main(String[] args) {
        farmerJSON ja = new farmerJSON();
        ja.jsonAdd("a",2.2f,2.3f,2.4f,5f,7.1f,"2018");
        ja.jsonAdd("ab",2.2f,2.3f,2.4f,5f,7.1f,"2018");


        System.out.println(ja.jsonArray);

    }
}
