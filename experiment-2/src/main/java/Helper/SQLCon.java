package Helper;
import java.sql.*;

public class SQLCon {
    // 连接实例
    private static Connection conn = null;
    public SQLCon() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/SCT?characterEncoding=utf-8", "root", "hbh828hbh");
    }

    //获得连接对象
    public static Connection getConnection(){
        return conn;
    }

    //关闭连接
    public static void CloseCon() throws SQLException{
        conn.close();
    }
}
