<%-- 
    Document   : index
    Created on : Mar 24, 2025, 9:52:03 PM
    Author     : ADMIN
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
        <link rel="stylesheet" href="CSS/Styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/booking_room.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!--Header-->
        <nav class="navbar navbar-expand-lg custom-navbar fixed-top shadow-sm">
            <div class="container d-flex justify-content-between align-items-center">
                <!-- Logo --> 
                <div class="header-logo">
                    <a href="home" ><img src="images/QuangDaLogo.jpg" alt="Qu?ng ?à Hotel" class="logo"></a>
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
                    <a href="home?action=booking" class="btn-custom btn-primary-custom me-2">Booking now</a>
                    <a href="LogoutServlet" class="btn-custom me-2">Logout</a>
                </div>
                <% }%>
            </div>
        </nav>


        <header class="hero position-relative">
            <!-- Hình ảnh từ database -->
            <div id="hotelCarousel" class="carousel slide position-absolute top-0 start-0 w-100 h-100" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="hotel" items="${hotels}" varStatus="status">
                        <div class="carousel-item ${status.first ? 'active' : ''}">
                            <img src="${hotel.image}" class="d-block w-100" alt="${hotel.name}">
                            <p>${hotel.name}</p>
                        </div>
                    </c:forEach>
                </div>
                <!-- Nút điều hướng -->
                <button class="carousel-control-prev" type="button" data-bs-target="#hotelCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#hotelCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
            </div>
            <!-- Form đặt phòng -->
            <div class="search-box bg-white p-4 rounded shadow">
                <form action="RoomController" method="post" class="row">
                    <!-- Chọn Hotel -->
                    <div class="col-md-3">
                        <select class="form-select" name="hotel" required>
                            <option value="" selected>Select Hotel</option>
                            <c:forEach var="hotel" items="${hotels}">
                                <option value="${hotel.hotelID}">${hotel.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Chọn ngày nhận -->
                    <div class="col-md-2">
                        <input type="date" class="form-control" name="checkInDate" id="checkInDate" min="">
                    </div>

                    <!-- Chọn ngày trả -->
                    <div class="col-md-2">
                        <input type="date" class="form-control" name="checkOutDate" id="checkOutDate" min="">
                    </div>

                    <!-- Chọn loại phòng -->
                    <div class="col-md-3">
                        <select class="form-select" name="roomType" required>
                            <option selected>Room Type</option>
                            <c:forEach var="room" items="${roomTypes}">
                                <option value="${room.roomTypeID}">${room.typeName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Nút tìm kiếm -->
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">Search</button>
                    </div>
                </form>
            </div>
            <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
            <df-messenger intent="WELCOME" chat-title="Quang-Da-Hotel" agent-id="4b6bc046-472c-456b-bb89-52196dde91ad"
                          language-code="en"></df-messenger>
        </header>


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
        <div class="container text-center my-5">
            <h2 class="title">#MADEINQUANGDA</h2>
            <p class="subtitle">Feedback từ khách hàng</p>

            <div class="row justify-content-center">
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram1.jpg" class="img-fluid" alt="Feedback 1">
                        <p>@i_love_french_fries</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram2.jpg" class="img-fluid" alt="Feedback 2">
                        <p>@misssummerchang</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram3.jpg" class="img-fluid" alt="Feedback 3">
                        <p>@charity_event</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram4.jpg" class="img-fluid" alt="Feedback 4">
                        <p>@ccworldofwanderlust</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram5.jpg" class="img-fluid" alt="Feedback 5">
                        <p>@misstmcuong</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram6.jpg" class="img-fluid" alt="Feedback 6">
                        <p>@ptvuong </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram7.jpg" class="img-fluid" alt="Feedback 7">
                        <p>@phuy</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                    <div class="feedback-item">
                        <img src="images/instagram8.jpg" class="img-fluid" alt="Feedback 8">
                        <p>@hope_event</p>
                    </div>
                </div>
            </div>
        </div>
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

        <script>
            const reviews = [
                {
                    text: "Wonderful hotel. QuangDa Hotel & Suites was facing the sea, superb views. It was spacious and exquisitely designed. Staff is friendly and willing to help. Will definitely come back!",
                    author: "MR. IGNACIO MANJON",
                    date: "Jan 2023"
                },
                {
                    text: "A truly luxurious experience. The rooms are beautifully designed and the views are breathtaking. The food was delicious and the service impeccable!",
                    author: "MRS. SARAH LEE",
                    date: "Feb 2023"
                },
                {
                    text: "Exceptional service and facilities. Highly recommended for anyone looking to relax and enjoy a high-end vacation experience.",
                    author: "MR. JAMES NGUYEN",
                    date: "Mar 2023"
                },
                {
                    text: "Beautiful hotel with amazing views. The pool was incredible and the rooms were spacious and luxurious. Will definitely visit again!",
                    author: "MRS. EMMA WILLIAMS",
                    date: "Apr 2023"
                }
            ];
            let currentIndex = 0;
            const reviewText = document.getElementById('reviewText');
            const reviewAuthor = document.getElementById('reviewAuthor');
            const reviewDate = document.getElementById('reviewDate');
            const dotsContainer = document.querySelector('.dots');
            function updateReview() {
                const currentReview = reviews[currentIndex];
                reviewText.innerHTML = currentReview.text;
                reviewAuthor.innerHTML = currentReview.author;
                reviewDate.innerHTML = currentReview.date;
                let dotsHTML = "";
                reviews.forEach((_, index) => {
                    dotsHTML += '<span class="dot ' + (index === currentIndex ? 'active-dot' : '') + '" data-index="' + index + '"></span>';
                });
                dotsContainer.innerHTML = dotsHTML;
            }

            document.getElementById('nextBtn').addEventListener('click', () => {
                currentIndex = (currentIndex + 1) % reviews.length;
                updateReview();
            });
            document.getElementById('prevBtn').addEventListener('click', () => {
                currentIndex = (currentIndex - 1 + reviews.length) % reviews.length;
                updateReview();
            });
            dotsContainer.addEventListener('click', (e) => {
                if (e.target.classList.contains('dot')) {
                    currentIndex = parseInt(e.target.getAttribute('data-index'));
                    updateReview();
                }
            });
            let carousel = new bootstrap.Carousel(document.getElementById("roomCarousel"), {
                interval: 5000,
                ride: "carousel"
            });
            updateReview();

        </script>
    </body>
</html>
