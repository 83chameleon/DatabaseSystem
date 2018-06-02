
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class addhobby {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    private String SSN;
    private String content;
    public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
    public String execute(){
	    String result = "success";
	    if(InsertProject(Integer.parseInt(SSN),content)){
	    		return result;
	    }
	    return "error";
    }
    public boolean InsertProject(int SSN,String content){
		sql = "insert into HOBBY(SSN,CONTENT) values("+SSN+",\'"+content+"\')";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
        return false;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
