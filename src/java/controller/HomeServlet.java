/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.HotelDAO;
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
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        HotelDAO hotelDAO = new HotelDAO();
        ServiceDAO serviceDAO=new ServiceDAO();
        
        session.setAttribute("services", serviceDAO.getAll());
        session.setAttribute("hotels", hotelDAO.getAll());
        session.setAttribute("roomTypes", roomTypeDAO.getAll());
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/views/home/home.jsp").forward(request, response);
        }
        switch (action) {
            case "login":
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
                break;
            case "register":
                request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
                break;
            case "search":
                request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
                break;
            case "forgot-password":
                request.getRequestDispatcher("/WEB-INF/views/auth/forgot-password.jsp").forward(request, response);
                break;

            case "booking":
                if (session.getAttribute("customer")==null){
                    request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
                 break;
                }
                request.getRequestDispatcher("/WEB-INF/views/booking/bookingRoom.jsp").forward(request, response);
                break;
            case "bookingService":
                request.getRequestDispatcher("/WEB-INF/views/booking/bookingService.jsp").forward(request, response);
                break;
            case "bookingVehicle":
                request.getRequestDispatcher("/WEB-INF/views/booking/bookingVehicle.jsp").forward(request, response);
                break;
            case "confirmation":
                if (session.getAttribute("customer")==null){
                    request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
                    break;
                }
                request.getRequestDispatcher("/WEB-INF/views/confirmation/confirmation.jsp").forward(request, response);
                break;
            case "payment":
                if (session.getAttribute("customer")==null){
                    request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
                    break;
                }
                String[] selectedServices = request.getParameterValues("services");

                if (selectedServices != null) {
                    for (String service : selectedServices) {
                        System.out.println("Dịch vụ đã chọn: " + service);
                    }
                } else {
                    System.out.println("Không có dịch vụ nào được chọn............................");
                }

                request.getRequestDispatcher("/WEB-INF/views/payment/payment.jsp").forward(request, response);
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
