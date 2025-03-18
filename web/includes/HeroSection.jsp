<%-- 
    Document   : HeroSection
    Created on : Mar 10, 2025, 12:30:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="hero position-relative">
    <!--            image-->
    <div id="hotelCarousel" class="carousel slide position-absolute top-0 start-0 w-100 h-100" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/Hotel1.png" class="d-block w-100" alt="Khách sạn 1">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel2.png" class="d-block w-100" alt="Khách sạn 2">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel3.png" class="d-block w-100" alt="Khách sạn 3">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel4.png" class="d-block w-100" alt="Khách sạn 4">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel5.png" class="d-block w-100" alt="Khách sạn 5">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel6.png" class="d-block w-100" alt="Khách sạn 6">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel7.png" class="d-block w-100" alt="Khách sạn 7">
            </div>
            <div class="carousel-item">
                <img src="images/Hotel8.png" class="d-block w-100" alt="Khách sạn 8">
            </div>
        </div>
        <!-- Nút điều hướng -->
        <button class="carousel-control-prev" type="button" data-bs-target="#hotelCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#hotelCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>

    <!-- Nội dung đặt phòng -->
    <div class="container text-center position-relative z-3">
        <h2 class="fw-bold text-white">Đặt Phòng Khách Sạn Cao Cấp</h   2>
            <p class="text-white">Trải nghiệm kỳ nghỉ hoàn hảo với dịch vụ đẳng cấp 5 sao.</p>
            <div class="search-box bg-white p-4 rounded shadow">
                <div class="row">
                    <div class="col-md-2">
                        <input type="date" class="form-control" placeholder="Ngày nhận">
                    </div>
                    <div class="col-md-2">
                        <input type="date" class="form-control" placeholder="Ngày trả">
                    </div>
                    <div class="col-md-3">
                        <select class="form-select">
                            <option selected>Room Type</option>
                            <option>Standard</option>
                            <option>Deluxe</option>
                            <option>Suite</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select">
                            <option selected>Number of guests</option>
                            <option>1 person</option>
                            <option>2 person</option>
                            <option>3 person</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary w-100">Search</button>
                    </div>
                </div>
            </div>
    </div>
</header>
