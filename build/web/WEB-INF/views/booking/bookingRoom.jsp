
<%@page import="model.Room"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : booking
    Created on : Mar 17, 2025, 11:35:42â¯AM
    Author     : LENOVO
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quang Da Hotel</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/booking_room.css">
    </head>
    <body>    
        <nav class="navbar navbar-expand-lg custom-navbar fixed-top shadow-sm">
            <div class="container d-flex justify-content-between align-items-center">
                <!-- Logo --> 
                <div class="header-logo">
                    <img src="images/QuangDaLogo.jpg" alt="Qu?ng ?à Hotel" class="logo">
                </div>

                <!-- Menu -->
                <div class="header-service" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="home?action=bookingVehicle">Offers</a>
                            <ul class="dropdown-menu">
                                <li><a href="home?action=bookingVehicle">Motorbike Rental</a></li>
                                <li><a href="home?action=bookingVehicle">Car Rental</a></li>
                                <li><a href="home?action=bookingVehicle">Golf Trip</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="home?action=bookingService">Dine And Drink</a>
                            <ul class="dropdown-menu">
                                <li><a href="home?action=bookingService">Breakfast</a></li>
                                <li><a href="home?action=bookingService">Lunch</a></li>
                                <li><a href="home?action=bookingService">Dining</a></li>
                                <li><a href="home?action=bookingService">Water</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if (customer == null) {
                %>
                <div class="header-login d-flex">
                    <a href="home?action=login" class="btn-custom me-2">Login</a>
                    <a href="home?action=register" class="btn-custom me-2">Register</a>
                    <a href="home?action=booking" class="btn-custom btn-primary-custom">Booking now</a>
                </div>
                <% } else {%>
                <div class="header-login d-flex align-items-center">
                    <span class="me-3" style="color: #FF9900">Xin chào, <strong><%= customer.getName()%></strong></span>
                    <a href="LogoutServlet" class="btn-custom me-2">Logout</a>
                </div>
                <% }%>
            </div>
        </nav>
        <%@ include file="/WEB-INF/views/booking/select-room.jsp" %>
        <section class="container room-section">
            <div class="row justify-content-center">
                <c:forEach var="room" items="${rooms}">
                    <div class="col-md-10 mb-4">
                        <div class="card shadow-sm">
                            <div class="row g-0">
                                <!-- Image Section -->
                                <div class="col-md-4 bg-light p-0">
                                    <img src="${pageContext.request.contextPath}/images/StandardRoom.png" alt="Room Image" class="img-fluid w-100">
                                    <ul class="list-unstyled p-3 mb-0">
                                        <li>🛀 Bathtub</li>
                                        <li>📶 Free Wifi</li>
                                        <li>🌡️ Air Conditioning</li>
                                    </ul>
                                </div>
                                <!-- Description Section -->
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title text-uppercase">${room.getRoomType().typeName}</h5>

                                        <p>Status: ${room.status}</p>

                                        <hr>
                                        <div class="online-exclusives">
                                            <h5>Online Exclusives Offer - Asia Escape</h5>
                                            <ul>
                                                <li>Sumptuous breakfast for 2 adults.</li>
                                                <li>Voucher F&B credit VND 21.99 USD net per stay</li>
                                            </ul>
                                            <div class="price">${room.price} USD</div>
                                            <div class="price-note">Per Night (Excluding taxes and fees)</div>

                                            <!-- Form gửi roomID khi nhấn "Booking now" -->
                                            <form action="booking" method="POST">
                                                <input type="hidden" name="roomID" value="${room.roomID}">
                                                <input type="hidden" name="roomNumber" value="${room.roomNumber}">
                                                <input type="hidden" name="roomTypeID" value="${room.roomTypeID}">
                                                <input type="hidden" name="price" value="${room.price}">
                                                <input type="hidden" name="status" value="${room.status}">
                                                <button type="submit" class="btn btn-primary">Booking now</button>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </section>


        <!--footer-->
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
