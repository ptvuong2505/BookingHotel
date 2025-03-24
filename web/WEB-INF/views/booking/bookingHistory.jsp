<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%
    List<Booking> bookings = (List<Booking>) session.getAttribute("bookings");
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Lịch Sử Đặt Phòng</title>
    <!-- Link Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .table {
            background: white;
        }
    </style>
</head>
<body>
    
    

    <div class="container">
        <h2 class="text-primary">Lịch Sử Đặt Phòng</h2>

        <c:choose>
            <c:when test="${empty bookings}">
                <div class="alert alert-warning text-center">Không có lịch sử đặt phòng.</div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Booking ID</th>
                            <th>Room ID</th>
                            <th>Hotel ID</th>
                            <th>Check-in Date</th>
                            <th>Check-out Date</th>
                            <th>Total Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.bookingID}</td>
                                <td>${booking.roomID}</td>
                                <td>${booking.hotelID}</td>
                                <td>${booking.checkInDate}</td>
                                <td>${booking.checkOutDate}</td>
                                <td>${booking.totalPrice} $</td>
                                <td>
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test='${booking.status == "Pending"}'>bg-warning</c:when>
                                            <c:when test='${booking.status == "Confirmed"}'>bg-success</c:when>
                                            <c:when test='${booking.status == "Cancelled"}'>bg-danger</c:when>
                                            <c:otherwise>bg-secondary</c:otherwise>
                                        </c:choose> ">
                                        ${booking.status}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

        <div class="text-center">
            <a href="home" class="btn btn-primary">Quay lại Trang Chủ</a>
        </div>
    </div>

    <!-- Link Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
