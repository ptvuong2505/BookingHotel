package dao;

import model.Service;
import model.DatabaseInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO implements BaseDAO<Service> {
    
    @Override
    public List<Service> getAll() {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT * FROM Service";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Service service = new Service(
                        rs.getInt("serviceID"),
                        rs.getString("serviceName"),
                        rs.getDouble("price"),
                        rs.getInt("hotelID")
                );
                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    @Override
    public Service getById(int id) {
        String sql = "SELECT * FROM Service WHERE serviceID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Service(
                            rs.getInt("serviceID"),
                            rs.getString("serviceName"),
                            rs.getDouble("price"),
                            rs.getInt("hotelID")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Service service) {
        String sql = "INSERT INTO Service (serviceName, price, hotelID) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, service.getServiceName());
            stmt.setDouble(2, service.getPrice());
            stmt.setInt(3, service.getHotelID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Service service) {
        String sql = "UPDATE Service SET serviceName = ?, price = ?, hotelID = ? WHERE serviceID = ?";
        
        try (Connection conn = DatabaseInfo.getConnect();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, service.getServiceName());
            stmt.setDouble(2, service.getPrice());
            stmt.setInt(3, service.getHotelID());
            stmt.setInt(4, service.getServiceID());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Service WHERE serviceID = ?";
        
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
