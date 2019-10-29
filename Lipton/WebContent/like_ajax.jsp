<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String postidx = "ObjectId('" + request.getParameter("postidx") + "')";
	String useridx = (String)session.getAttribute("useridx");
	LiptonDB postlike = new LiptonDB("postlike");
	ArrayList<DBObject> post = postlike.find("{postidx : " + postidx + "}");
	
	if (post.size() == 0) {
		postlike.insert(String.format("{postidx : %s, useridxs : [%s]}", postidx, useridx));
		out.println("1");
	} else {
		ArrayList<Object> tmp = (ArrayList<Object>)post.get(0).get("useridxs");
		ArrayList<String> likeList = new ArrayList<>();
		for (Object i : tmp) likeList.add(i.toString());
		
		if (likeList.contains(useridx.split("\\'")[1])) {
			likeList.remove(likeList.indexOf(useridx.split("\\'")[1]));
			StringBuilder sb = new StringBuilder("[");
			for (int i = 0; i < likeList.size(); i++) {
				sb.append("ObjectId('");
				sb.append(likeList.get(i));
				sb.append("')");
				if (i != likeList.size() - 1) sb.append(", ");
			}
			sb.append("]");
			postlike.update("{postidx : " + postidx + "}", String.format("{$set : {useridxs : %s}}", sb.toString()));
			out.println("0");
		} else {
			likeList.add(useridx.split("\\'")[1]);
			StringBuilder sb = new StringBuilder("[");
			for (int i = 0; i < likeList.size(); i++) {
				sb.append("ObjectId('");
				sb.append(likeList.get(i));
				sb.append("')");
				if (i != likeList.size() - 1) sb.append(", ");
			}
			sb.append("]");
			postlike.update("{postidx : " + postidx + "}", String.format("{$set : {useridxs : %s}}", sb.toString()));
			out.println("1");
		}
	}
%>