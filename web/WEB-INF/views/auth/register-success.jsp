<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Password Changed Successfully</title>
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
            .success-container {
                background: rgba(255, 255, 255, 0.9);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            .btn-home {
                margin-top: 15px;
            }
        </style>
    </head>
    <script>
        setTimeout(function () {
            window.location.href = "home";
        }, 5000);
    </script>
    <body>
        <div class="success-container">
            <h3><i class="fa fa-check-circle fa-3x text-success"></i></h3>
            <h2 class="my-3">Register Successfully</h2>
            <p>You can now log in with your account.</p>
            <a href="home?action=login" class="btn btn-primary w-100 btn-home">
                <i class="fas fa-sign-in-alt"></i> Go to Login
            </a>
        </div>


    </body>

</html>
