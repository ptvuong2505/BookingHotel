package dao;

import database.DBConnection;
import model.RoomType;
import model.DatabaseInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomTypeDAO implements BaseDAO<RoomType> {
    
    @Override
    public List<RoomType> getAll() {
        List<RoomType> roomTypes = new ArrayList<>();
        String sql = "SELECT RoomTypeID, TypeName, Description, Capacity, Image FROM RoomType";

        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                RoomType roomType = new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("TypeName"),
                        rs.getString("Description"),
                        rs.getInt("Capacity"),
                        rs.getString("Image") // Thêm cột Image
                );
                roomTypes.add(roomType);
            }
            System.out.println("Lấy được " + roomTypes.size() + " RoomType từ database.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Không lấy được dữ liệu.");
        }
        return roomTypes;
    }

    @Override
    public RoomType getById(int id) {
        String sql = "SELECT * FROM RoomType WHERE RoomTypeID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new RoomType(
                            rs.getInt("RoomTypeID"),
                            rs.getString("TypeName"),
                            rs.getString("Description"),
                            rs.getInt("Capacity"),
                            rs.getString("Image") // Thêm cột Image
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
        String sql = "INSERT INTO RoomType (TypeName, Description, Capacity, Image) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, roomType.getTypeName());
            stmt.setString(2, roomType.getDescription());
            stmt.setInt(3, roomType.getCapacity());
            stmt.setString(4, roomType.getImage()); // Thêm cột Image
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(RoomType roomType) {
        String sql = "UPDATE RoomType SET TypeName = ?, Description = ?, Capacity = ?, Image = ? WHERE RoomTypeID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, roomType.getTypeName());
            stmt.setString(2, roomType.getDescription());
            stmt.setInt(3, roomType.getCapacity());
            stmt.setString(4, roomType.getImage()); // Thêm cột Image
            stmt.setInt(5, roomType.getRoomTypeID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM RoomType WHERE RoomTypeID = ?";
        
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
