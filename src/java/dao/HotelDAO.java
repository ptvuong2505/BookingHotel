/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Hotel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.DatabaseInfo;

public class HotelDAO implements BaseDAO<Hotel> {

    private Connection getConnection() {
        return DatabaseInfo.getConnect();
    }

    @Override
    public List<Hotel> getAll() {
        List<Hotel> hotels = new ArrayList<>();
        String query = "SELECT * FROM Hotel";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                hotels.add(new Hotel(
                    rs.getInt("HotelID"),
                    rs.getString("Name"),
                    rs.getString("Address"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    rs.getString("Description")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotels;
    }

    @Override
    public Hotel getById(int id) {
        String query = "SELECT * FROM Hotel WHERE HotelID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Hotel(
                        rs.getInt("HotelID"),
                        rs.getString("Name"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Description")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Hotel hotel) {
        String query = "INSERT INTO Hotel (Name, Address, Phone, Email, Description) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, hotel.getName());
            pstmt.setString(2, hotel.getAddress());
            pstmt.setString(3, hotel.getPhone());
            pstmt.setString(4, hotel.getEmail());
            pstmt.setString(5, hotel.getDescription());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Hotel hotel) {
        String query = "UPDATE Hotel SET Name = ?, Address = ?, Phone = ?, Email = ?, Description = ? WHERE HotelID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, hotel.getName());
            pstmt.setString(2, hotel.getAddress());
            pstmt.setString(3, hotel.getPhone());
            pstmt.setString(4, hotel.getEmail());
            pstmt.setString(5, hotel.getDescription());
            pstmt.setInt(6, hotel.getHotelID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM Hotel WHERE HotelID = ?";
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

