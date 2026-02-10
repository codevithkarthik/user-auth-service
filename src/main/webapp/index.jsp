<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Signup</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(135deg, #f5f7fa, #e4ebf5);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup-box {
            background: #ffffff;
            padding: 30px;
            width: 320px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .signup-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #667eea;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #667eea;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #5a67d8;
        }

        .note {
            text-align: center;
            margin-top: 12px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>

<body>

    <div class="signup-box">
        <h2>Sign up</h2>
        
        <% String msg = (String) request.getAttribute("error"); %>
		<% if (msg != null) { %>
    	<p style="color:red; text-align:center;"><%= msg %></p>
		<% } %>
        	
        <form action="signup" method="post">
        	<label>Name</label>
            <input type="text" name="username" placeholder="Enter your name" required>
        
            <label>Mobile Number</label>
            <input type="text" name="mobile" placeholder="Enter mobile number" required>
            
            <label>Create Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
            <input type="submit" value="Create Account">
        </form>
	     <div class="note">
		    Already have an account?
		    <a href="login.jsp">Login</a>
		</div> 
    </div>

</body>
</html>
