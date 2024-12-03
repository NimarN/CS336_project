<%@ page import ="com.cs336.pkg.*"%>
<%@ page import ="java.sql.*"%>	
<% 
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String username = request.getParameter("txtName");
		String password = request.getParameter("txtPwd");
		String accountType = request.getParameter("accountType");
		String sql = "INSERT INTO " + accountType + " (username, password) VALUES (?, ?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, username);
	    stmt.setString(2, password);
	    int rows = stmt.executeUpdate();
	    if (rows > 0) {
	    	response.sendRedirect("login.jsp");
	    } 
	    else {
	    	out.println("Invalid Registration <a href='register.jsp'>try again</a>");
	    }
	    
	    stmt.close();
	    con.close();
	} catch (Exception e) {
		
	}
	

%>