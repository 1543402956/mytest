<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
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
			var flag=false;
			var flag1=false;
			var flag2=false;
			var flag3=false;
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
      if(flag&&flag1&&flag2&&flag3){
    	 return true;
      }else{
    	  alert("你有必填项未填写");
    	  return false;
      }
    }
</script>
</head>
<body>
    <center>
    <h1>注册页面</h1>
    <form action="user/addUser.do" method="post" onsubmit="return sub();">
      <table width="550px">
         <tr>
         <td>用户名:</td>
         <td><input type="text" name="username"></td>
         </tr>
         <tr>
         <td>密码:</td>
         <td><input type="password" name="password" id="password"><span class="pwderro"></span></td>
         </tr>
         <tr>
         <td>确认密码:</td>
         <td><input type="password" id="pwd" onblur="checkPwd();"><span class="pwderro"></span></td>
         </tr>
         <tr>
         <td>真实姓名:</td>
         <td><input type="text" name="name"></td>
         </tr>
         <tr>
         <td>性别:</td>
         <td><input type="radio" name="gender" value="男" checked="checked">男
             <input type="radio" name="gender" value="女">女
         </td>
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
         <td><input type="text" name="email" id="email" onblur="checkEmail(this);"><span id="emailerro"></span></td>
         </tr>
         <tr>
         <td>手机:</td>
         <td><input type="text" name="mobile" id="phone" onblur="checkMobile(this);"><span id="pherro"></span></td>
         </tr>
         <tr>
         <td>qq:</td>
         <td><input type="text" name="qq" id="qq" onblur="checkQQ(this);"><span id="qqerro"></span></td>
         </tr>
         <tr>
           <td colspan="3">
               <center><input type="submit" value="注册" id="btn"></center>
           </td>
         </tr>
      </table>
    </form>
    </center>
</body>
</html>