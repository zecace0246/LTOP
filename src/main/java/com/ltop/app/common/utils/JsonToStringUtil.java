package com.ltop.app.common.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.JsonIOException;

public class JsonToStringUtil {


    public String listmap_to_json_string(List<HashMap<String, Object>> nations)
    {
        JSONArray json_arr=new JSONArray();

        for (Map<String, Object> map : nations) {

            JSONObject json_obj=new JSONObject();

            for (Map.Entry<String, Object> entry : map.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                try {
                    json_obj.put(key,value);
                } catch (JsonIOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }

            json_arr.add(json_obj);
        }
        return json_arr.toString();
    }

}
