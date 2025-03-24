<%-- 
    Document   : bookingService
    Created on : Mar 18, 2025, 4:02:58 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .meal-section{
                margin-top: 56px;
            }
        </style>
    </head>
    <body>


        <!--Header--> 
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>
        <!-- Phần Đặt Bữa Ăn -->
        <section class="container meal-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/meal.png" alt="Meal Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>🍳 Breakfast</li>
                                    <li>🍛 Lunch</li>
                                    <li>🍲 Dinner</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Book Your Meal</h5>
                                    <p>Select Your Preferred Meal</p>
                                    <hr>
                                    <div class="meal-offer">
                                        <h5>Choose Your Meal</h5>
                                        <select class="form-select mb-3" id="meal-select">
                                            <option value="" selected>Select a Meal</option>
                                            <option value="Breakfast">Buffet Breakfast - 200.000 VNĐ</option>
                                            <option value="Lunch">Lunch Set - 300.000 VNĐ</option>
                                            <option value="Dinner">Dinner Set - 350.000 VNĐ</option>
                                        </select>

                                        <!-- Số lượng người dùng -->
                                        <label for="meal-quantity" class="form-label">Number of People:</label>
                                        <input type="number" id="meal-quantity" class="form-control mb-3" min="1" value="1">

                                        <!-- Ghi chú thêm -->
                                        <label for="meal-note" class="form-label">Special Requests:</label>
                                        <textarea id="meal-note" class="form-control mb-3" rows="2" placeholder="Enter any special requests..."></textarea>

                                        <div class="price-note">Per Person (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Phần Đặt Nước Uống -->
        <section class="container drink-section">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-4">
                    <div class="card shadow-sm">
                        <div class="row g-0">
                            <!-- Image Section -->
                            <div class="col-md-4 bg-light p-0">
                                <img src="${pageContext.request.contextPath}/images/drink.png" alt="Drink Image" class="img-fluid w-100">
                                <ul class="list-unstyled p-3 mb-0">
                                    <li>☕ Coffee</li>
                                    <li>🍹 Juice</li>
                                    <li>🥤 Soft Drinks</li>
                                </ul>
                            </div>
                            <!-- Description Section -->    
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase">Book Your Drink</h5>
                                    <p>Select Your Preferred Drink</p>
                                    <hr>
                                    <div class="drink-offer">
                                        <h5>Choose Your Drink</h5>
                                        <select class="form-select mb-3" id="drink-select">
                                            <option value="" selected>Select a Drink</option>
                                            <option value="Coffee">Coffee - 50.000 VNĐ</option>
                                            <option value="Juice">Fresh Juice - 70.000 VNĐ</option>
                                            <option value="SoftDrink">Soft Drinks - 40.000 VNĐ</option>
                                        </select>

                                        <!-- Số lượng người dùng -->
                                        <label for="drink-quantity" class="form-label">Number of Drinks:</label>
                                        <input type="number" id="drink-quantity" class="form-control mb-3" min="1" value="1">

                                        <!-- Ghi chú thêm -->
                                        <label for="drink-note" class="form-label">Special Requests:</label>
                                        <textarea id="drink-note" class="form-control mb-3" rows="2" placeholder="Enter any special requests..."></textarea>

                                        <div class="price-note">Per Drink (Excluding taxes and fees)</div>
                                        <a href="home?action=confirmation" class="book-now-button">Booking now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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

