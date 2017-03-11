<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
 <script type="text/javascript">
    $(function (){
    	 setInterval(time,1000);
    	var i=15;
       function time(){
    		 if(i==0){
    	      location.href="login.jsp";
    		 }else{
    		  $("#show").html("<span style='color: maroon;'>"+i+"..</span>秒后跳转到登陆页面")
    	  }
    		 i--;
       }
    })
 </script>
</head>
<body>
  <center><h1>欢迎使用系统</h1></center>
      <div style="margin-top: 200px;position: absolute;right: 500px">
      <a href="login.jsp" style="cursor: pointer;">首页</a><span id="show"></span>
     </div>
     <span style="color: maroon;"></span>
</body>
</html>