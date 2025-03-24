<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh sửa loại phòng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Chỉnh sửa loại phòng</h2>

    <form action="updateroomtype" method="post">
        <input type="hidden" name="roomTypeID" value="${roomType.roomTypeID}">

        <div class="mb-3">
            <label class="form-label">Tên loại phòng</label>
            <input type="text" name="typeName" class="form-control" value="${roomType.typeName}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="3" required>${roomType.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Sức chứa</label>
            <input type="number" name="capacity" class="form-control" value="${roomType.capacity}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Hình ảnh</label>
            <input type="text" name="image" class="form-control" value="${roomType.image}" required>
            <img src="${roomType.image}" alt="Room Image" width="200" class="mt-2">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="admin?action=views-roomtypes" class="btn btn-secondary">Hủy</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
