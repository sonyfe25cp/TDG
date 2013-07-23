package com.omartech.tdg.test;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

//import com.google.gson.reflect.TypeToken;

public class GsonTest {

//	public static String getResultsJson(Results results) {
//		return null;
//	}
//
//	public static String getResultsUnitJson(ResultsUnit resultsUnit) {
//		String json=gson.toJson(resultsUnit, ResultsUnit.class);
//		return json;
//	}
//	
//	public static Results getResultsFromJson(String json){
//		return null;
//	}
//	
//	public static ResultsUnit getResultsUnitFromJson(String json){
//		ResultsUnit unit=gson.fromJson(json, new TypeToken<ResultsUnit>(){}.getType());
//		return unit;
//	}
	
	public static void main(String[] args){
//		List<ValuePair> pairs = new ArrayList<ValuePair>();
//		pairs.add(new ValuePair("a","b"));
//		pairs.add(new ValuePair("a1","b"));
//		pairs.add(new ValuePair("a2","b"));
//		pairs.add(new ValuePair("a3","b"));
//		pairs.add(new ValuePair("a4","b"));
//		Gson gson = new Gson();
//		String json=gson.toJson(pairs, List.class);
//		System.out.println(json);
//		
//		String params = "{1101:2,1201:3}|{1301:1,1201:2}";
//		String tmps[] = params.split("\\|"); 
//		for(String tmp : tmps){
//			System.out.println(tmp);
//		}
	}
}
class ValuePair{
	String key;
	String value;
	public ValuePair(String key, String value){
		this.key = key;
		this.value = value;
	}
}
