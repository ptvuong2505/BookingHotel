package dao;

import database.DBConnection;
import model.User;
import model.DatabaseInfo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements BaseDAO<User> {

    public static boolean isExistedUsername(String username) {
        String sql = "SELECT 1 FROM [User] WHERE [Username]=?";
        try (Connection con = DBConnection.getConnect();PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, username);
            try(ResultSet rs = st.executeQuery()){
                return rs.next();
            }
        } catch (SQLException e) {
            System.out.println("Can not connect to database!");
        }
        return false;
    }

    public static User selectUserByUAndP(String username, String password) {
        User resultUser = null;
        try (Connection con = DBConnection.getConnect();) {
            String sql = "SELECT * FROM [User] WHERE [Username]= ? and [Password]=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                resultUser = new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"));
            }
        } catch (SQLException e) {
            System.out.println("Can not connect to database!");
        }
        return resultUser;
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (Connection conn = DatabaseInfo.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("userID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role")
                );
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public User getById(int id) {
        String sql = "SELECT * FROM Users WHERE userID = ?";

        try (Connection conn = DatabaseInfo.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("userID"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("role")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insert(User user) {
        String sql = "INSERT INTO [User] ([username], [password], [role]) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static int insertUser(User user){
        String sql = "INSERT INTO [User] ([username], [password], [role]) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());

            if(stmt.executeUpdate()>0){
                try(ResultSet rs = stmt.getGeneratedKeys()) {
                    if(rs.next()){
                        return rs.getInt(1);
                    }else{
                        System.out.println("Can not get ID after insert!");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else{
                System.out.println("Inserting fail!");
            }
        } catch (SQLException e) {
            System.out.println("Can not connect to database!");
        }
        return -1;
    }

    @Override
    public boolean update(User user) {
        String sql = "UPDATE Users SET username = ?, password = ?, role = ? WHERE userID = ?";

        try (Connection conn = DatabaseInfo.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());
            stmt.setInt(4, user.getUserID());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM Users WHERE userID = ?";

        try (Connection conn = DatabaseInfo.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean updatePassByEmail(String password ,String email){
        String sql = "Update [User] set [password] = ?  FROM [User] u JOIN Customer c ON u.UserID = c.UserID WHERE c.email =?";
        
        try (Connection conn = DBConnection.getConnect(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, password);
            stmt.setString(2, email);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
