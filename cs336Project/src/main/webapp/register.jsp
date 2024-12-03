<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <h2>Register</h2>
    <form action="createAccount.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="txtName" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="txtPwd" required><br><br>

        <label for="accountType">Account Type:</label>
        <select id="accountType" name="accountType" required>
            <option value="customers">Customer</option>
            <option value="customerReps">Customer Reps</option>
            <option value="admins">Admin</option>
        </select><br><br>

        <button type="submit">Register</button>
    </form>
</body>
</html>