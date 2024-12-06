<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String transit_line = request.getParameter("transit_line");
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String date = request.getParameter("date");
		
		String sqlFirstStation;
		String sqlSecondStation;
		
		int origin_order = 0;
		int destination_order = 0;
		String direction = "";
		String getOrder = "select stops.stop_order "+
				"from stops, station " +
				"where stops.transit_name = ? and " +
				"station.name = ? and " +
				"stops.station_id = station.sid " +
				"LIMIT 1 ";
		PreparedStatement getOriginOrderStmt = con.prepareStatement(getOrder);
		getOriginOrderStmt.setString(1, transit_line);
		getOriginOrderStmt.setString(2, origin);
		ResultSet originOrderRS = getOriginOrderStmt.executeQuery();
		if (originOrderRS.next()) {	
			origin_order = originOrderRS.getInt("stop_order");
		} 
		
		PreparedStatement getDestOrderStmt = con.prepareStatement(getOrder);
		getDestOrderStmt.setString(1, transit_line);
		getDestOrderStmt.setString(2, destination);
		ResultSet destOrderRS = getDestOrderStmt.executeQuery();
		if (destOrderRS.next()) {
			destination_order = destOrderRS.getInt("stop_order");
		} 
		
		
		if (originOrderRS.getInt("stop_order") < destOrderRS.getInt("stop_order")) {
			direction = "forward";
			sqlFirstStation = origin;
			sqlSecondStation = destination;
			
		} else {
			direction = "backward";
			sqlFirstStation = destination;
			sqlSecondStation = origin;
		}
		
		String sql = 
			    "SELECT stops.transit_name, station.name as station_name, station.city, station.state, stops.arrival_time, stops.departure_time " +
			    "FROM station, stops " +
			    "WHERE station.sid = stops.station_id " +
			    "AND stops.transit_name = ? " +
			    "AND stops.direction = ? " +
			    "AND stops.stop_order >= ( " +
			    "    SELECT stops.stop_order " +
			    "    FROM station, stops " +
			    "    WHERE station.sid = stops.station_id " +
			    "    AND station.name = ? " +
			    "    LIMIT 1 " +
			    ") " +
			    "AND stops.stop_order <= ( " +
			    "    SELECT stops.stop_order " +
			    "    FROM station, stops " +
			    "    WHERE station.sid = stops.station_id " +
			    "    AND station.name = ? " +
			    "    LIMIT 1 " +
			    ") " +
			    "ORDER BY arrival_time";
		int numStops = 0;
		float fare = 0;	 	
		
		String fareQuery = "select fare, num_stops from transit_line where name = ?";
		PreparedStatement fareStmt = con.prepareStatement(fareQuery);
		fareStmt.setString(1, transit_line);
		ResultSet fareRs = fareStmt.executeQuery();
		if (fareRs.next()){
			fare = fareRs.getFloat("fare");
			numStops = fareRs.getInt("num_stops");
		}
		
		float farePerStop = fare/numStops;
	    
	    
	    PreparedStatement stmt = con.prepareStatement(sql);
	    stmt.setString(1, transit_line);
	    stmt.setString(2, direction);
	    stmt.setString(3, sqlFirstStation);
	    stmt.setString(4, sqlSecondStation);
	    
	    ResultSet rs = stmt.executeQuery();
	    
	    out.print("</h1>");
	    out.print("<table style = 'border: 1px solid black;>'");
	  //make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("<b>Transit Name</b>");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("<b>Station Name</b>");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("<b>City</b>");
		out.print("</td>");
		
		out.print("<td>");
		out.print("<b>State</b>");
		out.print("</td>");
		
		out.print("<td>");
		out.print("<b>Arrival Time</b>");
		out.print("</td>");
		
		out.print("<td>");
		out.print("<b>Departure Time</b>");
		out.print("</td>");
		out.print("</tr>");

		
		
	    int rowCount = 0;
	    while (rs.next()){
	    	rowCount += 1;
	    	out.print("<tr>");
	    	
			out.print("<td>");
	    	out.print(rs.getString("transit_name"));
	    	out.print("</td>");
	    	
	    	out.print("<td>");
	    	out.print(rs.getString("station_name"));
	    	out.print("</td>");
	    	
	    	out.print("<td>");
	    	out.println(rs.getString("city"));
	    	out.print("</td>");
	    	
	    	out.print("<td>");
	    	out.print(rs.getString("state"));
	    	out.print("</td>");
	    	
	    	out.print("<td>");
	    	out.println(rs.getString("arrival_time"));
	    	out.print("</td>");
	    	
	    	out.print("<td>");
	    	out.println(rs.getString("departure_time"));
	    	out.print("</td>");
	    	
	    	out.print("</tr>");
	    	
	    } 
	    out.print("</table>");
	    float fareForTrip = farePerStop * (rowCount - 1);
	    if (rowCount == 0){
	    	out.print("<p>No Known Routes, Please Search For A Valid Route</p>");
	    } else {
	    	out.print("<p>Total Fare for This Trip is $");
	    	out.print(fareForTrip);
	    	out.print("</p>");
	    }
	    	
	    
	    
	    con.close();
	   

	} catch(Exception e) {
		
	}
%>
