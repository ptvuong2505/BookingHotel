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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/confirmation.css">
        <style>
            #background-container {
                background-image: url('<%= request.getContextPath()%>/images/QuangDaLogo.jpg');
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                height: 100vh;
                z-index: -1;
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
                        <a href="home?action=payment" type="submit" class="btn btn-primary" >Confirm Booking</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

