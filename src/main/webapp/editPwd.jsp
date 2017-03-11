<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<style type="text/css">
  #btn{
     width: 80px;
     height: 30px;
     background-color: #FFDDAA;
   }
   span{
     font-size: 10px;
     color: red;
   }
</style>
<script src="js/jquery-1.8.2.js"></script>
<script type="text/javascript">
			var flag3=false;
     function checkPwd(){
    	  var password=$("#password").val();
    	  var password2=$("#pwd").val();
    	  if(password===password2){
    		  flag3=true;
    		  $(".pwderro").html("");
    		  return;
    	  }
    	  $("#password").val("");
    	  $("#pwd").val("");
    	  $(".pwderro").html("两次输入的密码不一确");
    }
   function sub(){
      if(flag3){
    	 return true;
      }else{
    	  alert("你有必填项未填写");
    	  return false;
      }
    }
</script>
</head>
<body>
 <%@include file="head.jsp" %>
    <center>
    <h1>密码修改页面</h1>
    <form action="${pageContext.request.contextPath }/user/eidtPwd.do" method="post" onsubmit="return sub();">
      <table width="550px">
         <tr>
         <td>请输入原密码:</td>
         <td><input type="password" name="password" id="oldpwd"></td>
         </tr>
         <tr>
         <td>新密码:</td>
         <td><input type="password" name="newPwd" id="password"><span class="pwderro"></span></td>
         </tr>
         <tr>
         <td>确认新密码:</td>
         <td><input type="password" id="pwd" onblur="checkPwd();"><span class="pwderro"></span></td>
         </tr>
         <tr>
           <td colspan="3">
               <center><input type="submit" value="确认修改" id="btn"></center>
           </td>
         </tr>
      </table>
    </form>
    </center>
</body>
</html>