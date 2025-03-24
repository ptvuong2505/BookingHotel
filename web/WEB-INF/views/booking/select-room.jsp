<%@page import="model.RoomType"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Hotel"%>
<%@page import="java.util.List"%>
<%
    List<Hotel> hotels = (List<Hotel>) session.getAttribute("hotels");
    List<RoomType> roomTypes = (List<RoomType>) session.getAttribute("roomTypes");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="RoomController" method="POST">
    <div class="row d-flex align-items-center">
        <!-- Chọn khách sạn -->
        <div class="col-md-3">
            <select class="form-select" name="hotel">
                <option value="" ${empty param.hotel ? "selected" : ""}>Chọn Khách Sạn</option>
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
    </div>
</form>
