<%@ page language="java" import="java.util.*,java.sql.*,db.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
  <head>
    <base href="<%=basePath%>">
    <title>我的简历！</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700%7cOswald:400,700" rel="stylesheet">
    <!--stylesheets
    ====================================================-->
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css"> 
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/simpletextrotator.css"> 
    
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/zeroModal.css" />
    <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/zeroModal.js"></script>
    
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]--> 
    <script src="js/jquery.min.js"></script> <!-- JQUERY -->
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
    <!--FRONT PAGE/ SPLASH SCREEN SECTION-->
    <div class="loading-screen"></div>
    <div id="frontpage"> 
        <div class="shadow-img"></div> 
        <img src="images/front-image.jpg" class="front-img img-responsive" alt ="Front-image"><!--IMAGE FOR FRONT SCREEN-->
        <h1><%=User %> <!-- <span class="invert"></span> --></h1><!--PROFILE NAME-->
        <h3 class="invert" style="margin-top: -10px; margin-bottom: 10px;">Designed By<span class="rotate"> Meng, 盟</span></h3> <!--SUBTITLE IN PROFILE-->
        <div class="frontclick"><img src="images/click.png" alt="" class="img-responsive"><span class="pulse"></span></div>
    </div>
    <!--FRONT PAGE/ SPLASH SCREEN SECTION ENDS-->
    <!--container-->
    <div class="container">
        <div id="content" class="row hidden">
            <div class="col-sm-4">
                <!--namecard-->
                <div id="namecard" class="namecard">
                    <div class="shadow-img"></div>
                    <h1 class="maintitle"><%=User %> <!-- <span class="invert"></span> --></h1><!--PROFILE NAME-->
                    <h3 class="invert sub-maintitle">Designed By 
                        <span class="rotate"> Meng, 盟</span><!--SUBTITLE AFTET NAME-->
                    </h3>
                    <img id="profile-img" class="profile-img transparent" src="images/profile-thum.png" alt="profile-image"/><!--PROFILE IMAGE-->
                </div><!--/#namecard-->
                <!--menu-->
                <div id="menu-container">
                    <!--PAGE MENU-->
                    <ul class="nav-menu no-padding">
                        <li class="nav-btn selected" title="Home" data-page="home">
                            <div class="hover-background"></div>
                            <span>基本情况</span><i class="fa fa-user fa-fw"></i>
                        </li>
                        <li class="nav-btn" id="resume-btn" title="Resume"  data-page="resume">
                            <div class="hover-background"></div>
                            <span>个人经历</span><i class="fa fa-file-text fa-fw"></i>
                        </li>
                    </ul><!--/.nav-menu __PAGE MENU ENDS-->

                   <!-- SOCIAL NAV MENU-->
                    <div class="social-menu-container">
                        <ul class="social-menu no-padding">                     
                            <li><a href="javascript:location.href='index.jsp';">首页<!-- <i class="fa fa-facebook"></i> --></a></li>
                        </ul>
                    </div><!--  /.social-menu-container -->
                </div><!--#menu-container-->
            </div>
            <div class="col-sm-8 page-segment">
                <ul class="page-container no-padding">
                    <!--HOME/PROFILE PAGE-->
                    <li id="home" class="selected">
                        <div class="title-container hidden">
                            <div class="shadow-img"></div> 
                            <h2 class="rotate-out">Welcome To <span class="invert"><%=User %>'s Profile</span></h2><!--HOME TITLE-->                          
                        </div>
                        <div class="description hidden">
                            <div class="watermark-home"></div> 
                            <div class="fade-text transparent">
                                <!--DESCRIPTION ON HOME-->
                                <div class="strong-text">Hello, I am <span><%=User %></span></div>
                                <div class="focus-text"><!-- <span>Web Developer & </span><span>Web Designer</span> --></div>
