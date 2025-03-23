<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment Page | Quang Da Hotel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/confirmation.css">
    </head>
    <body>
        <!-- Background -->
        <div id="background-container"></div>

        <!-- Main Container -->
        <div class="container-box">
            <div class="header">
                <h2>Payment Confirmation</h2>
            </div>

            <div class="content">
                <!-- Lấy thông tin khách hàng từ Session -->
                <%
                    Customer customer = (Customer) session.getAttribute("customer");
                    if (customer == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }

                    // Lấy thông tin từ request (được gửi từ confirmation.jsp)
                    String roomType = request.getParameter("roomType");
                    String description = request.getParameter("description");
                    String capacity = request.getParameter("capacity");
                    String price = request.getParameter("price");
                    String checkIn = request.getParameter("checkIn");
                    String checkOut = request.getParameter("checkOut");
                    String[] services = request.getParameterValues("services");
                    String[] offers = request.getParameterValues("offers");
                %>

                <!-- Hiển thị thông tin khách hàng -->
                <div class="card">
                    <div class="card-header">Customer Information</div>
                    <div class="card-body">
                        <div class="info-row">
                            <div class="info-label">Name:</div>
                            <div><%= customer.getName() %></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Email:</div>
                            <div><%= customer.getEmail() %></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Phone:</div>
                            <div><%= customer.getPhone() %></div>
                        </div>
                    </div>
                </div>

                <!-- Hiển thị thông tin đặt phòng -->
                <div class="card mt-3">
                    <div class="card-header">Booking Information</div>
                    <div class="card-body">
                        <div class="info-row"><div class="info-label">Room Type:</div><div><%= roomType %></div></div>
                        <div class="info-row"><div class="info-label">Description:</div><div><%= description %></div></div>
                        <div class="info-row"><div class="info-label">Capacity:</div><div><%= capacity %> People</div></div>
                        <div class="info-row"><div class="info-label">Price:</div><div><%= price %> VND per night</div></div>
                        <div class="info-row"><div class="info-label">Check-In:</div><div><%= checkIn %></div></div>
                        <div class="info-row"><div class="info-label">Check-Out:</div><div><%= checkOut %></div></div>
                    </div>
                </div>

                <!-- Hiển thị các dịch vụ đã chọn -->
                <div class="card mt-3">
                    <div class="card-header">Selected Services</div>
                    <div class="card-body">
                        <% if (services != null) { %>
                            <ul>
                                <% for (String service : services) { %>
                                    <li><%= service %></li>
                                <% } %>
                            </ul>
                        <% } else { %>
                            <p>No additional services selected.</p>
                        <% } %>
                    </div>
                </div>

                <!-- Hiển thị các ưu đãi đã chọn -->
                <div class="card mt-3">
                    <div class="card-header">Selected Offers</div>
                    <div class="card-body">
                        <% if (offers != null) { %>
                            <ul>
                                <% for (String offer : offers) { %>
                                    <li><%= offer %></li>
                                <% } %>
                            </ul>
                        <% } else { %>
                            <p>No offers selected.</p>
                        <% } %>
                    </div>
                </div>

                <!-- Form thanh toán -->
                <form action="ProcessPaymentServlet" method="POST">
                    <div class="card mt-3">
                        <div class="card-header">Choose Payment Method</div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" value="Credit Card" id="creditCard" required>
                                <label class="form-check-label" for="creditCard">Credit Card</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" value="E-Wallet" id="eWallet">
                                <label class="form-check-label" for="eWallet">E-Wallet (Momo, ZaloPay, etc.)</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" value="Cash" id="cash">
                                <label class="form-check-label" for="cash">Cash (Pay at hotel)</label>
                            </div>
                        </div>
                    </div>

                    <!-- Gửi tất cả thông tin sang servlet -->
                    <input type="hidden" name="roomType" value="<%= roomType %>">
                    <input type="hidden" name="description" value="<%= description %>">
                    <input type="hidden" name="capacity" value="<%= capacity %>">
                    <input type="hidden" name="price" value="<%= price %>">
                    <input type="hidden" name="checkIn" value="<%= checkIn %>">
                    <input type="hidden" name="checkOut" value="<%= checkOut %>">

                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary">Proceed to Payment</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
