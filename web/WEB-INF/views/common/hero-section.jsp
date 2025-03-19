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
    <div class="row">
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
            <button class="btn btn-primary w-100">Search</button>
        </div>
    </div>
</div>

<!-- JavaScript để giới hạn ngày -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        let today = new Date().toISOString().split('T')[0];

        let checkInDate = document.getElementById("checkInDate");
        let checkOutDate = document.getElementById("checkOutDate");

        // Đặt giá trị min cho ngày nhận phòng là hôm nay
        checkInDate.setAttribute("min", today);

        // Khi người dùng chọn ngày nhận phòng
        checkInDate.addEventListener("change", function() {
            let selectedCheckIn = checkInDate.value;
            checkOutDate.setAttribute("min", selectedCheckIn);
        });
    });
</script>


</header>
