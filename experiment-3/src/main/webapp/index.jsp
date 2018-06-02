<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首页|实验室管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/iziModal.css">
 	<script src="js/jquery-2.1.1.min.js"></script>
  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/index.css">
  <script type="text/javascript">
$(function() {
		$("#searchbtn").click(function() {
		var params = $("#content").val();
		if (params == '') {
                    alert("请输入查询内容！");
                    return false;
                } 
			$.ajax({
				url : "search",
				dataType : "json",
				data : {
					name : $("#content").val()
				},
				success : function(data) {
					$("#show").empty();
					$("#show").append("<tr><td>SSN</td><td>姓名</td></tr>");
					$.each(data, function(key, value) {
						$("#show").append("<tr>");
						$("#show tr:last").append("<td>" + key + "</td>");
						$("#show tr:last").append("<td>" + value + "</td>");
						$("#show").append("</tr>");
					});
				},
				error:function() {
                      alert("查询失败！");
                    }
			});
		});
	});
    </script>
  </head>
  <body class="body">
  <%
String User=String.valueOf(session.getAttribute("SSN")).trim();
if(String.valueOf(session.getAttribute("SSN")).equals("null")){
	String name=request.getParameter("SSN");  
	session.setAttribute("SSN",name);
	User=String.valueOf(session.getAttribute("SSN")).trim();
}
String name=request.getParameter("SSN");  
if(name != null){
    session.setAttribute("SSN",null);
 	User=String.valueOf(session.getAttribute("SSN")).trim();
}
%>
  <header class="header" id="header">
    <div class="header-top">
      <div class="container">
        <a href="#" class="header-logo"></a>
        <nav class="header-nav">
          <a href="index.jsp" class="item item-cur">发现</a>
          <%
          if(User != null && !User.equals("null")){
         %>
          <a href="lab.jsp" class="item">实验室</a>
          <a href="projects.jsp" class="item">项目</a>
          <a href="course.jsp" class="item">课程</a>
          <%
          }
           %>
        </nav>
        <div class="header-user">
        <%
          if(User == null || User.equals("null")){
         %>
          <a href="#" class="login trigger-custom">登录/注册</a>
          <%
          }else{
           %>
           <a href="main.jsp" class="login "><%=User %></a>
           <a href="index.jsp?SSN=quit" class="register ">退出</a>
           <%
           }
            %>
        </div>
      </div>
    </div>
    <div class="banner">
<!--       <h2 class="banner-titlte"><img src="images/banner-title_img.svg" alt="#"></h2>
 -->      <div class="search">
          <input type="text" class="search-text" id="content" placeholder="搜索你喜欢的"/>
          <button id ="searchbtn" class="search-btn sprite_icon"></button>
      </div>
      <table id="show" style="margin-top:200px;"></table>
    </div>
  </header>
  <script src="js/script.js"></script>
      <script src="js/jquery.js"></script>
   <div id="modal-iframe" class="iziModal light"></div>
    <div id="modal-custom" class="iziModal">
        <button data-iziModal-close class="icon-close">X</button>
        <header>
            <a href="" id="signin">登录</a>
            <a href="" class="active">注册</a>
        </header>
        <section class="hide">
           <form action="login" method="post">
            <input type="text" placeholder="SSN" name="SSN">
            <input type="password" placeholder="密码" name="password">
            <footer>
                <button data-iziModal-close>取消</button>
                <button class="submit">登录</button>            
            </footer>
            </form>
        </section>
        <section>
        	<form action="register" method="post">
            <input type="text" placeholder="SSN" name="SSN">
            <input type="text" placeholder="Email" name="Email">
            <input type="password" placeholder="密码" name="password">
            <footer>
                <button data-iziModal-close>取消</button>
                <button class="submit">注册</button>            
            </footer>
            </form>
        </section>
    </div>
<script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script> 
<script src="js/iziModal.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $("#modal-custom").iziModal({
	        overlayClose: false,
	        width: 600,
	        autoOpen: false,
	        overlayColor: 'rgba(0, 0, 0, 0.6)',
	        onOpened: function() {
	            console.log('onOpened');
	        },
	        onClosed: function() {
	            console.log('onClosed');  
	        }
	    });
	    $(document).on('click', '.trigger-custom', function (event){
	        event.preventDefault();
	        $('#modal-custom').iziModal('open');
	    });
	    $("#modal-custom").on('click', 'header a', function(event){
	        event.preventDefault();
	        var index = $(this).index();
	        $(this).addClass('active').siblings('a').removeClass('active');
	        $(this).parents("div").find("section").eq(index).removeClass('hide').siblings('section').addClass('hide');

	        if( $(this).index() === 0 ){
	            $("#modal-custom .iziModal-content .icon-close").css('background', '#ddd');
	        } else {
	            $("#modal-custom .iziModal-content .icon-close").attr('style', '');
	        }
	    });
	</script>
  </body>
</html>
