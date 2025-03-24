<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.RoomType"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Hotel"%>
<%@page import="java.util.List"%>
<<<<<<< HEAD
<%
//    List<Hotel> hotels = (List<Hotel>) session.getAttribute("hotels");
//    List<RoomType> roomTypes = (List<RoomType>) session.getAttribute("roomTypes");
//    
//    
//    try {
//            int roomTypeID = (int) session.getAttribute("roomTypeID");
//            int hotelID = (int) session.getAttribute("hotelID");
//            Date checkInDate = (Date) session.getAttribute("checkInDate");
//            String hotelName = (String) session.getAttribute("hotelName");
//            String typeName = (String) session.getAttribute("typeName");
//        } catch (Exception e) {
//        }
//    
=======
<%;
    Date checkInDate = (Date) session.getAttribute("checkInDate");
    Date checkOutDate = (Date) session.getAttribute("checkOutDate");
    String formattedcheckInDate = (checkInDate != null) ? new SimpleDateFormat("yyyy-MM-dd").format(checkInDate) : "";
    String formattedcheckOutDate = (checkOutDate != null) ? new SimpleDateFormat("yyyy-MM-dd").format(checkOutDate) : "";
>>>>>>> vuong
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="RoomController" method="POST">
    <div class="row d-flex align-items-center">
        <!-- Chọn khách sạn -->
        <div class="col-md-3">
            <select class="form-select" name="hotel" >

                <c:choose>
                    <c:when test="${not empty hotelName}">
                        <option value="${hotelID}" selected>${hotelName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="" selected>Select Hotel</option>
                    </c:otherwise>   
                </c:choose>

                <c:forEach var="hotel" items="${hotels}">
                    <option value="${hotel.hotelID}">${hotel.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Chọn ngày nhận -->
        <div class="col-md-2">
            <input type="date" class="form-control" name="checkInDate" id="checkInDate"
                   value= <%= formattedcheckInDate%>
                   min="">
        </div>

        <div class="col-md-2">
            <input type="date" class="form-control" name="checkOutDate" id="checkOutDate"
                   value="<%= formattedcheckOutDate%>
                   min="">
        </div>

        <!-- Chọn loại phòng -->
        <div class="col-md-3">
            <select class="form-select" name="roomType">

                <c:choose>
                    <c:when test="${not empty typeName}">
                        <option value="${roomTypeID}" selected>${typeName}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="" selected>Select room type</option>
                    </c:otherwise>
                </c:choose>
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let checkInInput  = document.getElementById("checkInDate");
        let checkOutInput = document.getElementById("checkOutDate");

        let today = new Date().toISOString().split("T")[0]; // Lấy ngày hôm nay (YYYY-MM-DD)

        console.log("Check-in trước khi xử lý:", checkInInput.value);
        console.log("Check-out trước khi xử lý:", checkOutInput.value);
        // Đặt giá trị mặc định nếu không có trong session
        if (!checkInInput.value) {
            checkInInput.value = today;
        }
        if (!checkOutInput.value || checkOutInput.value < checkInInput.value) {
            checkOutInput.value = checkInInput.value;
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
