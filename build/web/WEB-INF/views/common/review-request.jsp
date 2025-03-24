<%-- 
    Document   : ReviewRequest
    Created on : Mar 11, 2025, 9:57:30 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="review-section">
    <h2>REVIEWS FROM OUR VALUED GUESTS</h2>
    <p>“We listen to our client with our heart and improve continuously.”</p>

    <div class="review-container">
        <button id="prevBtn" class="control-btn">←</button>

        <div class="review-image">
            <img src="<%=request.getContextPath()%>/images/reviewsguests.png" alt="TripAdvisor Award">
        </div>

        <div class="review-content">
            <h3 id="hotelName">QuangDa Hotel & Suites</h3>
            <div class="dots"></div>
            <div id="reviewText" class="review-text"></div>
            <div class="review-author" id="reviewAuthor"></div>
            <div class="review-date" id="reviewDate"></div>
        </div>

        <button id="nextBtn" class="control-btn">→</button>
    </div>
</div>


