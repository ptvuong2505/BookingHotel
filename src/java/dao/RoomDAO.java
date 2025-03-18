package dao;

import database.DBConnection;
import model.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO implements BaseDAO<Room> {
    private Connection getConnection() {
        return DBConnection.getConnect();
    }

    @Override
    public List<Room> getAll() {
        List<Room> rooms = new ArrayList<>();
        String query = "SELECT * FROM Room";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                rooms.add(new Room(
                    rs.getInt("RoomID"),
                    rs.getString("RoomNumber"),
                    rs.getInt("RoomTypeID"),
                    rs.getInt("HotelID"),
                    rs.getDouble("Price"),
                    rs.getString("Status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    @Override
    public Room getById(int id) {
        String query = "SELECT * FROM Room WHERE RoomID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Room(
                        rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("RoomTypeID"),
                        rs.getInt("HotelID"),
                        rs.getDouble("Price"),
                        rs.getString("Status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Room room) {
        String query = "INSERT INTO Room (RoomNumber, RoomTypeID, HotelID, Price, Status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, room.getRoomNumber());
            pstmt.setInt(2, room.getRoomTypeID());
            pstmt.setInt(3, room.getHotelID());
            pstmt.setDouble(4, room.getPrice());
            pstmt.setString(5, room.getStatus());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Room room) {
        String query = "UPDATE Room SET RoomNumber = ?, RoomTypeID = ?, HotelID = ?, Price = ?, Status = ? WHERE RoomID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, room.getRoomNumber());
            pstmt.setInt(2, room.getRoomTypeID());
            pstmt.setInt(3, room.getHotelID());
            pstmt.setDouble(4, room.getPrice());
            pstmt.setString(5, room.getStatus());
            pstmt.setInt(6, room.getRoomID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM Room WHERE RoomID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
