<%@page import="dao.HotelDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Hotel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh sửa khách sạn</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center mt-4">Chỉnh sửa khách sạn</h2>

    <form action="updatehotel" method="post">
        <input type="hidden" name="id" value="${hotel.hotelID}">

        <div class="mb-3">
            <label class="form-label">Tên khách sạn</label>
            <input type="text" name="name" class="form-control" value="${hotel.name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Địa chỉ</label>
            <input type="text" name="address" class="form-control" value="${hotel.address}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số điện thoại</label>
            <input type="text" name="phone" class="form-control" value="${hotel.phone}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="${hotel.email}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control">${hotel.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Hình ảnh (URL)</label>
            <input type="text" name="image" class="form-control" value="${hotel.image}">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="admin?action=views-hotels" class="btn btn-secondary">Hủy</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
