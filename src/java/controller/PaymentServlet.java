/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import  model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String paymentMethod=request.getParameter("paymentMethod");
        double totalAmount=(double) session.getAttribute("totalAmount");
        Room room= (Room) session.getAttribute("room");
        Customer customer =(Customer) session.getAttribute("customer");
        
        
        
        BookingDAO bookingDAO=new BookingDAO();
        
        Booking booking=new  Booking();
        booking.setCheckInDate((Date) session.getAttribute("checkInDate"));
        booking.setCheckOutDate((Date) session.getAttribute("checkOutDate"));
        booking.setCustomerID(customer.getCustomerID());
        booking.setRoomID(room.getRoomID());
        booking.setHotelID(room.getHotelID());
        booking.setTotalPrice(totalAmount);
        booking.setStatus("Pending");
        bookingDAO.insert(booking);
        
        booking=bookingDAO.getLastBooking();
        InvoiceDAO invoiceDAO=new InvoiceDAO();
        Invoice invoice=new Invoice();
        
        invoice.setBookingID(booking.getBookingID());
        invoice.setPaymentDate(new Date());
        invoice.setPaymentMethod(paymentMethod);
        invoice.setPaymentStatus("Paid");
        invoice.setTotalAmount(totalAmount);
                
                List<Booking> bookings=bookingDAO.getBookingsByCustomerId(customer.getCustomerID());
        session.setAttribute("bookings", bookings);
        invoiceDAO.insert(invoice);
        
        System.out.println(invoice.toString());
        
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
