package murach.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionPool {

  private static String url = "jdbc:mysql://localhost:3306/murach?allowPublicKeyRetrieval=true&useSSL=false";
  private static String userName = "murach_user";
  private static String password = "sesame";

  private static ConnectionPool pool = null;

  private ConnectionPool() {
    try {
      Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      System.out.println(e);
    }
  }

  public static synchronized ConnectionPool getInstance() {
    if (pool == null) {
      pool = new ConnectionPool();
    }
    return pool;
  }

  public Connection getConnection() {
    try {
      return DriverManager.getConnection(url, userName, password);
    } catch (SQLException e) {
      System.out.println(e);
      return null;
    }
  }

  public void freeConnection(Connection c) {
    try {
      c.close();
    } catch (SQLException e) {
      System.out.println(e);
    }
  }
}
