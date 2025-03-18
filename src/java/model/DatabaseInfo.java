package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseInfo {
    public static final String DRIVERNAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static final String DBURL = "jdbc:sqlserver://IG-WYKOWJBU;databaseName=FruitShop;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
    public static final String USERDB = "sa";
    public static final String PASSDB = "123";

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
            return DriverManager.getConnection(DBURL, USERDB, PASSDB);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
        }
        return null;
    }
}

