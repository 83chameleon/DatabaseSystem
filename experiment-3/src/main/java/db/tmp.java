package db;

import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class tmp {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    public boolean search(int SSN,int no){
    	sql = "select * from WORKS_ON where SSN = "+SSN+" and PROJECTNO = "+no;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
               return true;
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            return false;
        }
        return false;
    }
    public boolean search2(int SSN,int no){
    	sql = "select * from STUDY where SSN = "+SSN+" and COURSENO = "+no;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
               return true;
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            return false;
        }
        return false;
    }
}
