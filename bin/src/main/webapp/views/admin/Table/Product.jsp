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
<style>
.maintable tr > *:nth-child(12) {display: none;}
.maintable tr > *:nth-child(8) {display: none;}
.maintable tr > *:nth-child(13) {display: none;} 
.maintable tr > *:nth-child(11) {display: none;}  
 
.input-head{
	display: flex;
	align-items: center;
	width: 30%;
	justify-content: flex-start;
	margin: 0 0 20px 0;
}

.input-head input{
	margin: auto;
}
</style>

	<div class="main_content__body">
		<p hidden="true" id="geturl" data-value="/product/get"></p>
		<p hidden="true" id="addurl" data-value="/product/create"></p>
	    <p hidden="true" id="editurl" data-value="/product/update"></p>
	    <p hidden="true" id="deleteurl" data-value="/product/delete"></p>
	    <p hidden="true" id="counturl" data-value="/product/count?cateid=0"></p>
	    
		<div class="main_content__body-title">
			<p>Danh sách sản phẩm<span class="showdeleted">
				<a>deleted: </a><input type="checkbox" id="showdeleted">
			</span></p>
		</div>
		<div class="CateList">
			<!-- <div class="cateItem active">abcd</div> -->
			<div>
			<i class="fa-solid fa-circle-plus addcatebtn grow-btn-when-hover"></i></div>
			<div onclick="LoadTable(url)" class="cateItem">Tất cả</div>
		</div>
		
		<table class="maintable">
        <thead>
            <tr>
            <th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>
            <th></th>
            <th>ID</th>
            <th>Loại sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th>sl</th>
            <th>Giảm giá</th>
            <th>Deleted</th>
            <th>p</th>
            <th>p</th>
            <th>w</th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>
	</div>
	<div class="main_content__footer">
		<i class="fa-solid fa-circle-plus addbtn grow-btn-when-hover"></i>
		<i hidden class="fa-solid fa-trash delete-multi-row grow-btn-when-hover"></i>
		
		<div class="pagination">
		  <a href="#" id="pfirst-page"><i class="fa-solid fa-angles-left"></i></a>
		  <a href="#" id="ppre-page"><i class="fa-solid fa-angle-left"></i></a>
		  <input id="pcurrentpage" value=1>
		  <a href="#" id="pnext-page"><i class="fa-solid fa-angle-right"></i></a>
		  <a href="#" id="plast-page"><i class="fa-solid fa-angles-right"></i></a>
		</div>
	</div>
	
	 <div id="AddAndEdit" class="modal">
	  <div class="modal-content product">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>PRODUCT DETAIL</h2>
	    </div>
	    <div class="modal-body">
	    	<label>Product ID:</label><input disabled name="pid"></br></br>
	    	<div class="input-image">
		    	<div>
			    	<input type="file" id="imageFile" name="images " accept=".jpg, .jpeg, .png" /></br>
			    	<img class="card-img" src="" alt="Card image cap" /></br>
			    </div>
			    
			    <div>
			    	<input type="file" id="imageFile" name="images " accept=".jpg, .jpeg, .png" /></br>
			    	<img class="card-img" src="" alt="Card image cap" /></br>
			    </div>
			    <div>
			    	<input type="file" id="imageFile" name="images " accept=".jpg, .jpeg, .png" /></br>
			    	<img class="card-img" src="" alt="Card image cap" /></br>
			    </div>
			    <div>
			    	<input type="file" id="imageFile" name="images " accept=".jpg, .jpeg, .png" /></br>
			    	<img class="card-img" src="" alt="Card image cap" /></br>
			    </div>
			</div>
	    	
		    <div class="input-product">
		    	<div class="input-info">
		        	
			    	<label>ptype:</label><input onkeydown="return false" class="obj" data-objkey="" data-objvalue="" id="ptype" name="ptype"><button data-inputid="ptype" data-url="/producttype/get" class="btnchooseobj">chọn</button> </br>
			    	<label>pname:</label><input name="pname"></br>
			    	<label>price:</label><input name="price"></br>
			    	<label>description:</label><input name="description"></br>
			    	<label>quantity:</label><input name="quantity"></br>
			    	<label>discountId:</label><input onkeydown="return false" class="obj" data-objkey="" data-objvalue="" id="discountId" name="discountId"><button data-inputid="discountId" data-url="/discount/get" class="btnchooseobj">chọn</button> </br>
			    	<label>deleted:</label><select class="toggledisable" disabled name="deleted">
								  <option value="false">false</option>
								  <option value="true">true</option>
								</select></br>
			    	<label>waranty(tháng):</label><input name="waranty"></br>	    	
		    	</div>
		    	<div class= "floatbtn">
		    		<div class="pattr" data-url="/productAttribute/get" id="add-ptoattr">
		    			<i class="fa-solid fa-circle-plus" ></i>
		    		</div>
		    		<div class="pattr" data-url="/productAttribute/add" id="new-pattr">
		    			<button>new</button>
		    		</div>
		    	</div>	
		    	
		    	<div class="input-attribute">
		    		
			    	 <table>
			    	 	<thead>
			    	 		<tr>
			    	 			<th>atrName</th>
			    	 			<th>val</th>
			    	 			<th>unit</th>
			    	 			<th></th>
			    	 		</tr>
			    	 	</thead>
			    	 	<tbody>
			    	 		
			    	 	</tbody>
			    	 </table>
		    		
		    	</div>
		    	
	    	</div>
	    	
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      <button id="oke-product">oke</button>
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
	
	<div id="TblChooseAttr" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close-a closex">&times;</span>
	      <h2>Modal Header</h2>
	    </div>
	    <div class="modal-body">
	    	<div class="input-head">
	    	<label style="width: auto">value:</label> <input id="value" name = "value" placeholder='value'> 
	    	</div>
	    	<table class="table tblchooseattr">
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
	
	<div id="AddAtribute" class="modal">
	
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Attribute</h2>
	    </div>
	    <div class="modal-body">	    	
	    	<label>atrName:</label><input name="atrName"></br>	   
	    	<label>unit:</label><input name="unit"></br>	    	
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      <button class="submit-form-a" id="oke">oke</button>
	      <button class="close">cancel</button>
	    </div>
	  </div>
	
	</div> 
	
	<div id="addnewcategory" class="modal">
	  <div class="modal-content">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Thêm Category</h2>
	    </div>
	    <div class="modal-body">
	    	<label>category name:</label><input name="ptype"></br>	   
	    	
	    	
	    </div>
	    <div class="modal-footer">
	     <button id="addcate">Thêm</button>
	      <button class="close">cancel</button>
	    </div>
	  </div>
	</div> 
	

	<script src="<c:url value='/views/admin/js/table.js'/>"></script>
	
	<!-- override -->
	<script type="text/javascript">
		var cateid = 0;
		//cancel addattrform
		$('#AddAtribute').on('click', '.close', function () {
			$(this).closest('#AddAtribute').css("display", "none");
		})
		//click oke addattrform
		$('#AddAtribute').on('click', '.submit-form-a', function () {
			//$(this).closest('#AddAtribute').css("display", "none");
			
			let atrName = $('#AddAtribute input[name=atrName]').val();
			let unit = $('#AddAtribute input[name=unit]').val();
			
			if( (atrName == "" || atrName == null ) || (unit == "" || unit == null ) ){
				toast({
			          title: "Thông báo",
			          message: "Chưa nhập đầy đủ thông tin",
			          type: "error", //or success
			        });
				return false;
			}
			
			let productAttributedata = {
			        "unit": unit,
			        "atrName": atrName
			    }
			console.log(productAttributedata)
			
			fetch('http://localhost:8083/productAttribute/add', {
				  method: 'POST', 
				  headers: {
				    'Content-Type': 'application/json',
				  },
				  body: JSON.stringify(productAttributedata),
				})
				  .then((response) => {
					  if(response.status == 200){
						  toast({
					          title: "SUCCESS",
					          message: "Thêm thành công",
					          type: "success", //or success
					        });
						  $('#AddAtribute input[name=unit]').val("")
						  $('#AddAtribute input[name=unit]').val("")
						  $(this).closest('#AddAtribute').css("display", "none");
					  }
				  })
				  
				  .catch((error) => {
				    console.error('Error:', error);
				  });
		})
		
		//load cate
		function LoadCategory(){
			
			fetch('http://localhost:8083/producttype/get')
			  .then((response) => response.json())
			  .then((data) => {
				  data.forEach(item => {$(".CateList").append(`<div data-ptype = \${item.ptype} class="cateItem">\${item.ptypeName}</div>`)});
			  });
		}
		//load product by cate
		function LoadProductByPtype(ptype) {
			LoadTable('/product/get-by-ptype?pageSize=10&ptype=' + ptype);
		}
		//click oke --> fetch api to add or edit
		$("#AddAndEdit").on("click", "#oke-product", function (e) {
			let inp = $('#AddAndEdit .modal-body .input-info input');
			let sel = $('#AddAndEdit .modal-body .input-info select');
			let inpobj = $('#AddAndEdit .modal-body .input-info input.obj');
			
			let inputimg = $('#AddAndEdit .modal-body .input-image input');
			
			let ptoattrs = "";
			
			if(execType == "POST"){
				let rows = $('.input-attribute tbody tr')
				rows.each(function(item) {
					let val = $(this).find('td').eq(1).html();
					let attrid = $(this).data('attrid');
					let ptoattr = [{"val":val,"atrId":{"atrId":attrid} }]
					ptoattrs = ptoattrs + (JSON.stringify(ptoattr))
					console.log(ptoattrs)
				})
			}
			
			
			let obj = {}
			let images = []
			for(let i = 0;i< inp.length ; i++){
				if($(inp).eq(i).hasClass("obj")){
					let newobj = {}
					newobj[$(inp).eq(i).data("key")] = $(inp).eq(i).val();
					obj[$(inp).eq(i).attr("name")] = newobj;
				}
				else{
					obj[$(inp).eq(i).attr("name")] = $(inp).eq(i).val()
				}
			}
			for(let i = 0;i< sel.length ; i++){
				
				obj[$(sel).eq(i).attr("name")] = $(sel).eq(i).val()
			}
			for(let i = 0;i< inpobj.length ; i++){
				//console.log($(inpobj).eq(i).attr("name"))
				
				let subobj = {}
				subobj[$(inpobj).eq(i).data("objkey")] = $(inpobj).eq(i).data("objvalue")
				obj[$(inpobj).eq(i).attr("name")] = subobj
			}
			if( !obj.discountId.hasOwnProperty('discountId')){
				obj.discountId = null
			}
			console.log(obj)
			
			var formdata = new FormData();
			
		    formdata.append('imageFile',inputimg.eq(0).prop('files')[0])
		    formdata.append('imageFile',inputimg.eq(1).prop('files')[0])
		    formdata.append('imageFile',inputimg.eq(2).prop('files')[0])
		    formdata.append('imageFile',inputimg.eq(3).prop('files')[0])
		    
		    formdata.append('product',JSON.stringify(obj))
		    formdata.append('ptoattrs',ptoattrs)
		    fetch(rootURL + execUrl, {
			  method: execType,
			  body: formdata
			})
			.then(r => {
				console.log(r.status)
				let url = $(".main_content__body #geturl").data("value")
				
				$("#AddAndEdit").css("display", "none");
				LoadTable(url);
				
			})
			.then(data => {
			  console.log(data)
			})
		})
		
		
	</script>
	
	<!-- action  -->
	<script type="text/javascript">
		let url = $(".main_content__body #geturl").data("value")
		LoadTable(url);
		LoadCategory();
	</script>
	
	<!-- action -->
	<script type="text/javascript">
	//show to sub table
	$("#AddAndEdit").on("click", "#add-ptoattr", function (e) {
		$.ajax({
			url : "http://localhost:8083"+$(this).data("url"),
			type : "GET",
			dataType: "json",				
			success : function(result) {
				var keys = Object.keys(result[0])
				
				var keyslength = keys.length
				$('.tblchooseattr thead tr').remove()
				$('.tblchooseattr tbody tr').remove()
				$('.tblchooseattr thead').append(`<tr></tr>`)
				$('.tblchooseattr thead tr').append(`<th></th>`)
				
				for (var i = 0; i<keyslength; i++){
					console.log(keys[i])
					$('.tblchooseattr thead tr').append(`<th>\${keys[i]}</th>`)
				}

				for (var i = 0; i <result.length ; i++) { 
					$('.tblchooseattr tbody').append(`<tr></tr>`)
					$('.tblchooseattr tbody tr').last().append(`<td style="width:70px;" ><button class="btnsubmit" >chọn</button></td>`)
					for (var j = 0; j<keyslength; j++){
						$('.tblchooseattr tbody tr').last().append(`<td name="${keys[j]}" >\${result[i][keys[j]]}</td>`)
					}	
				}
				console.log(result)
				$('#TblChooseAttr').css("display", "block");
			},
			error : function(error) {
				toast({
			          title: "ERROR",
			          message: "An error occur!",
			          type: "error", //or success
			        });
			}
		});
	})
	
	//onclick on catename
	$(".CateList").on("click", ".cateItem", function (e) {
		
		let cateitem = $(".CateList .cateItem");
		[...cateitem].forEach(item => {
			 item.className = "cateItem";
		});
		
		this.className = "cateItem active";
		
		if($(this).data("ptype")){
			//$('#counturl').data('value', $('#origincounturl').data('value') + "?cateid=" + $(this).data("ptype"))
			
			cateid = $(this).data("ptype")
			LoadProductByPtype($(this).data("ptype"))
		}
		else{
			//$('#counturl').data('value', $('#origincounturl').data('value') + "?cateid=0")
			
			cateid = 0
		}
		 $(".main_content__body #counturl").data("value", "/product/count?cateid=" + cateid)
		 
		 $("#pcurrentpage").val(1)
	})
	//show image
	 $(document).on('change','#imageFile' , function(e){
		  
		  const currFiles = e.target.files
		  if(currFiles.length > 0){
			  let src = URL.createObjectURL(currFiles[0])
			  let imagePreview = $(this).parent().find('img')
		      imagePreview.attr('src', src);
		      //console.log(imagePreview.attr('class'))
		  }
	  }); 
	
	var old_diplay = $('#AddAndEdit').css("display")
	setInterval(function () {
		var new_diplay = $('#AddAndEdit').css("display")
		if(old_diplay != new_diplay){
			old_diplay = new_diplay
			if(old_diplay == "block"){
				$('#AddAndEdit img').attr('src','null')
				LoadAttribute()
			}
		}
		
	}, 300);
	
	 function LoadAttribute() {
		 $('.input-attribute tbody tr').remove()
		 
		 let pid = $('input[name=pid]').val();
		 
		 if(pid != 0 && pid != null)
		 {
			 fetch('http://localhost:8083/productToAttribute/get-by-pid?pid=' + pid)
			  .then((response) => response.json())
			  .then((data) => {
				  data.forEach(item => {$('.input-attribute tbody').append(`<tr data-ptoattrid=\${item.id} ><td>\${item.atrId.atrName}</td> <td>\${item.val}</td> <td>\${item.atrId.unit}</td> <td><i class="fa-solid fa-trash btn-delete-ptoattr"></i></td> </tr>`)});
			  });
		 }
	}
	 
	 
	 
	 $(document).on('click','.btn-delete-ptoattr', function() {
			let ptoattr = $(this).closest('tr').data('ptoattrid')
			let data = {"id": ptoattr}
			
			if(execType == "POST"){
				$(this).closest('tr').remove()
			}
			else if(execType == "PUT"){
				fetch("http://localhost:8083/productToAttribute/delete", {
					  method: "DELETE",
					  headers: {
					    'Content-Type': 'application/json',
					  },
					  body: JSON.stringify(data),
					})
					.then((response) =>{ 
						if(response.status == 200){
							LoadAttribute();
						}
						
					})
					  .catch((error) => {
					    console.error('Error:', error);
					  });
			}
			
		})
	
	$("#AddAndEdit").on("click", "#new-pattr", function (e) {
		$('#AddAtribute').css("display", "block");
	})	
	
	//ptoattr
	$("#TblChooseAttr").on("click", "button.btnsubmit", function (e) {
		let valueinp = $('.input-head input').val()
		let pid = $('input[name=pid]').val();
		let atrId = $(this).closest('tr').find('td').eq(1).html();
		let atrName = $(this).closest('tr').find('td').eq(2).html();
		let unit = $(this).closest('tr').find('td').eq(3).html();
		let data_ptoattr = {
		        "val": valueinp,
		        "pid": {
		            "pid": pid
		        },
		        "atrId": {
		            "atrId": atrId,
		            "unit":unit,
		            "atrName":atrName
		        }
		    }
		if(valueinp != "" && valueinp != null){
			if(execType == "POST"){
				$('.input-attribute tbody').append(`<tr data-attrid=\${data_ptoattr.atrId.atrId} ><td>\${data_ptoattr.atrId.atrName}</td> <td>\${data_ptoattr.val}</td> <td>\${data_ptoattr.atrId.unit}</td> <td><i class="fa-solid fa-trash btn-delete-ptoattr"></i></td> </tr>`)
				 $('.input-head input').val("")
				  $(this).closest('.modal').css("display", "none");
			}
			else if(execType == "PUT"){
				fetch('http://localhost:8083/productToAttribute/add', {
					  method: 'POST', 
					  headers: {
					    'Content-Type': 'application/json',
					  },
					  body: JSON.stringify(data_ptoattr),
					})
					  .then((response) =>{
						  if(response.status == 200){
							  console.log('thêm thành công')
							  LoadAttribute();
							  $('.input-head input').val("")
							  $(this).closest('.modal').css("display", "none");
						  }
						  else{
							  console.log('lỗi')
						  }
					  })
					  
					  .catch((error) => {
					    console.error('Error:', error);
					  });
			}
		}
		else{
			toast({
		          title: "ERROR",
		          message: "Chưa nhập value cho attribute này",
		          type: "error", //or success
		        });
		}
	})
		
		
	
	
