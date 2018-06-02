package Ajax;

import Helper.SQLCon;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.sql.ResultSet;

public class AjaxSearch extends ActionSupport {
    private int Number;
    private String Parameters;
    private JSONArray jsonArray;

    @Override
    public String execute() throws Exception {
        try{
            new SQLCon();
            String sql = createSql(Number, Parameters);
            ResultSet rs = SQLCon.getConnection().createStatement().executeQuery(sql);
            JSONArray tempArray = new JSONArray();
            while(rs.next()){
                JSONObject jsonObject = new JSONObject();
                for(int i = 1 ; i<=rs.getMetaData().getColumnCount();i++){
                    String colName = rs.getMetaData().getColumnName(i);
                    String value = rs.getString(i);
                    jsonObject.put(colName, value);
                }
                tempArray.add(jsonObject);
            }
            jsonArray = tempArray;
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            SQLCon.CloseCon();
        }
        return SUCCESS;
    }

    private String createSql(int Number, String Parameters){
        String sql = null;
        switch(Number){
            case 1:
                sql = "select Snum from SC where Cnum = '"+Parameters+"'";
                break;
            case 2:
                sql = "select Cnum, Score from SC where Snum = '"+Parameters+"'";
                break;
            case 3:
                sql = "select Sname from Student, SC, Course where Student.Snum=SC.Snum and SC.Cnum=Course.Cnum and Cname = '"+Parameters+"'";
                break;
            case 4:
                sql = "select Cname, Chours, Credit, Csemster from Student, SC, Course where Student.Snum=SC.Snum and SC.Cnum=Course.Cnum and Sname = '"+Parameters+"'";
                break;
            case 5:
                sql = "select Sname, Cnum, Score from Student, SC where Student.Snum=SC.Snum and Score >= "+Integer.parseInt(Parameters);
                break;
            case 6:
                sql = "select Student.Snum, avg(Score) from Student, SC where Student.Snum=SC.Snum group by Student.Snum having avg(Score) < "+Integer.parseInt(Parameters);
                break;
            case 7:
                sql = "select count(*) from Student, SC where Student.Snum=SC.Snum and Sname = '"+Parameters+"'";
                break;
            case 8:
                sql = "select max(Score), min(Score), avg(Score) from SC, Course where SC.Cnum=Course.Cnum and Cname = '"+Parameters+"'";
                break;
        }
        return sql;
    }


    public JSONArray getJsonArray() {
        return jsonArray;
    }

    public void setNumber(int number) {
        Number = number;
    }

    public void setParameters(String parameters) {
        Parameters = parameters;
    }
}
