/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.RoomTypeDAO;
import dao.ServiceDAO;
import database.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Hotel;
import model.Room;
import model.RoomType;

/**
 *
 * @author Admin
 */
public class main {
    public static void main(String[] args) {
        //RoomTypeDAO dao=new RoomTypeDAO();
        RoomType room=new RoomType();
        
        
        ServiceDAO dao=new ServiceDAO();
        dao.getAll();
        
        System.out.println(dao.getAll());
    }
    
    public static RoomType getById(int id) {
                System.out.println("🔍 Kiểm tra kết nối cho getById()...");

                String sql = "SELECT * FROM dbo.RoomType WHERE RoomTypeID = ?"; // Thêm dbo.

            try (Connection conn = DBConnection.getConnect();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                System.out.println("✅ Đã kết nối. Truy vấn ID: " + id);

                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        System.out.println("✅ RoomType tìm thấy!");
                        return new RoomType(
                                rs.getInt("RoomTypeID"),
                                rs.getString("TypeName"),
                                rs.getString("Description"),
                                rs.getInt("Capacity"),
                                rs.getString("Image")
                        );
                    } else {
                        System.out.println("⚠️ Không tìm thấy RoomType với ID: " + id);
                    }
                }
            } catch (SQLException e) {
                System.err.println("❌ Lỗi SQL trong getById: " + e.getMessage());
                e.printStackTrace();
            }
            return null;
        }
    
}
