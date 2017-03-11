<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    td{
      text-align: center
    }
</style>
<script src="js/jquery.js"></script>
<script type="text/javascript">
    function cancel(id,th){
    	 $(function(){
    		 $.ajax({
    			 method:'post',
    			 url:'${pageContext.request.contextPath}/user/cancelAtt.do',
    			 data:'id='+id,
    			 dataType:'text',
    			 success:function(data){
    				 if(data=="yes"){
    					 $(th).val("已取消关注").attr("disabled",true);
    				 }
    			 },
    			 error:function(){
   		    	  alert("操作失败");
   		      }
    		 })
    	 })
    }
</script>
</head>
<body> 
   <%@include file="head.jsp" %>
       <table width="50%" align="center">
             <tr>
                  <th>用户名</th>
                  <th>真实名</th>
                  <th>地址</th>
                  <th>性别</th>
                  <th>邮箱</th>
                  <th>操作</th>
             </tr>
           <c:forEach items="${conceredUser}" var="u">
           <tr>
               <td>${u.userByConcernedId.username}</td>
               <td>${u.userByConcernedId.name}</td>
               <td>${u.userByConcernedId.province}</td>
               <td>${u.userByConcernedId.gender}</td>
               <td>${u.userByConcernedId.email}</td>
               <td><input type="button" value="取消关注" onclick="cancel('${u.userByConcernedId.id}',this);"></td>
           </tr>
           </c:forEach>
       </table>
</body>
</html>