//on change page number 
$(document).on('change','#pcurrentpage' , function(e){
	let url = $(".main_content__body #geturl").data("value")
	
	
	let curpage = parseInt($(this).val())
	if(curpage < 1 || curpage>lastpage){
		
		toast({
	          title: "Thông báo",
	          message: "Trang bạn nhập không chính xác",
	          type: "error", //or success
	        });
		return false;
	}
	
	
	if(cateid != 0){
	 	url = "/product/get-by-ptype?pageSize=10&ptype=" + cateid+" &pageNumber=" + curpage
	 	LoadTable(url);
	}
	else{
		
		LoadTable(url+"?pageNumber=" + curpage);
	}
	e.preventDefault()
}); 


$(document).on('click','#pfirst-page' , function(e){
	
	$("#pcurrentpage").val(1)
	
	let url = $(".main_content__body #geturl").data("value")
	let curpage = $(this).val()
	
	
	if(cateid != 0){
	 	url = "/product/get-by-ptype?pageSize=10&ptype=" + cateid+" &pageNumber=" + curpage
	 	LoadTable(url);
	}
	else{
		
		LoadTable(url+"?pageNumber=" + curpage);
	}
	e.preventDefault()
}); 

$(document).on('click','#ppre-page' , function(e){
	let prepage = parseInt($("#pcurrentpage").val()) -1 
	if(prepage < 1){
		toast({
	          title: "Thông báo",
	          message: "Trang bạn nhập không chính xác",
	          type: "error", //or success
	        });
		return false;
	}
	
	let url = $(".main_content__body #geturl").data("value")
	
	if(cateid != 0){
	 	url = "/product/get-by-ptype?pageSize=10&ptype=" + cateid+" &pageNumber=" + prepage
	 	LoadTable(url);
	}
	else{
		
		LoadTable(url+"?pageNumber=" + prepage);
	}
	$("#pcurrentpage").val(prepage)
	e.preventDefault()
}); 

