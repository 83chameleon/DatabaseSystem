
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class addresearch {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    private String SSN;
    private String name;
    private String description;
    private String degree;
    private String time;
    public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
    public String execute(){
	    String result = "success";
	    if(Insert(Integer.parseInt(SSN),name,description,time,degree)){
	    		return result;
	    }
	    return "error";
    }
    public boolean Insert(int SSN,String name,String description,String time,String degree){
		sql = "insert into RESEARCH(SSN,NAME,DESCRIPTION,HOURS,DEGREE) values("+SSN+",\'"+name+"\',\'"+description+"\',"+Double.valueOf(time)+",\'"+degree+"\')";//SQL语句  
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
