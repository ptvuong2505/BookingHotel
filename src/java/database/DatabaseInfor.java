package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseInfor {
    public static String DRIVERNAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String DBURL="jdbc:sqlserver://KING;databaseName=HotelManagement;encrypt=false;trustServerCertificate=false;loginTimeout=30;";
    public static String USERDB="sa";
    public static String PASSDB="123456789";
    
    
    public static Connection getConnect(){
        try{ 
            Class.forName(DRIVERNAME); 
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
}

