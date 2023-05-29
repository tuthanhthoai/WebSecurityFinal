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

 <style>.maintable tr > *:nth-child(5) {display: none;}</style>
	<div class="main_content__body">
		<p hidden="true" id="geturl" data-value="/usermanagement/get"></p>
		<p hidden="true" id="addurl" data-value="/usermanagement/create"></p>
	    <p hidden="true" id="editurl" data-value="/usermanagement/update"></p>
	    <p hidden="true" id="deleteurl" data-value="/usermanagement/delete"></p>
	    <p hidden="true" id="counturl" data-value="/usermanagement/count?table=User"></p>
	    
		<div class="main_content__body-title">
			<p>Danh sách tài khoản người dùng <span class="showdeleted">
				<a>deleted: </a><input type="checkbox" id="showdeleted">
			</span></p>
			
		</div>
		<table  class="table maintable">
        <thead>
            <tr>
            <th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>
            <th></th>
            <th>Tên người dùng</th>
            <th>Địa chỉ</th>
            <th>Email</th>
            <th>SĐT</th>
            <th>Role</th>
            <th></th>
            <th>Enable</th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>
	</div>
	<div class="main_content__footer">
		<i class="fa-solid fa-circle-plus addbtn grow-btn-when-hover"></i>
		<!-- <i class="fa-solid fa-eye viewbtn"></i>
		<i class="fa-solid fa-magnifying-glass findbtn" ></i> -->
		<i class="fa-solid fa-trash delete-multi-row grow-btn-when-hover"></i>
		<i class="fa-solid fa-arrows-rotate refreshbtn grow-btn-when-hover"></i>
		<!-- <i class="fa-solid fa-magnifying-glass findbtn grow-btn-when-hover" ></i> -->
		
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
	      <h2>Tài khoản</h2>
	    </div>
	    <div class="modal-body">
	    	
	    	
	    	<label>User ID:</label><input disabled name="userId"></br>
	    	<label>Tên tài khoản:</label><input class="toggledisable2" name="accountName"></br>
	    	<label>Mật khẩu:</label><input class="toggledisable2" type="password" name="password"></br>
	    	<label>Email:</label><input name="email"></br>
	    	<label>Số điện thoại:</label><input name="phone"></br>
	    	<label>Role:</label><input onkeydown="return false" class="obj" data-objkey="" data-objvalue="" id="roleId" name="roleId"><button data-inputid="roleId" data-url="/role/get" class="btnchooseobj">chọn</button> </br>
	    	<label>Enable:</label><select class="toggledisable" disabled name="enable">
								  <option value="true">true</option>
								  <option value="false">false</option>
								</select></br>
	    	<label>Deleted:</label><select class="toggledisable" disabled name="deleted">
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
	<div id="TblChooseObj" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Chọn</h2>
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
	
	
	<div id="FindRecord" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Modal Header</h2>
	    </div>
	    <div class="modal-body" >
	    	
	    	<select name="Field">
								  <option value="userId">userId</option>
								  <option value="accountName">accountName</option>
								  <option value="email">email</option>
								</select><input name="findrecord" id="findrecord" class="findrecord" placeholder="dữ liệu muốn tìm" >
	    	
	    </div>
	    <div class="modal-footer">
	    
	    <button id="find">find</button>
	      <button class="close">cancel</button>
	    </div>
	  </div>
	</div> 
	
	
	<script src="<c:url value='/views/admin/js/table.js'/>"></script>
	<script type="text/javascript">
		let url = $(".main_content__body #geturl").data("value")
		LoadTable(url);
		
		
	</script>
	
	<script type="text/javascript">
	
	
	$('.viewbtn').click(function() {
		console.log($('.maintable .cbx-row :checkbox:checked:last'))
	});
	
	
	
	$("#find").click(function () {
		let url = $(".main_content__body #geturl").data("value")
		let field = $("select[name=Field]").val()
		let search = $("input[name=findrecord]").val()
		
		//alert(field)
		alert(url)
		FilterTable(url, field,search);
	})
	
	
	
	</script>
	
</body>
</html>