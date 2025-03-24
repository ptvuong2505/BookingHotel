<%--
    Document   : Login
    Created on : Mar 10, 2025, 12:39:43 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            String errorMes = (String) request.getAttribute("errorMes");
            String username = (String) request.getAttribute("username");
        %>
        <div class="containter d-flex justify-content-center align-items-center">
            <form class="login-form" action="login" method="post">
                <c:if test="${param.error== 'notLoggedIn'}">
                    <span style="color:red;">Please login to continue</span>
                </c:if>
                <h2>Welcome Back!</h2>
                <p>We are happy to see you again!</p>
                <label for="username">USERNAME</label>
                <input type="text" name="username" id="username" required value="<%= username != null ? username : (savedUsername != null ? savedUsername : "")%>">
                <label style="margin-top:20px;" for="password">PASSWORD</label>
                <div class="password-container">
                    <input type="password" name="password" id="password" required>
                </div>
                <span style="color:red;"><%= errorMes != null ? errorMes : ""%></span>
                <div class="remember-forgot d-flex align-items-center">
                    <div class="remember-section align-items-center">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me 🔒</label>
                    </div>
                    <a href="home?action=forgot-password">Forgot password? 🧑‍💻</a>
                </div>
                <button class="login-btn">Log In</button>
                <div class="bottom-links">
                    <a href="home?action=register">Create a new account ✍️️</a>
                    <a href="home">Back to Home 🏠</a>
                </div>
            </form>
        </div>
    </body>
</html>