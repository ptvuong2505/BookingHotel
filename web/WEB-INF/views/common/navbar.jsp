<%@page import="model.Customer"   %>
<body>
    <!--Header-->
    <nav class="navbar navbar-expand-lg custom-navbar fixed-top shadow-sm">
        <div class="container d-flex justify-content-between align-items-center">
            <!-- Logo --> 
            <div class="header-logo">
                <img src="images/QuangDaLogo.jpg" alt="Qu?ng ?à Hotel" class="logo">
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
                <span class="me-3" style="color: #FF9900">Xin chào, <strong><%= customer.getName()%></strong></span>
                <a href="home?action=booking" class="btn-custom btn-primary-custom me-2">Booking now</a>
                <a href="home?action=bookingHistory" class="btn-custom btn-primary-custom me-2">History</a>
                <a href="LogoutServlet" class="btn-custom me-2">Logout</a>
            </div>
            <% }%>
        </div>
    </nav>