$(document).on('click','#pnext-page' , function(e){
	let nextpage = parseInt($("#pcurrentpage").val()) +1 
	let url = $(".main_content__body #geturl").data("value")
	
	if(nextpage >lastpage){
		toast({
	          title: "Thông báo",
	          message: "Trang bạn nhập không chính xác",
	          type: "error", //or success
	        });
		return false;
	}
	if(cateid != 0){
	 	url = "/product/get-by-ptype?pageSize=10&ptype=" + cateid+" &pageNumber=" + nextpage
	 	LoadTable(url);
	}
	else{
		
		LoadTable(url+"?pageNumber=" + nextpage);
	}
	$("#pcurrentpage").val(nextpage)
	e.preventDefault()
}); 

$(document).on('click','#plast-page' ,async function(e){
	//var lastpage;
	let url = $(".main_content__body #geturl").data("value")
	if(cateid != 0){
	 	url = "/product/get-by-ptype?pageSize=10&ptype=" + cateid+" &pageNumber=" + lastpage
	 	LoadTable(url);
	}
	else{
		
		LoadTable(url+"?pageNumber=" + lastpage);
	}
	$("#pcurrentpage").val(lastpage)
	e.preventDefault()
}); 

$(document).on('click', '.addcatebtn', function () {
	$('#addnewcategory').css('display', 'block')
})

$('#addnewcategory').on('click', '.close', function () {
	$('#addnewcategory').css('display', 'none')
})

$('#addnewcategory').on('click', '#addcate', function () {
	
	let d = $('#addnewcategory input').val()
	
	let data = {"ptypeName":d}
	fetch('http://localhost:8083/producttype/create', {
		  method: 'POST', // or 'PUT'
		  headers: {
		    'Content-Type': 'application/json',
		  },
		  body: JSON.stringify(data),
		})
		  .then((response) => response.json())
		  .then((data) => {
		    console.log('Success:', data);
		  })
		  .catch((error) => {
		    console.error('Error:', error);
		  });
	$('#addnewcategory').css('display', 'none')
	
})
		
	</script>
	
	
</body>
</html>