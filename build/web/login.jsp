@@ -1,60 +0,0 @@
<%--
    Document   : Login
    Created on : Mar 10, 2025, 12:39:43 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="CSS/Login.css">
</head>

<body>
<%
    String savedUsername = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                savedUsername = cookie.getValue();
            }
        }
    }
    String errorMes = (String)request.getAttribute("errorMes");
    String username = (String)request.getAttribute("username");
%>
<div class="overlay"></div>
<form class="login-form" action="login" method="post">
    <h2>Welcome Back!</h2>
    <p>We are happy to see you again!</p>

    <label for="username">USERNAME</label>
    <input type="text" name="username" id="username" required value="<%= username!=null ? username : (savedUsername!=null ? savedUsername :"")%>">

    <label style="margin-top:20px;" for="password">PASSWORD</label>
    <div class="password-container">
        <input type="password" name="password" id="password" required>
    </div>
    <span style="color:red;"><%= errorMes!=null? errorMes:"" %></span>
    <div class="remember-forgot d-flex align-items-center">
        <div class="remember-section align-items-center">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Remember me 🔒</label>
        </div>
        <a href="forgotPassword.jsp">Forgot password? 🧑‍💻</a>
    </div>
    <button class="login-btn">Log In</button>

    <div class="bottom-links">
        <a href="register.jsp">Create a new account ✍️️</a>
        <a href="index.jsp">Back to Home 🏠</a>
    </div>
</form>
</body>
</html>