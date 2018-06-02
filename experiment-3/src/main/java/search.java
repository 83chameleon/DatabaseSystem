
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import db.DBHelper;
public class search extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> dataMap;
	private String name;
	static String sql = new String();  
    static DBHelper db = null;  
    static ResultSet ret = null;  
    static int retu = 0;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public search(){
		dataMap = new HashMap<String, Object>();
	}
	public void dosearch() throws IOException, SQLException {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html");
		PrintWriter out;
		out = response.getWriter();
		name = name.replaceAll("\\s+", " ");
		String EachCMD[] = new String[2];
		int index = 0;
		int head = 0;
		for(int i =0;i<name.length();i++){
			if(name.charAt(i) == ' ' && index < 1){
				EachCMD[index] = name.substring(head,i);
				head = i+1;
				index++;
			}else if(index == 1){
				EachCMD[index] = name.substring(head,name.length());
			}
		}
		String params[] = EachCMD[1].split("\\,");
		if ("hobby_query".equals(EachCMD[0])) {
			searchStudentHobby(params[0]);

		} else if ("student_query1".equals(EachCMD[0])) {
			searchTutorStudent(Integer.parseInt(params[0]));

		} else if ("student_query2".equals(EachCMD[0])) {
			searchProjectStudent(params[0]);

		} else if ("all".equals(EachCMD[0])) {
			searchALLProjectStudent(params[0]);

		} else if ("notin".equals(EachCMD[0])) {
			searchNOTProjectStudent(Integer.parseInt(params[0]));

		} else if ("team".equals(EachCMD[0])) {
			TeamSearch(Integer.parseInt(params[0]));

		} else {
		}
		Gson gson = new Gson();
		String data = gson.toJson(dataMap);
		out.println(data);
		out.flush();
		out.close();
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void searchStudentHobby(String hobby){
		sql = "select STUDENT.SSN,NAME from HOBBY,STUDENT where content like \'"+hobby+"\' and HOBBY.SSN = STUDENT.SSN";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
            	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
	}
	public void searchTutorStudent(int ssn){
		sql = "select SSN,NAME from STUDENT WHERE TUTORSSN ="+ssn;//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
          	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }
	}
	public void searchProjectStudent(String name){
		sql = "select STUDENT.SSN,STUDENT.NAME FROM STUDENT,PROJECT,WORKS_ON WHERE PROJECT.NAME = \'"+name+"\' and PROJECT.NO = WORKS_ON.PROJECTNO AND WORKS_ON.SSN = STUDENT.SSN;";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
          	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
	}
	//嵌套查询
	public void searchNOTProjectStudent(int num){
		sql = " SELECT SSN,NAME from STUDENT where SSN not in ( select STUDENT.SSN from STUDENT, works_on where STUDENT.SSN=works_on.SSN and works_on.PROJECTNO="+num+")";//SQL语句  
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
          	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
	}
	//连接查询
	public void searchALLProjectStudent(String pronum){
		sql = " select SSN,NAME from STUDENT NATURAL join  works_on where PROJECTNO="+pronum;//SQL语句
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
          	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
	}
	//分组查询
	public void TeamSearch(int ssn){
		sql = "select TEACHER.SSN,TEACHER.NAME from STUDENT,TEACHER where STUDENT.TUTORSSN =TEACHER.SSN group by TEACHER.SSN having avg(STUDENT.SALARY) <"+ssn;//SQL语句句
        db = new DBHelper(sql);//创建DBHelper对象  
        try {  
            ret = db.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()){  
          	  dataMap.put(String.valueOf(ret.getInt(1)),ret.getString(2));
            }//显示数据  
            ret.close();  
            db.close();//关闭连接  
        } catch (SQLException e){  
            e.printStackTrace();  
        }
	}
}
