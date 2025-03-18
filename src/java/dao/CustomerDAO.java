package dao;

import database.DBConnection;
import model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements BaseDAO<Customer> {
    private Connection getConnection() {
        return DBConnection.getConnect();
    }

    @Override
    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM Customer";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                customers.add(new Customer(
                    rs.getInt("CustomerID"),
                    rs.getInt("UserID"),
                    rs.getString("Name"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    rs.getString("Address")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    
    @Override
    public Customer getById(int id) {
        String query = "SELECT * FROM Customer WHERE UserID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                        rs.getInt("CustomerID"),
                        rs.getInt("UserID"),
                        rs.getString("Name"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getString("Address")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Customer customer) {
        String query = "INSERT INTO Customer (UserID, Name, Phone, Email, Address) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, customer.getUserID());
            pstmt.setString(2, customer.getName());
            pstmt.setString(3, customer.getPhone());
            pstmt.setString(4, customer.getEmail());
            pstmt.setString(5, customer.getAddress());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Can not connect to database!");
        }
        return false;
    }
    
    @Override
    public boolean update(Customer customer) {
        String query = "UPDATE Customer SET UserID = ?, Name = ?, Phone = ?, Email = ?, Address = ? WHERE CustomerID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, customer.getUserID());
            pstmt.setString(2, customer.getName());
            pstmt.setString(3, customer.getPhone());
            pstmt.setString(4, customer.getEmail());
            pstmt.setString(5, customer.getAddress());
            pstmt.setInt(6, customer.getCustomerID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM Customer WHERE CustomerID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean checkExistedEmail(String email){
        String query = "Select * FROM Customer WHERE Email = ?";
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, email);
            return st.executeQuery().next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
