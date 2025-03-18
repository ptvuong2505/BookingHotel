package dao;

import database.DBConnection;
import model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements BaseDAO<Employee> {
    private Connection getConnection() {
        return DBConnection.getConnect();
    }

    @Override
    public List<Employee> getAll() {
        List<Employee> employees = new ArrayList<>();
        String query = "SELECT * FROM Employee";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                employees.add(new Employee(
                    rs.getInt("EmployeeID"),
                    rs.getString("Name"),
                    rs.getString("Position"),
                    rs.getString("Phone"),
                    rs.getString("Email"),
                    rs.getInt("HotelID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public Employee getById(int id) {
        String query = "SELECT * FROM Employee WHERE EmployeeID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Employee(
                        rs.getInt("EmployeeID"),
                        rs.getString("Name"),
                        rs.getString("Position"),
                        rs.getString("Phone"),
                        rs.getString("Email"),
                        rs.getInt("HotelID")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(Employee employee) {
        String query = "INSERT INTO Employee (Name, Position, Phone, Email, HotelID) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, employee.getName());
            pstmt.setString(2, employee.getPosition());
            pstmt.setString(3, employee.getPhone());
            pstmt.setString(4, employee.getEmail());
            pstmt.setInt(5, employee.getHotelID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Employee employee) {
        String query = "UPDATE Employee SET Name = ?, Position = ?, Phone = ?, Email = ?, HotelID = ? WHERE EmployeeID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, employee.getName());
            pstmt.setString(2, employee.getPosition());
            pstmt.setString(3, employee.getPhone());
            pstmt.setString(4, employee.getEmail());
            pstmt.setInt(5, employee.getHotelID());
            pstmt.setInt(6, employee.getEmployeeID());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String query = "DELETE FROM Employee WHERE EmployeeID = ?";
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
