<%-- 
    Document   : Room
    Created on : Mar 10, 2025, 12:32:34 PM
    Author     : LENOVO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="model.RoomType"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="rooms container my-5">
    <h2 class="text-center fw-bold mb-4">Featured Room</h2>
    
    
    <div id="roomCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
        <div class="carousel-inner">
            <c:forEach var="room" items="${roomTypes}" varStatus="status">
                <c:if test="${status.index % 3 == 0}">
                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                        <div class="row g-4">
                </c:if>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card shadow-sm border-0">
                        <img src="${room.image}" class="card-img-top" alt="${room.typeName}" style="width: 100%; height: 250px; object-fit: cover;">
                        <div class="card-body text-center">
                            <h5 class="card-title">${room.typeName}</h5>
                            <p class="card-text text-muted">Capacity: <strong>${room.capacity} guests</strong></p>
                            <a href="#" class="btn btn-primary">Book Now</a>
                        </div>
                    </div>
                </div>
                
                <c:if test="${(status.index + 1) % 3 == 0 || status.last}">
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#roomCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#roomCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        let carousel = new bootstrap.Carousel(document.getElementById("roomCarousel"), {
            interval: 5000,
            ride: "carousel"
        });
    });
</script>