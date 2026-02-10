<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        font-family: Arial, Helvetica, sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #e4ebf5);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-container {
        background: #ffffff;
        width: 350px;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: #333;
    }

    input {
        width: 100%;
        padding: 10px;
        margin: 12px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
    }

    input:focus {
        border-color: #667eea;
        outline: none;
    }

    button {
        width: 100%;
        padding: 11px;
        background: #667eea;
        border: none;
        color: white;
        font-size: 15px;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background: #5a67d8;
    }

    .error {
        color: red;
        font-size: 14px;
        margin-bottom: 10px;
    }

    .signup-link {
        margin-top: 15px;
        font-size: 14px;
    }

    .signup-link a {
        color: #667eea;
        text-decoration: none;
    }

</style>
</head>

<body>

<div class="login-container">

    <h2>User Login</h2>

    <% if(request.getAttribute("error") != null){ %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>
    
    <% if ("success".equals(request.getParameter("logout"))) { %>
	    <div style="color:red; text-align:center; margin-bottom:10px;">
	        Logged out successfully
	    </div>
	<% } %>
    

    <form action="login" method="get">
        <input type="text" name="mobile" placeholder="Enter Mobile Number" required>
        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <div class="signup-link">
        New user.? <a href="index.jsp">Sign up</a>
    </div>

</div>

</body>
</html>
