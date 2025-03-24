package dao;

import model.Booking;
import database.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO implements BaseDAO<Booking> {
    
    @Override
    public List<Booking> getAll() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("bookingID"),
                        rs.getInt("customerID"),
                        rs.getInt("roomID"),
                        rs.getInt("hotelID"),
                        rs.getDate("checkInDate"),
                        rs.getDate("checkOutDate"),
                        rs.getDouble("totalPrice"),
                        rs.getString("status")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    @Override
    public Booking getById(int id) {
        String sql = "SELECT * FROM Booking WHERE bookingID = ?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Booking(
                            rs.getInt("bookingID"),
                            rs.getInt("customerID"),
                            rs.getInt("roomID"),
                            rs.getInt("hotelID"),
                            rs.getDate("checkInDate"),
                            rs.getDate("checkOutDate"),
                            rs.getDouble("totalPrice"),
                            rs.getString("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Booking booking) {
        String sql = "INSERT INTO Booking (customerID, roomID, hotelID, checkInDate, checkOutDate, totalPrice, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, booking.getCustomerID());
            stmt.setInt(2, booking.getRoomID());
            stmt.setInt(3, booking.getHotelID());
            stmt.setDate(4, new java.sql.Date(booking.getCheckInDate().getTime()));
            stmt.setDate(5, new java.sql.Date(booking.getCheckOutDate().getTime()));
            stmt.setDouble(6, booking.getTotalPrice());
            stmt.setString(7, booking.getStatus());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Booking booking) {
        String sql = "UPDATE Booking SET customerID=?, roomID=?, hotelID=?, checkInDate=?, checkOutDate=?, totalPrice=?, status=? WHERE bookingID=?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, booking.getCustomerID());
            stmt.setInt(2, booking.getRoomID());
            stmt.setInt(3, booking.getHotelID());
            stmt.setDate(4, new java.sql.Date(booking.getCheckInDate().getTime()));
            stmt.setDate(5, new java.sql.Date(booking.getCheckOutDate().getTime()));
            stmt.setDouble(6, booking.getTotalPrice());
            stmt.setString(7, booking.getStatus());
            stmt.setInt(8, booking.getBookingID());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Booking WHERE bookingID=?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
