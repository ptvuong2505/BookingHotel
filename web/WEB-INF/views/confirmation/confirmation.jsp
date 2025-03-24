<%@page import="java.util.List"%>
<%@page import="model.Service"%>
<%@page import="model.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    Room room=(Room) session.getAttribute("room");
                    List<Service> services=(List<Service>) session.getAttribute("services");
                %>

                <!-- Thông tin phòng -->
                <%@ include file="/WEB-INF/views/confirmation/room-information.jsp" %>

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
                    
                    <!-- Service -->
                    <%@ include file="/WEB-INF/views/confirmation/service.jsp" %>
                    

                    <!-- Offers -->
                    <%@ include file="/WEB-INF/views/confirmation/offer.jsp" %>

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

