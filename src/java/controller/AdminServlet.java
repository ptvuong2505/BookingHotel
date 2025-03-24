/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookingDAO;
import dao.HotelDAO;
import dao.RoomDAO;
import dao.RoomTypeDAO;
import dao.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Hotel;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        //lay list hotel    
        HotelDAO hotelDAO = new HotelDAO();
        session.setAttribute("hotels", hotelDAO.getAll());
        //lay list room tu hotelID
        RoomDAO roomDAO = new RoomDAO();
        //session.setAttribute("rooms", roomDAO.get);
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        session.setAttribute("roomTypes", roomTypeDAO.getAll());
        BookingDAO bookingDAO=new BookingDAO();
        
        
        
        ServiceDAO serviceDAO = new ServiceDAO();
        session.setAttribute("services", serviceDAO.getAll());

        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/home/home-admin.jsp").forward(request, response);

        }

        switch (action) {
            case "views-hotels":
                request.getRequestDispatcher("/WEB-INF/views/admin/views-hotels.jsp").forward(request, response);
                break;
            case "edit-hotel":
                int hotelID = Integer.parseInt(request.getParameter("hotelID"));
                Hotel hotel = new Hotel();
                hotel = hotelDAO.getById(hotelID);
                session.setAttribute("hotel", hotel);
                request.getRequestDispatcher("/WEB-INF/views/admin/edit-hotel.jsp").forward(request, response);
                break;
            case "views-rooms":

                hotelID = Integer.parseInt(request.getParameter("hotelID"));
                session.setAttribute("hotel", hotelDAO.getById(hotelID));
                session.setAttribute("rooms", roomDAO.getRoomsByHotelId(hotelID));

                request.getRequestDispatcher("WEB-INF/views/admin/views-rooms.jsp").forward(request, response);

                break;
            case "edit-room":
                session.setAttribute("room", roomDAO.getById(Integer.parseInt(request.getParameter("roomID"))));
                request.getRequestDispatcher("/WEB-INF/views/admin/edit-room.jsp").forward(request, response);

                break;
            case "views-roomtypes":

                request.getRequestDispatcher("/WEB-INF/views/admin/views-roomtypes.jsp").forward(request, response);
                break;
            case "edit-roomtype":

                session.setAttribute("roomType", roomTypeDAO.getById(Integer.parseInt(request.getParameter("roomTypeID"))));
                request.getRequestDispatcher("/WEB-INF/views/admin/edit-roomtype.jsp").forward(request, response);
                break;
            case "views-services":
                request.getRequestDispatcher("/WEB-INF/views/admin/views-services.jsp").forward(request, response);
                break;
            case "edit-service":
                session.setAttribute("service", serviceDAO.getById(Integer.parseInt(request.getParameter("serviceID"))));
                request.getRequestDispatcher("/WEB-INF/views/admin/edit-service.jsp").forward(request, response);

                break;
            case "views-bookings":
                session.setAttribute("bookings", bookingDAO.getAll());
                request.getRequestDispatcher("/WEB-INF/views/admin/views-bookings.jsp").forward(request, response);

                break;
            default:
                throw new AssertionError();
        }

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
