package in.hexweb;

import org.json.JSONArray;
import org.json.JSONObject;

public class farmerJSON {

    JSONArray jsonArray= new JSONArray();
    void jsonAdd(String shift,float qty,float fat,float snf,float rate,float amount,String date){
        JSONObject object = new JSONObject();
        object.put("shift",shift);
        object.put("qty",qty);
        object.put("fat",fat);
        object.put("snf",snf);
        object.put("DailyAmount",amount);
        object.put("MilkRate",rate);
        object.put("Date",date);
        jsonArray.put(object);
    }

    public JSONArray getJsonArray() {
        return jsonArray;
    }
}
