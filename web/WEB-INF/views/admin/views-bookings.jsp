<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách đặt phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="admin" class="btn btn-secondary">&larr; Quay lại</a>
        <h2 class="text-center flex-grow-1">Danh sách đặt phòng</h2>
    </div>

    <!-- Form lọc theo ngày -->
    <form action="admin?action=views-bookings" method="get" class="row g-3">
        <div class="col-md-4">
            <label class="form-label">Từ ngày:</label>
            <input type="date" name="startDate" class="form-control" value="${param.startDate}">
        </div>
        <div class="col-md-4">
            <label class="form-label">Đến ngày:</label>
            <input type="date" name="endDate" class="form-control" value="${param.endDate}">
        </div>
        <div class="col-md-4 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">Lọc</button>
        </div>
    </form>

    <table class="table table-bordered text-center mt-4">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Khách hàng</th>
                <th>Phòng</th>
                <th>Khách sạn</th>
                <th>Ngày nhận</th>
                <th>Ngày trả</th>
                <th>Tổng tiền</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.bookingID}</td>
                    <td>${booking.customerID}</td>
                    <td>${booking.roomID}</td>
                    <td>${booking.hotelID}</td>
                    <td>${booking.checkInDate}</td>
                    <td>${booking.checkOutDate}</td>
                    <td>${booking.totalPrice}</td>
                    <td>${booking.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
