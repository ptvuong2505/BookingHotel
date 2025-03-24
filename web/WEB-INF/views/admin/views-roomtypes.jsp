<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách loại phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <!-- Tiêu đề với nút quay lại -->
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="admin" class="btn btn-secondary">&larr; Quay lại</a>
        <h2 class="text-center flex-grow-1">Danh sách loại phòng</h2>
    </div>

    <!-- Nút thêm loại phòng -->
    <div class="text-end mb-3">
        <a href="add-roomtype.jsp" class="btn btn-success">+ Thêm loại phòng</a>
    </div>

    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên loại phòng</th>
                <th>Mô tả</th>
                <th>Sức chứa</th>
                <th>Hình ảnh</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="type" items="${roomTypes}">
                <tr>
                    <td>${type.roomTypeID}</td>
                    <td>${type.typeName}</td>
                    <td>${type.description}</td>
                    <td>${type.capacity}</td>
                    <td>
                        <img src="${type.image}" alt="Room Image" width="100">
                    </td>
                    <td>
                        <a href="admin?action=edit-roomtype&roomTypeID=${type.roomTypeID}" class="btn btn-warning btn-sm">Chỉnh sửa</a>
                        <a href="delete-roomtype?roomTypeID=${type.roomTypeID}" class="btn btn-danger btn-sm" 
                           onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
