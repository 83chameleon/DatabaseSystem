<%@ page language="java" import="java.util.*,java.sql.*,db.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"></link>
  <link rel="stylesheet" href="css/style.css">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  </head>
  <body>
    <%
	String name=request.getParameter("prono");  
    %>
    <br>
  <div class="container home">
    <div class="row">  	
  	<div class="top-panel">
      <div class="btn-group">
        <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown">Export to <span class="caret"></span></button>
        <ul class="dropdown-menu" role="menu">
          <li><a onclick="exportTo('csv');" href="javascript://">CSV</a></li>
          <li><a onclick="exportTo('txt');" href="javascript://">TXT</a></li>
          <li><a onclick="exportTo('xls');" href="javascript://">XLS</a></li>
          <li><a onclick="exportTo('sql');" href="javascript://">SQL</a></li>
        </ul>
      </div>
  	</div>
    <br>
  	<div class="table-responsive">
          <table id="firm_table" class="table table-striped table-bordered table-hover">
          <%
			  String sql = "select * from PROJECT where NO = "+Integer.parseInt(name);//SQL语句  
              DBHelper db = new DBHelper(sql);//创建DBHelper对象  
              ResultSet ret = db.pst.executeQuery();//执行语句，得到结果集  
              while (ret.next()){  
			 %>
            <tbody>
              <tr>
                <td>名称</td>
                <td><%=ret.getString(2) %></td>
              </tr>
              <tr>
                <td>时长</td>
                <td><%=ret.getDouble(3) %></td>
              </tr>
              <tr>
                <td>成员</td>
                <td>
              <%
              }
              sql = "select * from WORKS_ON where PROJECTNO = "+Integer.parseInt(name);//SQL语句
              db = new DBHelper(sql);//创建DBHelper对象   
              ResultSet rets = db.pst.executeQuery();//执行语句，得到结果集  
              while (rets.next()){  
               %>
               <%=rets.getInt(1) %><br>
               <%
               }
                %> 
                </td>
              </tr>
            </tbody>
          </table>
        </div>

    </div>

  </div>

  <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
  <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
  <script src="js/tableExporter.js"></script>
  <script src="js/main.js"></script>
  </body>
</html>
