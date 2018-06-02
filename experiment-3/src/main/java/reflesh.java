
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import db.DBHelper;

public class reflesh {
	private String name;
	private String tutorssn;
	private String laboratoryno;
	private String comment;
	private String SSN;
	static String sql = new String();  
    static DBHelper db = null;  
    static int retu = 0;
	 public String getName(){
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTutorssn() {
		return tutorssn;
	}
	public void setTutorssn(String tutorssn) {
		this.tutorssn = tutorssn;
	}
	public String getLaboratoryno() {
		return laboratoryno;
	}
	public void setLaboratoryno(String laboratoryno) {
		this.laboratoryno = laboratoryno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String execute(){
	   if(Insert2SSN(Integer.parseInt(SSN),name,tutorssn,laboratoryno) && Insert2Impression(Integer.parseInt(SSN),Integer.parseInt(laboratoryno),comment)){
		   return "success";
	   }
	   return "error";
	 }
	public String getSSN(){
		return SSN;
	}
	public void setSSN(String sSN) {
		SSN = sSN;
	}
	public boolean Insert2Impression(int SSN,int labno,String comment){
		sql = "insert into IMPRESSION(SSN,CONTENT,LABORATORYNO) values("+SSN+",\'"+comment+"\',"+labno+")";//SQL语句  
        System.out.println(sql);
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
	public boolean Insert2SSN(int SSN,String name,String tutorssn,String laboratoryno){
		sql = "update STUDENT  set NAME =\'"+name+"\',TUTORSSN="+Integer.parseInt(tutorssn)+",LABORATORYNO="+Integer.parseInt(laboratoryno)+" where SSN="+SSN;//SQL语句  
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
}
