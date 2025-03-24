<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Hotel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<%-- Lấy danh sách khách sạn từ Servlet --%>
<%
    List<Hotel> hotels = (List<Hotel>) session.getAttribute("hotels");
%>

<div class="container">
    <div class="dashboard-container text-center">
        <h2>Admin Dashboard</h2>
        <div class="d-grid gap-3 mt-4">
            <a href="admin?action=views-hotels" class="btn btn-primary">Danh sách khách sạn</a>

            <div class="mb-3">
                <label for="hotelSelect" class="form-label"><strong>Chọn khách sạn:</strong></label>
                <select id="hotelSelect" class="form-select" name="hotelID">
                    <option value="">-- Chọn khách sạn --</option>
                    <c:forEach var="hotel" items="${hotels}">
                        <option value="${hotel.hotelID}">${hotel.name}</option>
                    </c:forEach>
                </select>
            </div>

            <button class="btn btn-warning" onclick="redirectToRooms()">Danh sách phòng</button>
            <a href="admin?action=views-roomtypes" class="btn btn-success">Xem danh sách cac loai phong</a>
            <a href="admin?action=views-services" class="btn btn-success">Danh sách dịch vụ</a>
            <a href="admin?action=views-bookings" class="btn btn-danger">Xem booking hôm nay</a>
        </div>
    </div>
</div>

<script>
    function redirectToRooms() {
        let hotelId = document.getElementById("hotelSelect").value;
        if (hotelId) {
            window.location.href = "admin?action=views-rooms&hotelID="+hotelId;
        } else {
            alert("Vui lòng chọn khách sạn!");
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
