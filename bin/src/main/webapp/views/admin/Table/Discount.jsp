<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main_content__body">
		<p hidden="true" id="geturl" data-value="/discount/get"></p>
		<p hidden="true" id="addurl" data-value="/discount/create"></p>
	    <p hidden="true" id="editurl" data-value="/discount/update"></p>
	    <p hidden="true" id="deleteurl" data-value="/discount/delete"></p>
	    
		<div class="main_content__body-title">
			<p>Giảm giá</p>
		</div>
		
		<table class="table maintable">
        <thead>
            
        </thead>
        <tbody>
        
        </tbody>
    </table>
	</div>
	<div class="main_content__footer">
		<i class="fa-solid fa-circle-plus addbtn"></i>
		<i class="fa-solid fa-arrows-rotate refreshbtn"></i>
		
	</div>
	
	 <div id="AddAndEdit" class="modal">
	
	  
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Thêm discount</h2>
	    </div>
	    <div class="modal-body">
	    	<label>discountId:</label><input disabled name="discountId"></br>
	    	<label>amount:</label><input name="amount"></br>
	    	<label>percent:</label><input name="percent"></br>
	    	
	    	<label>startDate:</label><input name="startDate"></br>
	    	<label>stopDate:</label><input name="stopDate"></br>
	    	<label>deleted:</label><select class="toggledisable" disabled name="deleted">
								  <option value="false">false</option>
								  <option value="true">true</option>
								</select></br>
	    	
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      <button id="oke">oke</button>
	      <button class="close">cancel</button>
	    </div>
	  </div>
	
	</div>
	
	
	
	<script src="<c:url value='/views/admin/js/table.js'/>"></script>
	<script type="text/javascript">
	
		let url = $(".main_content__body #geturl").data("value")
		
		LoadTable(url);
	</script>
</body>
</html>