<!--                                 <p class="large-paragraph">待拓展！</p>         
 -->                                <!--DESCRIPTION ON HOME ENDS-->
                            </div>
                            <!--ALL PERSONAL DETAILS-->
                            <h3 class="personal-info-title title">个人信息</h3>
                            <ul class="personal-info">
                            <%
                                String email =null;
			  					String sql = "select * from TEACHER where SSN = "+Integer.parseInt(User);//SQL语句  
             					 DBHelper db = new DBHelper(sql);//创建DBHelper对象  
             					 ResultSet ret = db.pst.executeQuery();//执行语句，得到结果集  
             					 while (ret.next()){  
             					 email = ret.getString(3);
							 %>
                                <li class="rotate-out rotated"><label>Name</label><span><%=ret.getString(2) %></span></li>                     
                                <li class="rotate-out rotated"><label>Laboratory</label><span><%=ret.getString(4) %></span></li>
                                <li class="rotate-out rotated"><label>Email</label><span><%=email %></span></li>  
                                <%
                                }
                                 %>
                            </ul><!--/ul.personal-info-->
                        </div>
                    </li><!--/#home-->
                    <!--RESUME PAGE-->
                    <li id="resume" class="hidden">
                        <div class="title-container">
                            <div class="shadow-img"></div>
                            <h2 class="rotate-out rotated"><span class="invert">Resume Of </span><%=User %></h2> <!--RESUME TITLE-->
                        </div>
                        <div class="description">

                            <div class='tabs tabs_animate'>
                                <!--RESUME TAB LISTS-->
                                <ul class='horizontal no-padding'>
                                    <li><a href="#tab-1" class="icon-bg icon-skills"><div>开设课程</div></a></li>
                                    <li><a href="#tab-2" class="icon-bg icon-education"><div>科研经历</div></a></li>
                                </ul><!--RESUME TAB LISTS ENDS-->

                                <!--RESUME FIRST TAB/SKILL TAB DETAILS-->
                                <div id='tab-1'>
                                    <h3 class="title">所有课程</h3><!--SKILLS WITH BAR DISPLAY-->
                                    <ul class="skills-list no-padding">
                                    <%
			  					      sql = "select * from COURSE where SSN = "+Integer.parseInt(User);//SQL语句  
             					      db = new DBHelper(sql);//创建DBHelper对象  
             					      ret = db.pst.executeQuery();//执行语句，得到结果集  
             					      while (ret.next()){  
							           %>
                                       <li>
                                          <h4 class="title"><%=ret.getString(2) %><i class="fa fa-sort-desc pull-right"></i></h4>
                                          <div class="list-content">
                                             <h5 class="title"><span class="list-year"><%=ret.getString(3) %></span></h5>
                                            </div>
                                        </li>
                                        <%
                                        }
                                        %>
                                    </ul><!--SKILLS WITH BAR DISPLAY ENDS-->
                                    <button><a href="javascript:_params(<%=User%>)">添加</a></button>
                                    <script type="text/javascript">
                                     function _params(name) {
        									zeroModal.show({
            								content: "<form action='addcourse'><input type='hidden' name='SSN' value=\'"+name+"\'/>课程名称：<input type='text' name='name'/><br>课程描述：<input type='text' name='description'/><br><button>添加</button></form>"
        									});
    								}
                                    </script>
                                </div><!--RESUME FIRST TAB/SKILL TAB DETAILS ENDS-->
                                <!--RESUME SECOND TAB/EDUCATION TAB DETAILS-->
                                <div id='tab-2'>
                                    <h3 class="title">科研经历</h3>
                                    <ul class="education-class">
                                    <%
			  					      sql = "select * from RESEARCH where SSN = "+Integer.parseInt(User);//SQL语句  
             					      db = new DBHelper(sql);//创建DBHelper对象  
             					      ret = db.pst.executeQuery();//执行语句，得到结果集  
             					      while (ret.next()){  
							           %>
                                       <li>
                                            <h4 class="title"><%=ret.getString(1) %><i class="fa fa-sort-desc pull-right"></i></h4>
                                            <div class="list-content">
                                                <h5 class="title"><span class="list-year"><%=ret.getString(5) %></span></h5>
                                                <p>级别：<%=ret.getString(4) %></p><!--EDUCATION LIST DETAILS-->
                                            </div>
                                        </li>
                                        <%
                                        }
                                         %>
                                    </ul>
                                    <button><a href="javascript:_params2(<%=User%>)">添加</a></button>
                                    <script type="text/javascript">
                                     function _params2(name) {
        									zeroModal.show({
            								content: "<form action='addresearch'><input type='hidden' name='SSN' value=\'"+name+"\'/>项目名称：<input type='text' name='name'/><br>持续时长：<input type='text' name='time'/><br>项目级别：<input type='text' name='degree'/><br>项目描述：<input type='text' name='description'/><br><button>添加</button></form>"
        									});
    								}
                                    </script>
                                </div><!--RESUME SECOND TAB/EDUCATION TAB DETAILS ENDS-->
                            </div>
                        </div>
                    </li>
                    <!--/#resume-->
                    <!--CONTACT PAGE-->
                    <li id="contact" class="hidden">
                        <div class="title-container" >
                            <div class="shadow-img"></div>               
                           <h2 class="rotate-out rotated">联系信息</h2><!--CONTACT PAGE TITLE-->
                        </div>
                        <div class="description">                           
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="map-container">
                                        <div id="map" style="width:100%;height:0;"></div><!--GOOGLE MAP-->
                                    </div>
                                </div>

                                <div class="col-sm-5">
                                    <!--CONTACT DESCRIPTION-->
                                    <h3 class="title">邮箱</h3>
                                    <h6 class="sm-title"><span class="address-icon"><i class="fa fa-envelope"></i></span><%=email %></h6>
                                    <!--/CONTACT DESCRIPTION ENDS-->
                                </div>
                            </div>
                        </div>
                    </li><!--/#contact-->
                </ul>      
            </div><!--/.page-segment -->
            <!--  <h6 class="copyright-text">Copyright © 2015 Li Dada</h6> --> <!--if anyone wants copyright Texts--> 
        </div>
    </div><!--/.container -->

    <!--javascript files
    =============================================================-->
    <script type="text/javascript" src="js/jQueryTween-aio-min.js"></script> <!-- JQUERY Tween Plugin -->
    <script type="text/javascript" src="js/jquery.tabslet.min.js"></script> <!-- JQUERY Tab plugin-->     
    <script type="text/javascript" src="js/progressbar.min.js"></script> <!-- JQUERY Progressbar Plugin-->
    <script type="text/javascript" src="js/jquery.simple-text-rotator.min.js"></script> <!-- JQUERY Text Rotator-->
    <script type="text/javascript" src="js/bootstrap.min.js"></script> <!-- Bootstrap file-->
    <script src="http://ditu.google.cn/maps/api/js?key=AIzaSyBPNkCVoBW_Jzl6x-hgGU6e7QW1QMwKles"></script>
    <script type="text/javascript" src='js/isotope.pkgd.min.js'></script> <!--SCRIPTS FOR PORTFOLIO IMAGE'S ANIMATION-->
    <script type="text/javascript" src="js/custom.js"></script>
</body>
</html>
