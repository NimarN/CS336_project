<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
<h1>Customer Rep Homepage</h1>
Welcome <%=session.getAttribute("user")%> 
<a href='logout.jsp'>Log out</a>
<%
}
%>