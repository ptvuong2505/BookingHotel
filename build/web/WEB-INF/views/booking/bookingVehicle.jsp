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
        <style>
            .vehicle-rental-section{
                margin-top: 56px;
            }
        </style>
    </head>
    <body>


        <!--Header--> 
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
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

                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
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

