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
                                            <option value="Motorbike">Motorbike - 25.99 USD / day</option>
                                            <option value="Car">Car - 49.99 USD / day</option>
                                        </select>

                                        <a href="home?action=booking" class="book-now-button">Booking now</a>
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
                                        <div class="price-note">Cost: 239.99 USD per person</div>
                                        <a href="home?action=booking" class="book-now-button">Booking now</a>
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

</html>

