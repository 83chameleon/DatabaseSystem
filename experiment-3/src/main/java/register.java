
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class register{
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
	  private String password;
	  private String SSN;
	  private String Email;
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
	  public String execute(){
	    String result = "success";
	    if(!searchSSN(Integer.parseInt(SSN))){
	    	  System.out.println(1);
	    	   if(InsertSSN(Integer.parseInt(SSN),password,Email)){
	 	    	  System.out.println(2);
	        return result;
	    	   }else{
	 	    	  System.out.println(3);
	    		   return "error";
	    	   }
	    }else{
	    	  System.out.println(4);
	    	return "error";
	    }
	  }
	public boolean searchSSN(int SSN){
		sql = "select * from STUDENT where SSN = "+SSN;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while(ret.next()){  
            	  if(ret.getString("NAME")==null){
            		  return true;
            	  }
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
        return false;
	}
	public boolean InsertSSN(int SSN,String password,String Email){
		sql = "insert into STUDENT(SSN,EMAIL,PASSWORD) values("+SSN+",\'"+Email+"\',\'"+password+"\')";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
        return false;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
}