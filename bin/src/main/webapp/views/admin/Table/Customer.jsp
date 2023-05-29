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
<link rel="stylesheet" href="<c:url value='/views/admin/css/table.css'/>" /> 
	<div class="main_content__body">
		<p hidden="true" id="geturl" data-value="/customer/get"></p>
		<p hidden="true" id="addurl" data-value="/customer/create"></p>
	    <p hidden="true" id="editurl" data-value="/customer/update"></p>
	    <p hidden="true" id="deleteurl" data-value="/customer/delete"></p>
	     <p hidden="true" id="counturl" data-value="/customer/count"></p>
	    
		<div class="main_content__body-title">
			<p>Danh sách Khách hàng <span class="showdeleted">
				<a>deleted: </a><input type="checkbox" id="showdeleted">
			</span></p>
		</div>
		
		<table class="table maintable">
        <thead>
            <tr>
            <th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>
            <th></th>
            <th>ID</th>
            <th>Tên khách hàng</th>
            <th>Tên tài khoản</th>
            <th>Giới tính</th>
            <th></th>
            <th>Địa chỉ</th>
            <th>Ngày sinh</th>
            <th>Deleted</th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>
	</div>
	<div class="main_content__footer">
		<i class="fa-solid fa-circle-plus addbtn grow-btn-when-hover"></i>
		<i class="fa-solid fa-trash delete-multi-row grow-btn-when-hover"></i>
		<i class="fa-solid fa-arrows-rotate refreshbtn grow-btn-when-hover"></i>
		
		<div class="pagination">
		  <a href="#" id="first-page"><i class="fa-solid fa-angles-left"></i></a>
		  <a href="#" id="pre-page"><i class="fa-solid fa-angle-left"></i></a>
		  <input id="currentpage" value=1>
		  <a href="#" id="next-page"><i class="fa-solid fa-angle-right"></i></a>
		  <a href="#" id="last-page"><i class="fa-solid fa-angles-right"></i></a>
		</div>
	</div>
	
	 <div id="AddAndEdit" class="modal">
	
	  
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Khách hàng</h2>
	    </div>
	    <div class="modal-body">
	    	<label>ID:</label><input disabled name="cusId"></br>
	    	<label>Tài khoản:</label><input onkeydown="return false" class="obj toggledisable2" data-objkey="" data-objvalue="" id="userId" name="userId"><button  data-inputid="userId" data-url="/usermanagement/get?pageNumber=0" class="btnchooseobj toggledisable2">chọn</button> </br>
	    	<label>Tên khách hàng:</label><input name="name"></br>
	    	<label>Giới tính:</label><select name="gender">
								  <option value="F">Female</option>
								  <option value="M">Male</option>
								</select></br>
	    	<label>Ngày sinh:</label><input name="DateofBirth"></br>
	    	<label>Địa chỉ:</label><input name="address"></br>
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      <button id="oke">oke</button>
	      <button class="close">cancel</button>
	    </div>
	  </div>
	
	</div>
	
	<div id="TblChooseObj" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Chọn tài khoản</h2>
	    </div>
	    <div class="modal-body">
	    	<table class="table subtable">
		        <thead>
		            
		        </thead>
		        <tbody>
		        
		        </tbody>
		    </table>
	    	
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      
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