<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh Sửa Thông Tin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .edit-container {
            max-width: 500px;
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
    <div class="edit-container">
        <h2 class="text-center">Chỉnh Sửa Thông Tin</h2>
        <form action="edit-profile" method="post">
            <div class="mb-3">
                <label class="form-label">Tên:</label>
                <input type="text" class="form-control" name="name" value="${customer.name}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Số điện thoại:</label>
                <input type="text" class="form-control" name="phone" value="${customer.phone}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" class="form-control" name="email" value="${customer.email}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Địa chỉ:</label>
                <input type="text" class="form-control" name="address" value="${customer.address}" required>
            </div>
            <div class="text-center">
                <a href="javascript:history.back()" class="btn btn-secondary">⬅ Quay lại</a>
                <button type="submit" class="btn btn-success">💾 Lưu</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
