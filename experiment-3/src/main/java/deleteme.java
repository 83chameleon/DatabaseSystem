
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBHelper;

public class deleteme {
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
    private String SSN;
    public String getSSN() {
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
	public String getProjectno() {
		return projectno;
	}
	public void setProjectno(String projectno) {
		this.projectno = projectno;
	}
	private String projectno;
    public String execute(){
	    String result = "success";
	    if(DeleteProject(Integer.parseInt(SSN),Integer.parseInt(projectno))){
	    		return result;
	    }
	    return "success";
    }
    public boolean DeleteProject(int SSN,int projectno){
		sql = "delete from WORKS_ON where SSN = "+SSN+" and PROJECTNO = "+projectno;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            retu = db.pst.executeUpdate(sql);
           if(retu>0){ 
               return true;
            }//显示数据  
            db.close();//关闭连接  
        } catch (SQLException e){  
            return false;  
        }
        return false;
	}
}
