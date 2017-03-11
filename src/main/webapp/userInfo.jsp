<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
        function edit(){
        	document.getElementById("editForm").action="${pageContext.request.contextPath}/user/editSig.do";
        	document.getElementById("editForm").submit();
        }
      $(function(){
    	  $("#edithead").click(function(){
    	    	$("#f").click();
    	    });
    	  $("#f").change(function(){
    		  var formData = new FormData();
    		  formData.append('fname', $('#f')[0].files[0]);
    		  $.ajax({
      		    method:"post",   //数据的提交方式：get和post
      	        url:"${pageContext.request.contextPath}/user/editHead.do",   //数据的提交路劲
      	        data:formData,
      	      processData: false,
      	      contentType: false,
      	        success:function (data){
      	    	    if(data=="yes"){
      	    	    /**
      	    	      $("#headimg").remove();
      	    	      $("#show").prepend("<img alt='head' src='${pageContext.request.contextPath}/myimg/${user.id}.jpg' style='width: 150px;height:140px'"+
      	    	      " border=\"1\" align=\"left\" id=\"headimg\">"); */
      	    	    $("#headimg").attr("src","${pageContext.request.contextPath}/myimg/${user.id}.jpg");
      	    	    }
      	       },    //请求成功后的回调函数
      	       error:function (){
      	    	   alert("error");
      	       }   //请求失败后的回调函数 
      	  })
    	  })
    	  
    	  $("#page a").click(function(){
    	   var page=$("#count").val();
    	    var v=$(this).html();
    	    if(v=="上一页"&&(parseInt(page)-1)!=0){
    	    	var p=parseInt(page)-1;
    	    	$.ajax(
    	       		 {
    	       			  method:"post",   //数据的提交方式：get和post
    	         	       url:"${pageContext.request.contextPath}/picture/findByUseridFenye.do",   //数据的提交路劲
    	         	       data:"userid=${user.id}&index="+parseInt(p),   //需要提交的数据
    	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
    	         	       success:function (data){
    	         	    	   $("#show2").html(" ");
    	         	    	 for(var i=0;i<data.length;i++){
    	         	    		 $("#show2").append("<td width='200px' height='300px'>"+
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
       	         	       url:"${pageContext.request.contextPath}/picture/findByUseridFenye.do",   //数据的提交路径
       	         	       data:"userid=${user.id}&index="+parseInt(p),   //需要提交的数据
       	         	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
       	         	       success:function (data){
       	         	    	   if(data!=null&&data.length!=0){
       	         	    	   $("#show2").html(" ");
       	         	    	 for(var i=0;i<data.length;i++){
       	         	    		 $("#show2").append("<td width='200px' height='300px'>"+
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
      })
</script>
<script type="text/javascript">
function searByname(){
	   var v=$("#content").val();
	    if(v.length!=0&&v!=null){
	   $.ajax({
		   method:"get",   //数据的提交方式：get和post
	       url:"${pageContext.request.contextPath}/picture/findPicByuserIdAndfname.do",   //数据的提交路劲
	       data:"fname="+v,   //需要提交的数据
	       dataType:"json",   //服务器返回数据的类型，例如xml,String,Json等
	       success:function (data){
	    	  if(data!=null&&data.length!=0&&data.id!=null){
    	    	   $("#show2").html(" ");
    	    		$("#show2").append("<td width='200px' height='300px'>"+
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
		   window.location.href="${pageContext.request.contextPath}/picture/findAllUsersPic.do";
	   }
}
$(function(){
	  $(".delt").click(function(){
		  window.location.href="${pageContext.request.contextPath}/picture/"+$(this).prev("div").text()+"/delete.do";
	  })
})
</script>
</head>
<body>
 <%@include file="head.jsp" %>
   <div style="position:absolute; left: 220px">
  <div style="width:650px;height: 180px;">
	   <div id="show">
	     <img alt="aa" src="${pageContext.request.contextPath}/myimg/aa.jpg" style="width: 150px;height:140px" border="1" align="left" id="headimg">
	     <input type="file" style="display:none" id="f">
	     <div><input type="button" value="修改头像" style="margin-top:150px;position: absolute;left:40px" id="edithead"></div>
	     <div>
	     &nbsp;
	       <label>${user.username}</label>&nbsp;
	       <a href="${pageContext.request.contextPath}/editUser.jsp">修改个人信息</a>&nbsp;
	       <a href="${pageContext.request.contextPath}/editPwd.jsp">修改密码</a>
	       &nbsp;<div style="font-size: 13px">&nbsp;${user.province }</div>
	       <div style="font-size: 13px">&nbsp;${user.gender }</div>
	     </div>
	         <form method="post" id="editForm">
	            <div>
	              &nbsp;&nbsp; <textarea rows="6" cols="20" name="intro">${user.intro}</textarea>&nbsp;&nbsp;
	              <input type="button" value="修改签名" style="width:130px;height:50px;position: absolute;margin-top: 20px;" onclick="edit();">
	           </div>
              </form>
           <div style="margin-left: 150px">
              <a href="${pageContext.request.contextPath}/concerlist.jsp">关注人${size}人</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/fans.jsp">粉丝${size2}人</a>
           </div>
	   </div>
  </div>
  <div>
         搜索图片标签:<input type="text" name="tags" id="content"><input type="button" value="搜索" onclick="searByname()">
  </div>
     <div>
                我上传的图片
     </div>
     </div>
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       <table id="tab2" width="50%" align="center">
         <tr id="show2">
        <c:forEach items="${list2}" var="pic">
          <td width="200px" height="300px">
           <div>
           <img alt="${pic.tags}" src="${pic.url}" style="width: 150px;height:140px" border="1"><br>
           <div style="font-size: 10px">
                              图片名称：${pic.fname}<br>
                             上传时间 :${pic.uploadTime}<br>
                             上传人：${pic.name}<br>
         <div style="display:none">${pic.id}</div>
         <input type="button" value="删除" class="delt">
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
</body>
</html>