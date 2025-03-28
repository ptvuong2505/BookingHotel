package dao;

import model.Invoice;
import database.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InvoiceDAO implements BaseDAO<Invoice> {
    
    @Override
    public List<Invoice> getAll() {
        List<Invoice> invoices = new ArrayList<>();
        String sql = "SELECT * FROM Invoice";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Invoice invoice = new Invoice(
                        rs.getInt("invoiceID"),
                        rs.getInt("bookingID"),
                        rs.getDouble("totalAmount"),
                        rs.getString("paymentMethod"),
                        rs.getString("paymentStatus"),
                        rs.getDate("paymentDate")
                );
                invoices.add(invoice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return invoices;
    }

    @Override
    public Invoice getById(int id) {
        String sql = "SELECT * FROM Invoice WHERE invoiceID = ?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Invoice(
                            rs.getInt("invoiceID"),
                            rs.getInt("bookingID"),
                            rs.getDouble("totalAmount"),
                            rs.getString("paymentMethod"),
                            rs.getString("paymentStatus"),
                            rs.getDate("paymentDate")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Invoice invoice) {
        String sql = "INSERT INTO Invoice (bookingID, totalAmount, paymentMethod, paymentStatus, paymentDate) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, invoice.getBookingID());
            stmt.setDouble(2, invoice.getTotalAmount());
            stmt.setString(3, invoice.getPaymentMethod());
            stmt.setString(4, invoice.getPaymentStatus());
            stmt.setDate(5, new java.sql.Date(invoice.getPaymentDate().getTime()));
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Invoice invoice) {
        String sql = "UPDATE Invoice SET bookingID = ?, totalAmount = ?, paymentMethod = ?, paymentStatus = ?, paymentDate = ? WHERE invoiceID = ?";
        
        try (Connection conn = DBConnection.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, invoice.getBookingID());
            stmt.setDouble(2, invoice.getTotalAmount());
            stmt.setString(3, invoice.getPaymentMethod());
            stmt.setString(4, invoice.getPaymentStatus());
            stmt.setDate(5, new java.sql.Date(invoice.getPaymentDate().getTime()));
            
            stmt.setInt(6, invoice.getInvoiceID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Invoice WHERE invoiceID = ?";
        
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