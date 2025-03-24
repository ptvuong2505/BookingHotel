/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package adminPackages;

import dao.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.RoomType;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateRoomTypeServlet", urlPatterns = {"/updateroomtype"})
public class UpdateRoomTypeServlet extends HttpServlet {

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
        int roomTypeID = Integer.parseInt(request.getParameter("roomTypeID"));
        String typeName = request.getParameter("typeName");
        String description = request.getParameter("description");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String image = request.getParameter("image");

        // Tạo đối tượng RoomType
        RoomType roomType = new RoomType(roomTypeID, typeName, description, capacity, image);

        // Cập nhật vào database
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        boolean isUpdated = roomTypeDAO.update(roomType);

        if (isUpdated) {
            request.getSession().setAttribute("message", "Cập nhật thành công!");
        } else {
            request.getSession().setAttribute("error", "Cập nhật thất bại!");
        }

        // Chuyển hướng về danh sách loại phòng
        response.sendRedirect("admin?action=views-roomtypes");
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
