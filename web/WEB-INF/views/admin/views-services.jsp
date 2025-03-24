<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh sách dịch vụ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <a href="admin" class="btn btn-secondary">&larr; Quay lại</a>
        <h2 class="text-center flex-grow-1">Danh sách dịch vụ</h2>
        <a href="add-service.jsp" class="btn btn-success">+ Thêm dịch vụ</a>
    </div>

    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên dịch vụ</th>
                <th>Giá</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="service" items="${services}">
                <tr>
                    <td>${service.serviceID}</td>
                    <td>${service.serviceName}</td>
                    <td>${service.price}</td>
                    <td>
                        <a href="admin?action=edit-service&serviceID=${service.serviceID}" class="btn btn-warning btn-sm">Chỉnh sửa</a>
                        <a href="delete-service?serviceID=${service.serviceID}" class="btn btn-danger btn-sm"
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
