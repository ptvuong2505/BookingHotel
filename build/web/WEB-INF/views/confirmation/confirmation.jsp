<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Booking Confirmation | Quang Da Hotel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #c4933f;
                --secondary-color: #9c793d;
                --dark-bg: #333333;
                --card-bg: #111111;
                --text-color: #e0e0e0;
                --border-color: #c4933f;
            }

            body, html {
                height: 100%;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: var(--text-color);
                background-color: var(--dark-bg);
            }

            body {
                position: relative;
                background-image: url('${pageContext.request.contextPath}/images/QuangDaLogo.jpg');
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }

            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.75);
                z-index: -1;
            }

            .container-box {
                max-width: 800px;
                margin: 20px auto;
                padding: 0;
                border-radius: 10px;
                background-color: var(--dark-bg);
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
                overflow: hidden;
                border: 1px solid var(--border-color);
            }

            .header {
                background-color: var(--card-bg);
                padding: 20px;
                text-align: center;
                border-bottom: 2px solid var(--border-color);
            }

            .header h2 {
                color: var(--primary-color);
                margin: 0;
                font-size: 28px;
                font-weight: bold;
            }

            .content {
                padding: 20px;
            }

            .card {
                background-color: var(--card-bg);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                margin-bottom: 20px;
                overflow: hidden;
            }

            .card-header {
                background-color: var(--card-bg);
                color: var(--primary-color);
                text-align: center;
                padding: 15px;
                font-weight: bold;
                border-bottom: 1px solid var(--border-color);
            }

            .card-body {
                padding: 15px;
            }

            label {
                color: var(--text-color);
                margin-bottom: 5px;
                display: block;
            }

            .form-control, .form-select {
                background-color: #444;
                border: 1px solid #555;
                color: white;
                padding: 10px;
                border-radius: 5px;
            }

            .form-control:focus {
                background-color: #444;
                border-color: var(--primary-color);
                color: white;
                box-shadow: 0 0 0 0.25rem rgba(196, 147, 63, 0.25);
            }

            .date-inputs {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
                margin-bottom: 20px;
            }

            input[type="date"] {
                color-scheme: dark;
            }

            .form-check {
                margin-bottom: 10px;
                display: flex;
                align-items: center;
            }

            .form-check-input {
                margin-right: 10px;
                width: 18px;
                height: 18px;
            }

            .form-check-input:checked {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .form-check-label {
                color: var(--text-color);
                display: flex;
                justify-content: space-between;
                width: 100%;
            }

            .price {
                color: var(--primary-color);
                font-weight: bold;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: #333;
                font-weight: bold;
                padding: 12px 20px;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .btn-primary:hover {
                background-color: var(--secondary-color);
                border-color: var(--secondary-color);
                transform: translateY(-2px);
            }

            .info-row {
                display: flex;
                margin-bottom: 10px;
                border-bottom: 1px solid #444;
                padding-bottom: 8px;
            }

            .info-row:last-child {
                border-bottom: none;
            }

            .info-label {
                font-weight: bold;
                min-width: 120px;
                color: var(--primary-color);
            }

            .error-message {
                color: #ff6b6b;
                background-color: rgba(255, 107, 107, 0.1);
                border: 1px solid #ff6b6b;
                padding: 10px;
                border-radius: 5px;
                margin-top: 10px;
                display: none;
            }

            @media (max-width: 768px) {
                .date-inputs {
                    grid-template-columns: 1fr;
                }

                .container-box {
                    margin: 10px;
                }
            }
        </style>

        <script>
            function validateDates() {
                const checkInInput = document.getElementById("checkIn");
                const checkOutInput = document.getElementById("checkOut");
                const errorMessage = document.getElementById("dateError");

                const checkInDate = new Date(checkInInput.value);
                const checkOutDate = new Date(checkOutInput.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0);

                // Đặt lại thông báo lỗi
                errorMessage.style.display = "none";
                checkInInput.style.borderColor = "";
                checkOutInput.style.borderColor = "";

                // Kiểm tra ngày check-in
                if (checkInDate < today) {
                    errorMessage.innerHTML = "Check-in date cannot be in the past!";
                    errorMessage.style.display = "block";
                    checkInInput.style.borderColor = "#ff6b6b";
                    return false;
                }

                // Kiểm tra mối quan hệ giữa check-in và check-out
                if (checkOutDate <= checkInDate) {
                    errorMessage.innerHTML = "Check-out date must be after check-in date!";
                    errorMessage.style.display = "block";
                    checkOutInput.style.borderColor = "#ff6b6b";
                    return false;
                }

                return true;
            }

            document.addEventListener('DOMContentLoaded', function () {
                // Đặt ngày mặc định
                const today = new Date();
                const tomorrow = new Date(today);
                tomorrow.setDate(today.getDate() + 1);

                document.getElementById('checkIn').valueAsDate = today;
                document.getElementById('checkOut').valueAsDate = tomorrow;
            });
        </script>
    </head>
    <body>
        <div class="container-box">
            <div class="header">
                <h2>Booking Confirmation</h2>
            </div>

            <div class="content">
                <!-- Lấy thông tin khách hàng từ Session -->
                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if (customer == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }
                %>

                <!-- Thông tin khách hàng -->
                <div class="card">
                    <div class="card-header">
                        Customer Information
                    </div>
                    <div class="card-body">
                        <div class="info-row">
                            <div class="info-label">Name:</div>
                            <div><%= customer.getName()%></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Email:</div>
                            <div><%= customer.getEmail()%></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Phone:</div>
                            <div><%= customer.getPhone()%></div>
                        </div>
                    </div>
                </div>

                <!-- Lấy thông tin phòng từ form -->
                <%
                    String roomType = request.getParameter("roomType");
                    String description = request.getParameter("description");
                    String capacity = request.getParameter("capacity");
                    String price = request.getParameter("price");
                %>

                <!-- Thông tin phòng -->
                <div class="card">
                    <div class="card-header">
                        Room Information
                    </div>
                    <div class="card-body">
                        <div class="info-row">
                            <div class="info-label">Room Type:</div>
                            <div><%= roomType%></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Description:</div>
                            <div><%= description%></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Capacity:</div>
                            <div><%= capacity%> People</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Price:</div>
                            <div><%= price%> VND per night</div>
                        </div>
                    </div>
                </div>

                <!-- Form xác nhận đặt phòng -->
                <form action="BookingServlet" method="POST" onsubmit="return validateDates()">
                    <div class="date-inputs">
                        <div>
                            <label>Check-in Date:</label>
                            <input type="date" name="checkIn" id="checkIn" class="form-control" min="<%= LocalDate.now()%>" required>
                        </div>
                        <div>
                            <label>Check-out Date:</label>
                            <input type="date" name="checkOut" id="checkOut" class="form-control" min="<%= LocalDate.now()%>" required>
                        </div>
                    </div>

                    <!-- Hiển thị thông báo lỗi -->
                    <div id="dateError" class="error-message"></div>

                    <!-- Services -->
                    <div class="card">
                        <div class="card-header">
                            Services
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="services" id="breakfast" value="Breakfast">
                                <label class="form-check-label" for="breakfast">
                                    <span>Breakfast</span>
                                    <span class="price">100,000 VND</span>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="services" id="lunch" value="Lunch">
                                <label class="form-check-label" for="lunch">
                                    <span>Lunch</span>
                                    <span class="price">150,000 VND</span>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="services" id="dinner" value="Dinner">
                                <label class="form-check-label" for="dinner">
                                    <span>Dinner</span>
                                    <span class="price">200,000 VND</span>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="services" id="water" value="Water">
                                <label class="form-check-label" for="water">
                                    <span>Water</span>
                                    <span class="price">50,000 VND</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Offers -->
                    <div class="card">
                        <div class="card-header">
                            Offers
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="offers" id="motorbike" value="Motorbike Rental">
                                <label class="form-check-label" for="motorbike">
                                    <span>Motorbike Rental</span>
                                    <span class="price">300,000 VND</span>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="offers" id="car" value="Car Rental">
                                <label class="form-check-label" for="car">
                                    <span>Car Rental</span>
                                    <span class="price">1,000,000 VND</span>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="offers" id="gold" value="Gold Membership">
                                <label class="form-check-label" for="gold">
                                    <span>Gold Membership</span>
                                    <span class="price">2,000,000 VND</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Hidden Inputs -->
                    <input type="hidden" name="roomType" value="<%= roomType%>">
                    <input type="hidden" name="description" value="<%= description%>">
                    <input type="hidden" name="capacity" value="<%= capacity%>">
                    <input type="hidden" name="price" value="<%= price%>">

                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-check-circle"></i> Confirm Booking
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

