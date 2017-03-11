<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<style type="text/css">
   #content{
      color: #CDC9C9
   }
</style>
<script type="text/javascript">
     $(function (){
    	 var type=$("input[name='type']").val();//pic或者user
    	 $("#content").val("请输入图片名");
    	 $("#upload").click(function(){
    		 location.href="${pageContext.request.contextPath}/addFile.jsp";
    	 })
    	 
    	  $("input[name='type']").change(function(){
    		    var v=$(this).val();
    		      if(v=="user"){
    		    	  $.ajax(
    		    	     {
    	       			  method:"post",   //数据的提交方式：get和post
    	         	       url:"${pageContext.request.contextPath}/user/findByFenye.do",   //数据的提交路劲
    	         	       data:"userid=${user.id}&index="+1,   //需要提交的数据
    	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
    	         	       success:function (data){
    	         	    	    $("#tab2").hide();
    	         	    	   $("#utabl").show();
    	         	    	   $("#utabl").html("<tr><th>userid</th><th>用户名</th><th>用户简介</th><th>操作</th></tr>");
    	         	    	  for(var i=0;i<data.length;i++){
     	         	    		 $("#utabl").append("<tr>"+
     	         	    		  "<td align=\"center\">"+data[i].id+"</td>"+
     	         	    		  "<td align=\"center\">"+data[i].username+"</td>"+
     	         	    		  "<td align=\"center\">"+data[i].intro+"</td>"+
     	         	    		   "<td align=\"center\"><input type='button' value='关注' onclick=\"attention('"+data[i].id+"',this);\"/></td>"+
     	         	    		 "</tr>");
     	         	    	 }
    	         	       },    //请求成功后的回调函数
    	         	       error:function (){
    	         	    	   alert("error");
    	         	       }   //请求失败后的回调函数 
    	       		 } ) 
    		      }else{
    		    	  $.ajax(
    		    			   { method:"post",   //数据的提交方式：get和post
    	    	         	       url:"${pageContext.request.contextPath}/picture/findByFenye.do",   //数据的提交路劲
    	    	         	       data:"userid=${user.id}&index="+1,   //需要提交的数据
    	    	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
    	    	         	       success:function (data){
    	    	         	    	  $("#tab2").show();
    	    	         	    	  $("#utabl").hide();
    	    	         	    	  $("#show").html(" ");
    	     	         	    	 for(var i=0;i<data.length;i++){
    	     	         	    		 $("#show").append("<td width='200px' height='300px'>"+
    	     	         	    	   "<img alt="+data[i].tags+" src="+data[i].url+" style=\"width: 150px;height:140px\" border=\"1\"><br>"+
    	     	         	    	 " <div style=\"font-size: 10px\">"+
    	 					          " 图片名称："+data[i].fname+"<br>"+
    	 					         "上传时间 :"+data[i].uploadTime+"<br>"+
    	 					          "上传人："+data[i].name+"</div></div></td>");
    	     	         	    	 }
    	    	         	       },    //请求成功后的回调函数
    	    	         	       error:function (){
    	    	         	    	   alert("error");
    	    	         	       }   //请求失败后的回调函数 
    	    	       		 } ) 
    		      }
    	  })
    	  
       $("#page a").click(function(){
    	   var page=$("#count").val();
    	    var v=$(this).html();
    	    if(v=="上一页"&&(parseInt(page)-1)!=0){
    	    	var p=parseInt(page)-1;
    	    	$.ajax(
    	       		 {
    	       			  method:"post",   //数据的提交方式：get和post
    	         	       url:"${pageContext.request.contextPath}/picture/findByFenye.do",   //数据的提交路劲
    	         	       data:"index="+parseInt(p),   //需要提交的数据
    	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
    	         	       success:function (data){
    	         	    	   $("#show").html(" ");
    	         	    	 for(var i=0;i<data.length;i++){
    	         	    		 $("#show").append("<td width='200px' height='300px'>"+
    	         	    	   "<img alt="+data[i].tags+" src="+data[i].url+" style=\"width: 150px;height:140px\" border=\"1\"><br>"+
    	         	    	 " <div style=\"font-size: 10px\">"+
					          " 图片名称："+data[i].fname+"<br>"+
					         "上传时间 :"+data[i].uploadTime+"<br>"+
					          "上传人："+data[i].name+"</div></div></td>");
    	         	    	 }
    	         	    	$("#count").val(p);
    	         	       },    //请求成功后的回调函数
    	         	       error:function (){
    	         	    	   alert("error");
    	         	       }   //请求失败后的回调函数 
    	       		 }  
    	          )
    	    }else if(v=="上一页"&&(parseInt(page)-1)==0){
    	    	alert("这已经是首页啦");
    	    }
    	    else{
    	    	var p=(parseInt(page)+1);
    	    	$.ajax(
       	       		 {
       	       			 method:"post",   //数据的提交方式：get和post
       	         	       url:"${pageContext.request.contextPath}/picture/findByFenye.do",   //数据的提交路径
       	         	       data:"index="+parseInt(p),   //需要提交的数据
       	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
       	         	       success:function (data){
       	         	    	   if(data!=null&&data.length!=0){
       	         	    	   $("#show").html(" ");
       	         	    	 for(var i=0;i<data.length;i++){
       	         	    		 $("#show").append("<td width='200px' height='300px'>"+
       	         	    	   "<img alt="+data[i].tags+" src="+data[i].url+" style=\"width: 150px;height:140px\" border=\"1\"><br>"+
       	         	    	 " <div style=\"font-size: 10px\">"+
   					          " 图片名称："+data[i].fname+"<br>"+
   					         "上传时间 :"+data[i].uploadTime+"<br>"+
   					          "上传人："+data[i].name+"</div></td>");
       	         	    	 }
       	         	    	 $("#count").val(p);
       	         	    	 }else{
       	         	    		 alert("已经是最后一页啦！");
       	         	    		$("#count").val(p-1);
       	         	    	 }
       	         	       },    //请求成功后的回调函数
       	         	       error:function (){
       	         	    	   alert("error");
       	         	       }   //请求失败后的回调函数 
       	       		 }  
       	          )
    	    }
       })
       $("#content").focus(function(){
    	    $(this).val("");
       }).blur(function(){
    	   if( $(this).val()==null|| $(this).val()==""){
    	   $(this).val("请输入图片名");
    	   }
       })
     })
