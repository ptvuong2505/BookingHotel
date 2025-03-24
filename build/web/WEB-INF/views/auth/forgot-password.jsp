<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: url('images/QuangDaLogo.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .forgot-container {
                background: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="forgot-container text-center">
            <h3><i class="fa fa-envelope fa-3x text-primary"></i></h3>
            <h2 class="my-3">Forgot Password?</h2>
            <p style="color: red" ><%= request.getAttribute("message")!=null ? (request.getAttribute("message")) : "Enter your email to receive an OTP"%></p>
            <form action="send-otp" method="post" onsubmit="disableButton()">
                <div class="mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                    </div>
                </div>
                <button id="send-otp-btn" type="submit" class="btn btn-primary w-100">Send OTP</button>
            </form>
            <div class="mt-3">
                <button class="btn btn-danger w-100" onclick="window.location.href = 'home'">Back to Home</button>
            </div>
        </div>
        <script>
            function disableButton() {
                let btn = document.getElementById("send-otp-btn");
                btn.innerHTML = "Sending...";
                btn.disabled = true;
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
