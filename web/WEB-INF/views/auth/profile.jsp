<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông Tin Cá Nhân</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <div class="profile-container">
        <h2 class="text-center">Thông Tin Cá Nhân</h2>
        <table class="table">
            <tr>
                <th>Tên:</th>
                <td>${customer.name}</td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>${customer.phone}</td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>${customer.email}</td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>${customer.address}</td>
            </tr>
        </table>
            <div class="text-center">
                <a href="home" class="btn btn-secondary">⬅ Quay lại</a>
                <a href="home?action=edit-profile" class="btn btn-primary">✏ Chỉnh sửa</a>
                <a href="home?action=logout" class="btn btn-danger">🚪 Đăng xuất</a>
            </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
