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
                                            <option value="Breakfast">Buffet Breakfast - 10.00 USD</option>
                                            <option value="Lunch">Lunch Set - 15.00 USD</option>
                                            <option value="Dinner">Dinner Set - 20.00 USD</option>
                                        </select>

                                        <div class="price-note">Per Person (Excluding taxes and fees)</div>
                                        <a href="home?action=booking" class="book-now-button">Booking now</a>
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
                                            <option value="Coffee">Coffee - 3.00 USD</option>
                                            <option value="Juice">Fresh Juice - 4.00 USD</option>
                                            <option value="SoftDrink">Soft Drinks - 2.00 USD</option>
                                        </select>

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
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>

</html>

