<%-- 
    Document   : bookingVehicle
    Created on : Mar 18, 2025, 4:07:57 PM
    Author     : LENOVO
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quảng Đà Hotel</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/booking_room.css">
    </head>
    <body>


        <!--Header--> 
        <nav class="navbar navbar-expand-lg custom-navbar fixed-top shadow-sm">
            <div class="container d-flex justify-content-between align-items-center">
                <!-- Logo --> 
                <div class="header-logo">
                    <img src="${pageContext.request.contextPath}/images/QuangDaLogo.jpg" alt="Quảng Đà Hotel" class="logo">
                </div>

                <!-- Menu -->
                <div class="header-service" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="bookingVehicle.jsp">Offers</a>
                            <ul class="dropdown-menu">
                                <li><a href="bookingVehicle.jsp">Motorbike Rental</a></li>
                                <li><a href="bookingVehicle.jsp">Car Rental</a></li>
                                <li><a href="bookingVehicle.jsp">Golf Trip</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="bookingService.jsp">Dine And Drink</a>
                            <ul class="dropdown-menu">
                                <li><a href="bookingService.jsp">Breakfast</a></li>
                                <li><a href="bookingService.jsp">Lunch</a></li>
                                <li><a href="bookingService.jsp">Dining</a></li>
                                <li><a href="bookingService.jsp">Water</a></li>
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
                    <a href="login.jsp" class="btn-custom me-2">Login</a>
                    <a href="register.jsp" class="btn-custom me-2">Register</a>
                    <a href="bookingRoom.jsp" class="btn-custom btn-primary-custom">Booking now</a>
                </div>
                <% } else {%>
                <!-- Nếu đã đăng nhập -->
                <div class="header-login d-flex align-items-center">
                    <span class="me-3" style="color: #FF9900">Xin chào, <strong><%= customer.getName()%></strong></span>
                    <a href="LogoutServlet" class="btn-custom me-2">Logout</a>
                </div>
                <% }%>

            </div>
        </nav>
        <section class="container vehicle-rental-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/vehicle.png" alt="Vehicle Rental" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🏍️ Motorbike Rental</li>
                                    <li>🚗 Car Rental</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Vehicle Rental</h5>
                                    <p>Select Your Preferred Vehicle</p>
                                    <hr>
                                    <div>
                                        <select class="form-select mb-3" id="vehicle-select">
                                            <option value="" selected>Select a Vehicle</option>
                                            <option value="Motorbike">Motorbike - 150.000 VNĐ / day</option>
                                            <option value="Car">Car - 1.000.000 VNĐ / day</option>
                                        </select>

                                        <label for="vehicle-days" class="form-label">Number of Vehicle:</label>
                                        <input type="number" id="vehicle-days" class="form-control mb-3" min="1" value="1">

                                        <label for="vehicle-note" class="form-label">Special Requests:</label>
                                        <textarea id="vehicle-note" class="form-control mb-3" rows="2" placeholder="Enter any special requests..."></textarea>

                                        <button class="book-now-button">BOOK NOW</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Phần Đặt Dịch Vụ Đánh Golf -->
        <section class="container golf-booking-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/golf.png" alt="Golf Trip" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🏌️‍♂️ Golf Trip</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Golf Booking</h5>
                                    <p>Book Your Golf Trip</p>
                                    <hr>
                                    <div>
                                        <label for="golf-people" class="form-label">Number of People:</label>
                                        <input type="number" id="golf-people" class="form-control mb-3" min="1" value="1">

                                        <label for="golf-note" class="form-label">Special Requests:</label>
                                        <textarea id="golf-note" class="form-control mb-3" rows="2" placeholder="Enter any special requests..."></textarea>

                                        <div class="price-note">Cost: 2.000.000 VNĐ per person</div>
                                        <button class="book-now-button">BOOK NOW</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--footer-->
        <footer>
            <div class="footer-container">
                <div class="footer-column">
                    <img src="images/QuangDaLogo.jpg" alt="QuangDa Logo">
                </div>
                <div class="footer-column">
                    <h3>Contact Us</h3>
                    <p>📧 enquiry@QuangDa.com</p>
                    <p>☎️ Hotline: +84 (0) 235 858 8888</p>
                </div>
                <div class="footer-column">
                    <h3>Follow Us</h3>
                    <div class="social-icons">
                        <p >🔗 Facebook</p>
                        <p>🔗 LinkedIn</p>
                        <p>🔗 Instagram</p>
                        <p>🔗 YouTube</p>
                    </div>
                </div>
            </div>


            <div class="logo-section">

                <div>
                    <span>NEW WORLD</span>
                    QUANGDA BEACH RESORT<br>
                    VIETNAM
                </div>
                <div>
                    <span>NEW WORLD</span>
                    QUANGDA HOTEL<br>
                    VIETNAM
                </div>
                <div>
                    <span>QUANGDA</span>
                    HOTEL × SUITES
                </div>
                <div>
                    <span>RESIDENCES</span>
                    QUANGDA
                </div>
                <div>
                    <span>QUANGDA SHORES</span>
                    GOLF CLUB
                </div>
            </div>

            <div class="footer-bottom">
                © Copyright 2025 QuangDa<br>
                Hoi An South Development LTD<br>
                Address: Tay Son Tay Hamlet, Duy Hai Commune, Duy Xuyen District, Quang Nam Province, Vietnam<br>
                Business Registration Certificate: 4000789705 issued on 10/12/2010, sixteenth updated on 25/08/2022 by Quang Nam Department of Planning and Investment
            </div>
        </footer>

</html>

