/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RoomController", urlPatterns = {"/RoomController"})
public class RoomController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        HttpSession session=request.getSession();
        String hotelIDParam = request.getParameter("hotel");
        String roomTypeIDParam = request.getParameter("roomType");
        
            
        try {
            String checkInDateStr = request.getParameter("checkInDate");
            String checkOutDateStr = request.getParameter("checkOutDate");

            // Chuyển đổi chuỗi ngày thành kiểu Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = sdf.parse(checkInDateStr);
            Date checkOutDate = sdf.parse(checkOutDateStr);
            
            session.setAttribute("checkInDate", checkInDate);
            session.setAttribute("checkOutDate", checkOutDate);
        } catch (Exception e) {
            System.out.println("Can not parse Date");
        }
        
        int hotelID = (hotelIDParam != null && !hotelIDParam.isEmpty()) ? Integer.parseInt(hotelIDParam) : 0;
        int roomTypeID = (roomTypeIDParam != null && !roomTypeIDParam.isEmpty()) ? Integer.parseInt(roomTypeIDParam) : 0;
        session.setAttribute("hotelID", hotelID);
        session.setAttribute("roomTypeID", roomTypeID);
        
        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getRoomsByFilter(hotelID, roomTypeID);
        
        HotelDAO hotelDAO=new HotelDAO();
        
        RoomTypeDAO roomTypeDAO= new RoomTypeDAO();
        
        session.setAttribute("typeName",roomTypeDAO.getById(roomTypeID).getTypeName() );
        session.setAttribute("hotelName",hotelDAO.getById(hotelID).getName());
        session.setAttribute("rooms", rooms);
        request.getRequestDispatcher("/WEB-INF/views/booking/bookingRoom.jsp").forward(request, response);
    
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(RoomController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(RoomController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
