<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enter OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('images/QuangDaLogo.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .otp-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        #resend-btn {
            display: none;
        }
    </style>
</head>
<body>
    <div class="otp-container text-center">
        <h3><i class="fa fa-lock fa-3x text-primary"></i></h3>
        <h2 class="my-3">Enter OTP</h2>
        <% if (request.getAttribute("message") != null) { %>
            <p class="text-danger"><%= request.getAttribute("message") %></p>
        <% } %>
        <form action="validate-otp" method="post">
            <div class="mb-3">
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                    <input type="text" class="form-control" name="enteredOTP" placeholder="Enter OTP" required >
                </div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Verify OTP</button>
        </form>
        <div class="mt-3">
            <p id="countdown-text">You can resend OTP after <span id="countdown"></span> s.</p>
            <button id="resend-btn" class="btn btn-outline-primary w-100" onclick="resendOTP()">
                <i class="fas fa-redo"></i> Resend OTP
            </button>
        </div>
    </div>

    <script>
        window.onload = function () {
            let lastOTPSentTime = <%= session.getAttribute("otpGeneratedTime") %>;
            if (!lastOTPSentTime) {
                window.location.href = "/WEB-INF/views/auth/forgot-password.jsp";
                return;
            }

            let elapsed = Math.floor((Date.now() - lastOTPSentTime) / 1000);
            let countdown = 60 - elapsed;

            const countdownText = document.getElementById("countdown-text");
            const countdownSpan = document.getElementById("countdown");
            const resendButton = document.getElementById("resend-btn");

            if (countdown > 0) {
                countdownSpan.innerText = countdown;
                let interval = setInterval(() => {
                    countdown--;
                    countdownSpan.innerText = countdown;
                    if (countdown <= 0) {
                        clearInterval(interval);
                        countdownText.style.display = "none";
                        resendButton.style.display = "block";
                    }
                }, 1000);
            } else {
                countdownText.style.display = "none";
                resendButton.style.display = "block";
            }
        };

        function resendOTP() {
            let btn = document.getElementById("resend-btn");
            btn.innerHTML = "Resending...";
            btn.disabled = true;
            window.location.href = 'resend-otp';
        }
    </script>
</body>
</html>
