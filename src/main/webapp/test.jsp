<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
/* $(document).on('click','input[type=button]', function() {
	$.ajax({
		type:"get",
		url:"user/Mytest.do",
		dataType:"text",
		success:function(data){
			$("#sec").html(" ").html("<input type='button' value="+data+">");
		},
		error:function(){
			alert("失败");
		}
	})
	}); */
	$(function(){
		$("div").on("click",'input[type=button]',function(){
			$.ajax({
				type:"get",
				url:"user/Mytest.do",
				dataType:"text",
				success:function(data){
					$("#sec").html(" ").html("<input type='button' value="+data+">");
				},
				error:function(){
					alert("失败");
				}
			})
		})
	})
</script>
</head>
<body>
  <div>
    <input type="button" value="aa">
  </div>
  <div id="sec">
  </div>
  <div>adasdas</div>
</body>
</html>