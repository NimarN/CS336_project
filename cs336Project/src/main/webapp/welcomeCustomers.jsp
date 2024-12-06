<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Homepage</title>
</head>
<body>

<%
    if (session.getAttribute("user") == null) {
%>
    <p>You are not logged in.</p>
    <a href="login.jsp">Please Login</a>
<%
    } else {
%>
    <h1>Welcome to the Customers Homepage</h1>
    <p>Welcome, <%= session.getAttribute("user") %>!</p>
	
	
    <form action="scheduleResults.jsp" method="POST">
    	<h2>Search For Train Schedule</h2>
    	<div>
            <label for="transit_line">Origin:</label>
            <select name="transit_line" required>
                <option value="Newark Express">Newark Express</option>
                <option value="A-Line">A-line</option>
                
            </select>
        </div>
        
        <div>
            <label for="origin">Origin:</label>
            <select id="origin" name="origin" required>
            	<optgroup label="Stations for Newark Express">
	                <option value="Princeton">Princeton</option>
	                <option value="Rutgers">Rutgers</option>
	                <option value="Newark Penn">Newark Penn</option>
	            </optgroup>
	            <optgroup label="Stations for A-Line">
	                <option value="College Ave Student Center">College Ave Student Center</option>
	                <option value="The Yard">The Yard</option>
	                <option value="Student Activities Center">Student Activities Center</option>
	                <option value="Stadium West Lot">Stadium West Lot</option>
	                <option value="Hill Center">Hill Center</option>
	                <option value="Busch Student Center">Busch Student Center</option>
	                <option value="Werblin Recreation Center">Werblin Recreation Center</option>
	             </optgroup>
                
            </select>
        </div>
        

        <div>
            <label for="destination">Destination:</label>
            <select id="destination" name="destination" required>
                <optgroup label="Stations for Newark Express">
	                <option value="Princeton">Princeton</option>
	                <option value="Rutgers">Rutgers</option>
	                <option value="Newark Penn">Newark Penn</option>
	            </optgroup>
	            <optgroup label="Stations for A-Line">
	                <option value="College Ave Student Center">College Ave Student Center</option>
	                <option value="The Yard">The Yard</option>
	                <option value="Student Activities Center">Student Activities Center</option>
	                <option value="Stadium West Lot">Stadium West Lot</option>
	                <option value="Hill Center">Hill Center</option>
	                <option value="Busch Student Center">Busch Student Center</option>
	                <option value="Werblin Recreation Center">Werblin Recreation Center</option>
	             </optgroup>                  
            </select>
        </div>
        

        <div>
            <label for="travel_date">Date of Travel:</label>
            <input type="date" name="date" required>
        </div>
        

        <input type="submit" value="Search">
    </form>
	<a href = "makeReservation.jsp">Make a Reservation</a>
    <br>
    <a href="logout.jsp">Log out</a>

<%
    }
%>

</body>
</html>