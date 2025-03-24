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


        <!--Header--> 
        <nav class="navbar navbar-expand-lg custom-navbar fixed-top shadow-sm">
            <div class="container d-flex justify-content-between align-items-center">
                <!-- Logo --> 
                <div class="header-logo">
                    <img src="${pageContext.request.contextPath}/images/QuangDaLogo.jpg" alt="Quáº£ng ÄÃ  Hotel" class="logo">
                </div>

                <!-- Menu -->
                <div class="header-service" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
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
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#">Meeting event</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Request For Proposal</a></li>
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
                    <span class="me-3" style="color: #FF9900">Xin chÃ o, <strong><%= customer.getName()%></strong></span>
                    <a href="home?action=booking" class="btn-custom btn-primary-custom me-2">Booking now</a>
                    <a href="LogoutServlet" class="btn-custom me-2">Logout</a>
                </div>
                <% }%>

            </div>
        </nav>
        
        <%@ include file="/WEB-INF/views/booking/select-room.jsp" %>
        <!--STANDARD ROOM-->
        <section class="container room-section">
            <div class="row justify-content-center">
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
                                    <h5 class="card-title text-uppercase">Standard Room King</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>1 King Bed • Sleeps 4 • 70 sq m</p>
                                    <p>Superior Suite King, 70 SQM, 1 King Bed, One-Bedroom Suite & Balcony, Maximum 2 Adults & 2 Children.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 2 adults.</li>
                                            <li>Voucher F&B credit VND 500,000 net per stay</li>
                                        </ul>
                                        <div class="price">1.500.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <!--                                        <button class="book-now-button" href="confirmation.jsp">BOOK NOW</button>-->
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="container room-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/standardRoomDouble.png" alt="Room Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🛀 Bathtub</li>
                                    <li>📶 Free Wifi</li>
                                    <li>🌡️ Air Conditioning</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Standard Room Twin</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>2 Twin Bed • Sleeps 4 • 40 sq m</p>
                                    <p>Sumptuous breakfast for 2 adults & 2 children under 6 years old.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 4 adults.</li>
                                            <li>Voucher F&B credit VND 200,000 net per stay</li>
                                        </ul>
                                        <div class="price">2.100.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!--DELUXE ROOM-->
        <section class="container room-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/DeluxeRoom.png" alt="Room Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🛀 Bathtub</li>
                                    <li>📶 Free Wifi</li>
                                    <li>🌡️ Air Conditioning</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Deluxe Room King</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>1 King Bed • Sleeps 4 • 100 sq m</p>
                                    <p>Superior Deluxe King, 100 SQM, 1 King Bed, One-Bedroom Suite & Balcony, Maximum 2 Adults & 2 Children.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 2 adults.</li>
                                            <li>Voucher F&B credit VND 300,000 net per stay</li>
                                        </ul>
                                        <div class="price">2.300.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="container room-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/deluxeRoomDouble.png" alt="Room Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🛀 Bathtub</li>
                                    <li>📶 Free Wifi</li>
                                    <li>🌡️ Air Conditioning</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Deluxe Room Twin</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>2 Twin Bed • Sleeps 4 • 40 sq m</p>
                                    <p>Sumptuous breakfast for 2 adults & 2 children under 6 years old.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 4 adults.</li>
                                            <li>Voucher F&B credit VND 500,000 net per stay</li>
                                        </ul>
                                        <div class="price">3.050.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!--SUITE ROOM-->
        <section class="container room-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/SuiteRoom.png" alt="Room Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🛀 Bathtub</li>
                                    <li>📶 Free Wifi</li>
                                    <li>🌡️ Air Conditioning</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Suite Room King</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>1 King Bed • Sleeps 4 • 120 sq m</p>
                                    <p>Superior Suite King, 120 SQM, 1 King Bed, One-Bedroom Suite & Balcony, Maximum 2 Adults & 2 Children.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 2 adults.</li>
                                            <li>Voucher F&B credit VND 200,000 net per stay</li>
                                        </ul>
                                        <div class="price">3.499.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="container room-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/suiteRoomDouble.png" alt="Room Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🛀 Bathtub</li>
                                    <li>📶 Free Wifi</li>
                                    <li>🌡️ Air Conditioning</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Deluxe Room Twin</h5>
                                    <p>One-Bedroom Suite with Living Room & Balcony</p>
                                    <p>2 Twin Bed • Sleeps 4 • 50 sq m</p>
                                    <p>Sumptuous breakfast for 2 adults & 2 children under 6 years old.</p>
                                    <hr>
                                    <div class="online-exclusives">
                                        <h5>Online Exclusives Offer - Asia Escape</h5>
                                        <ul>
                                            <li>Sumptuous breakfast for 4 adults.</li>
                                            <li>Voucher F&B credit VND 400,000 net per stay</li>
                                        </ul>
                                        <div class="price">4.090.000 VNĐ</div>
                                        <div class="price-note">Per Night (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--footer-->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>