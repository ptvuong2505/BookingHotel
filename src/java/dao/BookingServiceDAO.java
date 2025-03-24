package dao;

import model.BookingService;
import database.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingServiceDAO implements BaseDAO<BookingService> {
    
    @Override
    public List<BookingService> getAll() {
        List<BookingService> bookingServices = new ArrayList<>();
        String sql = "SELECT * FROM BookingService";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                BookingService bookingService = new BookingService(
                        rs.getInt("bookingID"),
                        rs.getInt("serviceID")
                );
                bookingServices.add(bookingService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingServices;
    }

    @Override
    public BookingService getById(int id) {
        return null; // Không có ID duy nhất, nên phương thức này không được hỗ trợ.
    }

    public List<BookingService> getByBookingId(int bookingID) {
        List<BookingService> services = new ArrayList<>();
        String sql = "SELECT * FROM BookingService WHERE bookingID = ?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bookingID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    services.add(new BookingService(
                            rs.getInt("bookingID"),
                            rs.getInt("serviceID")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    @Override
    public boolean insert(BookingService bookingService) {
        String sql = "INSERT INTO BookingService (bookingID, serviceID) VALUES (?, ?)";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, bookingService.getBookingID());
            stmt.setInt(2, bookingService.getServiceID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(BookingService bookingService) {
        return false; // Không có thông tin cần cập nhật, nên phương thức này không được hỗ trợ.
    }

    @Override
    public boolean delete(int bookingID) {
        String sql = "DELETE FROM BookingService WHERE bookingID = ?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, bookingID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}