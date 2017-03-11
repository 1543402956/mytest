<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #btn{
     width: 80px;
     height: 30px;
     background-color: #FFDDAA;
   }
   input{
       background-color: #DDDDDD;
       width: 150px;
   }
</style>
</head>
<body>
    <center>
     <h1>欢迎登陆系统</h1>
     <form action="user/login.do" method="post">
       <table width="280">
          <tr>
             <td>用户名：</td>
             <td><input type="text" name="username" id="uname" value="${user.username}"></td>
          </tr>
          <tr>
           <td>密    码：</td>
           <td><input type="password" name="password" id="pwd" value="${user.password }"></td>
          </tr>
          <tr>
             <td colspan="3">
               <center><input type="submit" value="登陆" id="btn"></center>
             </td>
          </tr>
       </table>
     </form>
      <div style="position: absolute;right:500px;font-size:13px"><span>没账号？</span><a href="regist.jsp">注册一下吧</a></div>
      <div style="color: red;font-size: 10px">${msg }</div>
     </center>
</body>
</html>