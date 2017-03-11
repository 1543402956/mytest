<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
   $(function(){
	   $("#show").html(" ");
   })
</script>
</head>
<body>
  错误页面
  <div></div>
    <div style="position:absolute;top:60px;left:500px">
    <input type="text" id="content">&nbsp;&nbsp;<input type="button" id="cast" value="search">
    &nbsp;&nbsp; 
     <span>
     <input type="file" name="file" id="file">
     </span>
    </div>
     <table>
     <tr id="show">
        <c:forEach items="${list}" var="pic">
          <td width="200px" height="300px">
           <div>
           <img alt="${pic.tags}" src="${pic.url}" style="width: 150px;height:140px" border="1"><br>
           <div style="font-size: 10px">
                              图片名称：${pic.fname}<br>
                             上传时间 :${pic.uploadTime}<br>
                             上传人：${pic.name} 
            </div>                
           </div>
          </td>
        </c:forEach>
         </tr> 
         </table>
</body>
</html>