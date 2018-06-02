
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class login{
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
	  private String password;
	  private String SSN;
	  public String getSSN(){
		return SSN;
	}
	public void setSSN(String SSN) {
		this.SSN = SSN;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
	    this.password = password;
	  }
	  public String execute() {
	    String result = "success";
	    if(searchPass(Integer.parseInt(SSN)) != null){
	    if(searchPass(Integer.parseInt(SSN)).equals(password)){
	    		if(searchName(Integer.parseInt(SSN))==null || searchName(Integer.parseInt(SSN)).equals("")){
	    			return "new";
	    		}else{
	    			return result;
	    		}
	    }else{
	    		return "error";
	    }
	    }else{
	    	//老师
			if(searchPass2(Integer.parseInt(SSN))!=null) {
				if (searchPass2(Integer.parseInt(SSN)).equals(password)) {
					return "teacher";
				} else {
					return "error";
				}
			}else{
				return "error";
			}
	    }
	  }
	public String searchPass(int SSN){
		sql = "select * from STUDENT where SSN = "+SSN;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
               return ret.getString("PASSWORD");
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            return null;
        }
        return null;
	}
	public String searchPass2(int SSN){
		sql = "select * from TEACHER where SSN = "+SSN;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
               return ret.getString("PASSWORD");
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            return null;
        }
        return null;
	}
	public String searchName(int SSN){
		sql = "select * from STUDENT where SSN = "+SSN;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
               return ret.getString("NAME");
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) { 
        		return null;
        }
        return null;
	}
}
