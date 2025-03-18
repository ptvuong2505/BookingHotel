package dao;

import model.RoomType;
import model.DatabaseInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomTypeDAO implements BaseDAO<RoomType> {
    
    @Override
    public List<RoomType> getAll() {
        List<RoomType> roomTypes = new ArrayList<>();
        String sql = "SELECT * FROM RoomType";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                RoomType roomType = new RoomType(
                        rs.getInt("roomTypeID"),
                        rs.getString("typeName"),
                        rs.getString("description"),
                        rs.getInt("capacity")
                );
                roomTypes.add(roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomTypes;
    }

    @Override
    public RoomType getById(int id) {
        String sql = "SELECT * FROM RoomType WHERE roomTypeID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new RoomType(
                            rs.getInt("roomTypeID"),
                            rs.getString("typeName"),
                            rs.getString("description"),
                            rs.getInt("capacity")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(RoomType roomType) {
        String sql = "INSERT INTO RoomType (typeName, description, capacity) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, roomType.getTypeName());
            stmt.setString(2, roomType.getDescription());
            stmt.setInt(3, roomType.getCapacity());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(RoomType roomType) {
        String sql = "UPDATE RoomType SET typeName = ?, description = ?, capacity = ? WHERE roomTypeID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, roomType.getTypeName());
            stmt.setString(2, roomType.getDescription());
            stmt.setInt(3, roomType.getCapacity());
            stmt.setInt(4, roomType.getRoomTypeID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM RoomType WHERE roomTypeID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
