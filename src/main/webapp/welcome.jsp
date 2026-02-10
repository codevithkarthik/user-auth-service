<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<style>
    body {
        margin: 0;
        height: 100vh;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #1d2671, #c33764);
        display: flex;
        justify-content: center;
        align-items: center;
        color: #333;
    }

    .card {
        background: #ffffff;
        width: 480px;
        padding: 45px 35px;
        border-radius: 18px;
        text-align: center;
        box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        animation: fadeIn 0.9s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(25px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .icon {
        font-size: 60px;
        margin-bottom: 15px;
    }

    h1 {
        margin: 10px 0;
        font-size: 30px;
        background: linear-gradient(135deg, #667eea, #764ba2);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .username {
        font-size: 18px;
        margin-top: 8px;
        color: #555;
    }

    .message {
        margin: 25px 0;
        font-size: 15px;
        color: #666;
        line-height: 1.6;
    }

    .actions {
        margin-top: 30px;
    }

    .actions a {
        display: inline-block;
        margin: 8px;
        padding: 12px 26px;
        text-decoration: none;
        font-size: 14px;
        border-radius: 25px;
        transition: all 0.3s ease;
    }
    .btn-secondary {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #fff;
    }

    .btn-secondary:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(102,126,234,0.5);
    }

    .footer {
        margin-top: 30px;
        font-size: 13px;
        color: #999;
    }
</style>
</head>

<body>

<div class="card">
    <div class="icon">🎉</div>

    <h1>Welcome</h1>
    
    

    <% if (request.getAttribute("username") != null) { %>
        <div class="username">
            Hello, <b><%= request.getAttribute("username") %></b> 👋
        </div>
    <% } %>

    <div class="message">
        You have successfully logged in to your account.<br>
        We're excited to have you here — explore, build, and grow 🚀
    </div>

    <div class="actions">
        <a href="logout" class="btn-secondary">Logout</a>
    </div>

    <div class="footer">
        © 2026 • Secure User Portal
    </div>
</div>

</body>
</html>
