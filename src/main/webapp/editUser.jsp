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
			var flag=true;
			var flag1=true;
			var flag2=true;
    $(function (){
    	 var pro=$("#p").val();
    	$("#p").change(function(){
          pro=$(this).val();
            $("#c").html("");
            $("#c").show();
          if(pro=="浙江"){
        	  $("#c").append("<option value=\"杭州\">杭州</option>");
        	  $("#c").append("<option value=\"嘉兴\">嘉兴</option>");
        	  $("#c").append("<option value=\"宁波\">宁波</option>");
        	  $("#c").append("<option value=\"温州\">温州</option>");
          } else if(pro=="北京"){
        	  $("#c").hide();
          }else if(pro=="湖南"){
        	  $("#c").append("<option value=\"长沙\">长沙</option>");
        	  $("#c").append("<option value=\"株洲\">株洲</option>");
        	  $("#c").append("<option value=\"岳阳\">岳阳</option>");
        	  $("#c").append("<option value=\"张家界\">张家界</option>");
          }else if(pro=="贵州"){
        	  $("#c").append("<option value=\"贵阳\">贵阳</option>");
        	  $("#c").append("<option value=\"遵义\">遵义</option>");
        	  $("#c").append("<option value=\"仁怀\">仁怀</option>");
        	  $("#c").append("<option value=\"六盘水\">六盘水</option>");
          }else{
        	  $("#c").html("<option>--选择城市--</option>");
          }
    	});
    })
     function checkMobile(str) {
    	var phone=str.value;
        var re = /^1\d{10}$/
    if (!re.test(phone)) {
    	 $("#pherro").html("手机号格式不正确");
    }else{ 
    	$("#pherro").html("")
        flag=true;
        } 
}
    function checkQQ(str){
    	var reg=/^\d{5,10}$/;
        if(!reg.test(str.value)){
            $("#qqerro").html("QQ格式不正确");
        }else{
        	$("#qqerro").html("")
        	flag1=true;
        }
    }
    function checkEmail(str){
        var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
        if(!re.test(str.value)){
            $("#emailerro").html("邮箱格式不正确");
        }else{
        	 $("#emailerro").html("");
        	flag2=true;
        }
    }
    function sub(){
      if(flag&&flag1&&flag2){
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
    <h1>修改页面</h1>
    <form action="${pageContext.request.contextPath}/user/editUser.do" method="post" onsubmit="return sub();">
      <table width="550px">
         <tr>
         <td>用户名:</td>
         <td><input type="text" name="username" value="${user.username }"></td>
         </tr>
          <tr>
         <td>省份:</td>
         <td>
	         <select name="province" id="p">
	          <option>--选择省份--</option>
	           <option value="浙江">浙江</option>
	           <option value="北京">北京</option>
	           <option value="湖南">湖南</option>
	           <option value="贵州">贵州</option>
	         </select>
         </td>
         <td>城市:</td>
         <td>
            <select name="city" id="c">
	           <option>--选择城市--</option>
	         </select>
         </td>
         </tr>
         <tr>
         <td>邮箱:</td>
         <td><input type="text" name="email" id="email" onblur="checkEmail(this);" value="${user.email }"><span id="emailerro"></span></td>
         </tr>
         <tr>
         <td>手机:</td>
         <td><input type="text" name="mobile" id="phone" onblur="checkMobile(this);" value="${user.mobile }"><span id="pherro"></span></td>
         </tr>
         <tr>
         <td>qq:</td>
         <td><input type="text" name="qq" id="qq" onblur="checkQQ(this);" value="${user.qq }"><span id="qqerro"></span></td>
         </tr>
         <tr>
           <td colspan="3">
               <center><input type="submit" value="修改" id="btn"></center>
           </td>
         </tr>
      </table>
    </form>
    </center>
</body>
</html>