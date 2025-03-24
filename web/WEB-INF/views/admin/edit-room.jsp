<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Chỉnh sửa phòng</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2 class="text-center mt-4">Chỉnh sửa phòng</h2>

            <form action="updateroom" method="post">
                <input type="hidden" name="roomID" value="${room.roomID}">
                <input type="hidden" name="hotelID" value="${room.hotelID}">


                <div class="mb-3">
                    <label class="form-label">Hotel</label>
                    <input type="text" name="name" class="form-control" value="${hotel.name}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">So phòng</label>
                    <input type="text" name="name" class="form-control" value="${room.roomNumber}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Loại phòng</label>
                    <select name="roomTypeID" class="form-select" required>
                        <c:forEach var="type" items="${roomTypes}">
                            <option value="${type.roomTypeID}" ${type.roomTypeID == room.roomTypeID ? 'selected' : ''}>
                                ${type.typeName}
                            </option>
                        </c:forEach>
                    </select>
                </div>



                <div class="mb-3">
                    <label class="form-label">Giá</label>
                    <input type="number" name="price" class="form-control" value="${room.price}" required>
                </div>



                <div class="mb-3">
                    <label class="form-label">Trạng thái</label>
                    <select name="status" class="form-select">
                        <option value="Available" ${room.status == 'Available' ? 'selected' : ''}>Available</option>
                        <option value="Booked" ${room.status == 'Booked' ? 'selected' : ''}>Booked</option>
                        <option value="Under Maintenance" ${room.status == 'Under Maintenance' ? 'selected' : ''}>Under Maintenance</option>
                    </select>
                </div>





                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="admin?action=views-rooms&hotelID=${room.hotelID}" class="btn btn-secondary">Hủy</a>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
