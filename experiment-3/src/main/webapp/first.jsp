<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>更新信息</title>
	<link rel="stylesheet" type="text/css" href="css/default2.css">
	<link rel="stylesheet" href="css/reset2.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/style3.css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
</head>
<body>
  <%
String User=String.valueOf(session.getAttribute("SSN")).trim();
if(String.valueOf(session.getAttribute("SSN")).equals("null")){
	String name=request.getParameter("SSN");  
	session.setAttribute("SSN",name);
	User=String.valueOf(session.getAttribute("SSN")).trim();
}
%>
	<div class="jq22-container">
		<!--<div class="jq22-content bgcolor-8">
		</div>-->
		<form class="cd-form floating-labels" action="reflesh">
				<input type="hidden" name="SSN" value="<%=session.getAttribute("SSN")%>">
				<div class="icon">
					<label class="cd-label" for="cd-name">姓名</label>
					<input class="user" type="text" name="name" id="cd-name" required>
			    </div>

			    <div class="icon">
			    	<label class="cd-label" for="cd-company">实验室</label>
					<input class="company" type="text" name="laboratoryno" id="cd-company" required>
			    </div>
                <div class="icon">
			    	<label class="cd-label" for="cd-company">导师</label>
					<input class="company" type="text" name="tutorssn" id="cd-company" required>
			    </div>
			   
				<div class="icon">
					<label class="cd-label" for="cd-textarea">实验室评价</label>
	      			<textarea class="message" name="comment" id="cd-textarea" required></textarea>
				</div>

				<div>
			      	<input type="submit" value="确认更新">
			    </div>
		</form>
	</div>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script src="js/main2.js"></script> <!-- Resource jQuery -->
</body>
</html>
