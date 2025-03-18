<%-- 
    Document   : Register
    Created on : Mar 10, 2025, 3:40:45 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <link rel="stylesheet" href="CSS/Register.css">
    </head>
    <body>

        <div class="signup-container">
            <form action="register" class="signup-form" method="post">
                <h2>Sign Up <span>👤➕</span></h2>

                <label for="fullname">FULL NAME </label>
                <input type="text" name="name" id="fullname" placeholder="Full Name" value="<%= request.getAttribute("name") !=null ? request.getAttribute("name"): "" %>" required>               

                <label for="username">USERNAME</label>
                <input type="text" name="username" id="username" placeholder="Username" value="<%= request.getAttribute("username") !=null ? request.getAttribute("username"): "" %>" >
                <span style="color: red;"> <%= request.getAttribute("errorMesUsername")!=null ? request.getAttribute("errorMesUsername") : "" %> </span>

                <label for="email">EMAIL</label>
                <input type="email" name="email" id="email" placeholder="Email" value="<%= request.getAttribute("email") !=null ? request.getAttribute("email"): "" %>" required>
                <span style="color: red;"> <%= request.getAttribute("errorMesEmail")!=null ? request.getAttribute("errorMesEmail") : "" %> </span>
                
                <label for="phone">PHONE NUMBER</label>
                <input type="tel" name="phone" id="phone" placeholder="Phone Number" value="<%= request.getAttribute("phone") !=null ? request.getAttribute("phone"): "" %>" required>

                <label for="email">ADDRESS</label>
                <input type="text" name="address" id="address" placeholder="Address" value="<%= request.getAttribute("address") !=null ? request.getAttribute("address"): "" %>" required>
                <label for="password">PASSWORD</label>
                <div class="password-field">
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <span class="toggle-password">👁️</span>
                </div>

                <label for="confirm-password">CONFIRM PASSWORD</label>
                <div class="password-field">
                    <input type="password" name="confirmPassword" id="confirm-password" placeholder="Confirm Password" required>
                    <span class="toggle-password">👁️</span>
                    <span style="color: red;"> <%= request.getAttribute("errorMesPassword")!=null ? request.getAttribute("errorMesPassword") : "" %> </span>
                </div>

                <button type='submit'>Sign Up</button>

                <p>By clicking the Sign Up button, you agree to our 
                    <a href="#">Terms of Service</a> and 
                    <a href="#">Privacy Policy</a>.
                </p>
            </form>
        </div>

        <script>
            document.querySelectorAll('.toggle-password').forEach(item => {
                item.addEventListener('click', function () {
                    const passwordInput = this.previousElementSibling;
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);
                    this.textContent = type === 'password' ? '👁️' : '🙈';
                });
            });
        </script>
    </body>
</html>

