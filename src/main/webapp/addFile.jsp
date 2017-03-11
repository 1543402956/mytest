<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@include file="head.jsp" %>
  <center>
    <h1>文件上传</h1>
    <form action="picture/addPic.do" method="post" enctype="multipart/form-data">
      <table width="550px">
         <tr>
         <td>上传人:</td>
         <td><input type="text" name="name" value="${user.username}" readonly="readonly"></td>
         </tr>
         <tr>
         <td>图片名称:</td>
         <td><input type="text" name="fname" id="fname"></td>
         </tr>
         <tr>
         <td>标签:</td>
         <td><input type="text" name="tags"></td>
         </tr>
         <tr>
           <td>选择上传文件：</td>
            <td>
              <input type="file" name="filename">
            </td>
         </tr>
          <tr>
         <td>介绍:</td>
         <td><textarea rows="8" cols="25" name="intro"></textarea></td>
         </tr>
         <tr>
             <td colspan="3" align="center"><br><br>
               <input type="submit" value="上传文件">
             </td>
         </tr>
      </table>
    </form>
    </center>
</body>
</html>