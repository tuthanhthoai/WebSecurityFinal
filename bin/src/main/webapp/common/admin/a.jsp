<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="<c:url value='/views/admin/css/base.css'/>" />
<link rel="stylesheet" href="<c:url value='/views/admin/css/main.css'/>" />
<script
      src="//code.jquery.com/jquery-3.2.1.slim.min.js"
      type="text/javascript"
    ></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	
</head>
<body>
<div class="header">
	<ul>
		<li style="background-color: #4285F4;font-size: 20px; " ><a style="color: white; font-weight: 800" href="">Thousand Sunny</a></li>
	</ul>
	<ul>
		
		 
			<c:choose>
			    <c:when test="${sessionScope.accountName == null}">
			        
			    </c:when>    
			    <c:otherwise>
			    	<div class="clickavt">
			    	<img  style="height: 30px;" src="<c:url value='/views/image/avatardefault_92824.jpg'/>" alt="defautlavt">
			    	<a >${sessionScope.accountName}</a>
			    	</div>
			        <%-- <li style="border-radius: 10px" ><a href="">${sessionScope.accountName}</a></li> --%>
			        <div class="accountoption">
			        	<div>Đổi mật khẩu</div>
			        	<div>Đăng xuất</div>
			        </div>
			    </c:otherwise>
			</c:choose>
		
	</ul>
	
	<script type="text/javascript">
	$(".clickavt").click(function () {
		$(".accountoption").toggleClass( "active" );
	})
	</script>
</div>
</body>
</html>