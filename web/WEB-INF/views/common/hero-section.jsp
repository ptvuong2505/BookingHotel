<%@page import="model.RoomType"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Hotel"%>
<%@page import="java.util.List"%>
<%
    List<Hotel> hotels = (List<Hotel>) session.getAttribute("hotels");
    List<RoomType> roomTypes = (List<RoomType>) session.getAttribute("roomTypes");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="hero position-relative">
    
    <!-- Hình ảnh từ database -->
    <div id="hotelCarousel" class="carousel slide position-absolute top-0 start-0 w-100 h-100" data-bs-ride="carousel">
        <div class="carousel-inner">
            <c:forEach var="hotel" items="${hotels}" varStatus="status">
                <div class="carousel-item ${status.first ? 'active' : ''}">
                    <img src="${hotel.image}" class="d-block w-100" alt="${hotel.name}">
                    <p>${hotel.name}</p>
                </div>
            </c:forEach>
        </div>
        <!-- Nút điều hướng -->
        <button class="carousel-control-prev" type="button" data-bs-target="#hotelCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#hotelCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>

    <!-- Nội dung đặt phòng -->
    <!-- Form đặt phòng -->
<div class="search-box bg-white p-4 rounded shadow">
    <form action="RoomController" method="post" class="row">
        <!-- Chọn Hotel -->
        <div class="col-md-3">
            <select class="form-select" name="hotel">
                <option selected>Chọn Khách Sạn</option>
                <c:forEach var="hotel" items="${hotels}">
                    <option value="${hotel.hotelID}">${hotel.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Chọn ngày nhận -->
        <div class="col-md-2">
            <input type="date" class="form-control" name="checkInDate" id="checkInDate">
        </div>

        <!-- Chọn ngày trả -->
        <div class="col-md-2">
            <input type="date" class="form-control" name="checkOutDate" id="checkOutDate">
        </div>

        <!-- Chọn loại phòng -->
        <div class="col-md-3">
            <select class="form-select" name="roomType">
                <option selected>Chọn Loại Phòng</option>
                <c:forEach var="room" items="${roomTypes}">
                    <option value="${room.roomTypeID}">${room.typeName}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Nút tìm kiếm -->
        <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">Search</button>
        </div>
    </form>
</div>

<!-- JavaScript để giới hạn ngày -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let checkInInput = document.getElementById("checkInDate");
        let checkOutInput = document.getElementById("checkOutDate");

        let today = new Date().toISOString().split("T")[0]; // Lấy ngày hôm nay (YYYY-MM-DD)

        // Đặt giá trị mặc định nếu không có trong session
        if (!checkInInput.value) {
            checkInInput.value = today;
        }
        if (!checkOutInput.value) {
            checkOutInput.value = checkInInput.value; // Check-out mặc định là ngày check-in
        }

        // Giới hạn ngày nhỏ nhất có thể chọn
        checkInInput.min = today;
        checkOutInput.min = checkInInput.value;

        // Khi chọn ngày check-in, cập nhật ngày check-out tối thiểu
        checkInInput.addEventListener("change", function () {
            checkOutInput.min = checkInInput.value;

            // Nếu ngày check-out nhỏ hơn ngày check-in, tự động cập nhật
            if (checkOutInput.value < checkInInput.value) {
                checkOutInput.value = checkInInput.value;
            }
        });
    });
</script>



</header>
