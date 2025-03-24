<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center mt-4">Danh sách phòng</h2>

    <!-- Hiển thị thông tin khách sạn -->
    <c:if test="${not empty sessionScope.hotel}">
        <div class="card mb-4">
            <div class="card-body">
                <h4 class="card-title">${sessionScope.hotel.name}</h4>
                <p><strong>Địa chỉ:</strong> ${sessionScope.hotel.address}</p>
                <p><strong>Số điện thoại:</strong> ${sessionScope.hotel.phone}</p>
                <p><strong>Email:</strong> ${sessionScope.hotel.email}</p>
                <p><strong>Mô tả:</strong> ${sessionScope.hotel.description}</p>
                <img src="${sessionScope.hotel.image}" alt="Hotel Image" class="img-fluid" style="max-height: 250px;">
            </div>
        </div>
    </c:if>

    <!-- Danh sách phòng -->
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Room ID</th>
                <th>Room Number</th>
                <th>Room Type</th>
                <th>Price</th>
                <th>Status</th>
                <th>Chỉnh sửa</th>
                <th>Xóa</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="room" items="${sessionScope.rooms}">
                <tr>
                    <td>${room.roomID}</td>
                    <td>${room.roomNumber}</td>
                    <td>${room.getRoomType().typeName}</td>
                    <td>${room.price}</td>
                    <td>${room.status}</td>
                    <td>
                        <a href="admin?action=edit-room&roomID=${room.roomID}" class="btn btn-warning btn-sm">Chỉnh sửa</a>
                    </td>
                    <td>
                        <a href="delete-room?roomId=${room.roomID}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Bạn có chắc muốn xóa phòng này không?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="text-center">
        <a href="add-room?hotelId=${sessionScope.hotel.hotelID}" class="btn btn-success">Thêm phòng</a>
        <a href="admin" class="btn btn-secondary">Quay lại</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