</script>
<script type="text/javascript">
           function attention(id,th){
        	   $.ajax({
        		   method:"post",   //数据的提交方式：get和post
         	       url:"${pageContext.request.contextPath}/concern/addConcern.do",   //数据的提交路劲
         	       data:"userid="+id,   //需要提交的数据
         	       dataType:"text",   //服务器返回数据的类型，例如xml,String,Json等
         	       success:function (data){
         	    	 if(data=="yes"){
         	    		 var $this=$(th);
         	    		 $this.val("已关注");
         	    		 $this.attr("disabled",true);
         	    	 }
         	       },    //请求成功后的回调函数
         	       error:function (){
         	    	   alert("error");
         	       }   //请求失败后的回调函数 
        	   })
           }
           function searByname(){
        	   var v=$("#content").val();
        	    if(v.length!=0&&v!=null&&v!="请输入图片名"){
        	   $.ajax({
        		   method:"get",   //数据的提交方式：get和post
         	       url:"${pageContext.request.contextPath}/picture/findPicByname.do",   //数据的提交路劲
         	       data:"fname="+v,   //需要提交的数据
         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
         	       success:function (data){
         	    	  if(data!=null&&data.length!=0&&data.id!=null){
  	         	    	   $("#show").html(" ");
  	         	    		$("#show").append("<td width='200px' height='300px'>"+
  	         	    	   "<img alt="+data.tags+" src="+data.url+" style=\"width: 150px;height:140px\" border=\"1\"><br>"+
  	         	    	 " <div style=\"font-size: 10px\">"+
					          " 图片名称："+data.fname+"<br>"+
					         "上传时间 :"+data.uploadTime+"<br>"+
					          "上传人："+data.name+"</div></td>");
  	         	    		$("#page").hide();
  	         	    	 }else{
  	         	    		 alert("你搜索的图片不存在!!");
  	         	    	 }
         	       },    //请求成功后的回调函数
         	       error:function (){
         	    	   alert("error");
         	       }   //请求失败后的回调函数 
        	   })
        	   }else{
        		   window.location.href="${pageContext.request.contextPath}/user/login.do";
        	   }
           }
</script>
</head>
<body>
     <div align="right" style="position: absolute;left:100px;"><a href="${pageContext.request.contextPath}/user/logOut.do" style="color:red">注销</a></div> 
    <center>
     <table width="50%" border="1" cellpadding="0" cellspacing="0" >
        <tr>
           <td align="center"><h1>图片浏览</h1></td>
           <td rowspan="2" width="200px" height="200px">
             <div align="right">
              <img alt="" src="${pageContext.request.contextPath}/myimg/aa.jpg" style="width: 150px;height:140px" border="1"><br>
              <a href="${pageContext.request.contextPath }/user/forwardMyself.do" style="font-size: 10px">我的空间</a><br><br>
               <form action="" id="ffom">
               <input type="button" value="上传图片" id="upload">
               </form>
              </div>
           </td>
        </tr>
        <tr>
          <td align="center">
	        <input type="text" id="content">&nbsp;&nbsp;<input type="button" id="cast" value="search" height="60px" onclick="searByname();"><br><br>
	        <input type="radio" value="pic" style="font-size: 10px" name="type" checked="checked">照片&nbsp;&nbsp;&nbsp;&nbsp;
	         <input type="radio" value="user" style="font-size: 10px" name="type">用户 
	     </td>
        </tr>
      </table>
       <div id="showPic" style="position: absolute;left:300px;font-size:12px">用户的照片：</div>
        <table id="tab2" width="50%"> 
         <tr id="show">
        <c:forEach items="${list}" var="pic">
          <td width="200px" height="300px">
           <div>
           <img alt="${pic.tags}" src="${pic.url}" style="width: 150px;height:140px" border="1"><br>
           <div style="font-size: 10px">
                              图片名称：${pic.fname}<br>
                             上传时间 :${pic.uploadTime}<br>
                             上传人：${pic.name}<br>
            </div>                
           </div>
          </td>
        </c:forEach>
         </tr> 
         <tr> 
           <td>
              <input type="hidden" id="count" value="1">
           </td>
           <td id="page">
             <a style="cursor: pointer;color: green;text-decoration: underline;">上一页</a>&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;color: green;text-decoration: underline;">下一页</a>
           </td>
         </tr>
        </table>
        <table id="utabl" width="50%">
        </table>
      </center>
</body>
</html>