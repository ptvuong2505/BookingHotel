package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.*;

/**
 *
 * @author ADMIN
 */
@WebServlet(urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        String url;
        User result = UserDAO.selectUserByUAndP(username,password );
        if (result != null) {
            if (result.getRole().equalsIgnoreCase("Customer")) {
                CustomerDAO customerDAO = new CustomerDAO();
                Customer customer = customerDAO.getById(result.getUserID());
                HttpSession session = request.getSession();
                session.setAttribute("customer", customer);
                
                BookingDAO bookingDAO=new BookingDAO();
                List<Booking> bookings=bookingDAO.getBookingsByCustomerId(customer.getCustomerID());
                
                session.setAttribute("bookings", bookings);
                session.setMaxInactiveInterval(30 * 60); // Session tồn tại 30 phút
                if("on".equals(remember)){
                    Cookie userCookie = new Cookie("username", username);
                    userCookie.setMaxAge(3 * 24 * 60 * 60); // 3days
                    response.addCookie(userCookie);
                }
            }else{
                // for admin
            }
            response.sendRedirect(request.getContextPath() + "/home");
           
            //url = "index.jsp";
        }else{
            request.setAttribute("username", username);
            request.setAttribute("errorMes", "Username or Password not correct!");
            url = "login.jsp";
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
        return;
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
