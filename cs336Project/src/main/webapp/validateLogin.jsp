<%@ page import ="com.cs336.pkg.*"%>
<%@ page import ="java.sql.*"%>	
<% try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		
		String username = request.getParameter("txtName");
        String password = request.getParameter("txtPwd");
        String loginType = request.getParameter("loginType");
		String sql = "SELECT * FROM " + loginType + " WHERE username = ? AND password = ?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, username);
        stmt.setString(2, password);
        
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
        	session.setAttribute("user", username);
            // Redirect to welcome.jsp if login is successful
            if (loginType.equals("customers")) {
            	response.sendRedirect("welcomeCustomers.jsp");
            }
            else if (loginType.equals("customerReps")) {
            	response.sendRedirect("welcomeReps.jsp");
            }
            
            else {
            	response.sendRedirect("welcomeAdmins.jsp");
            }
            
            
        } else {
        	out.println("Invalid Login <a href='login.jsp'>try again</a>");
        }

        rs.close();
        stmt.close();
        con.close();
		
		
		
	} catch (Exception e ) {
		
	}
		
	%>
	