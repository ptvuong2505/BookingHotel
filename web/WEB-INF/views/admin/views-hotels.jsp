<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Hotel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách khách sạn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center mt-4">Danh sách khách sạn</h2>

    <div class="text-end mb-3">
        <a href="add-hotel.jsp" class="btn btn-success">Thêm khách sạn</a>
    </div>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Địa chỉ</th>
                <th>Điện thoại</th>
                <th>Email</th>
                <th>Mô tả</th>
                <th>Hình ảnh</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="hotel" items="${hotels}">
                <tr>
                    <td>${hotel.hotelID}</td>
                    <td>${hotel.name}</td>
                    <td>${hotel.address}</td>
                    <td>${hotel.phone}</td>
                    <td>${hotel.email}</td>
                    <td>${hotel.description}</td>
                    <td>
                        <img src="${hotel.image}" alt="Hotel Image" width="80">
                    </td>
                    <td>
                        <a href="admin?action=edit-hotel&hotelID=${hotel.hotelID}" class="btn btn-primary btn-sm">Chỉnh sửa</a>
                        <a href="delete-hotel?hotelId=${hotel.hotelID}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="text-center">
        <a href="admin" class="btn btn-secondary">Quay lại</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
