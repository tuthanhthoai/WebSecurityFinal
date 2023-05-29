var rootURL = "http://localhost:8083";
var execUrl;
var execType;
var filter = 0;
var gsearch;
var gfield;
//paging
var lastpage;
let counturl = $(".main_content__body #counturl").data("value")
getmaxpage()
function getmaxpage(){
	let url = counturl
	if($("#showdeleted").prop("checked") ){
		url = url + "&viewdeleted=1"
	}
	fetch(rootURL + url)
		  .then((response) => response.json())
		  .then((data) =>{
			lastpage =  parseInt( (parseInt(data)-1) / 10 )+1 
			//console.log(lastpage)
	}) 
	
}

// get data
function LoadTable(url="",type="GET",data={}) {
		
			if(url.includes("?")){
				if($("#showdeleted").prop("checked") ){
					url = url + "&viewdeleted=1"
				}
			}
			else{
				if($("#showdeleted").prop("checked") ){
					url = url + "?viewdeleted=1"
				}
			}
		
			$.ajax({
				url : rootURL+url,
				type : type,
				data:data,
				dataType: "json",
				
				success : function(result) {
					//$('.maintable thead tr').remove()
					$('.maintable tbody tr').remove()
					var keys = Object.keys(result[0])
					var keyslength = keys.length
					
					
					
					//$('.maintable thead').append(`<tr></tr>`)
					//$('.maintable thead tr').append(`<th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>`)
					//$('.maintable thead tr').append(`<th></th>`)
					
					for (var i = 0; i<keyslength; i++){
						// nếu là 1 object {} thì đổi tên thành trường thứ 2(index = 1) của object 
						if(typeof result[0][keys[i]] === 'object' && result[0][keys[i]] !== null){
							//$('.maintable thead tr').append(`<th>${keys[i]}</th>`)
							//$('.maintable thead tr').append(`<th>${Object.keys(result[0][keys[i]])[1]}</th>`)
						}
						else {
							//$('.maintable thead tr').append(`<th>${keys[i]}</th>`)
						}
						
						//$('#AddAndEdit .modal-body').append(`<label >${keys[i]}</label><input name="${keys[i]}"></br>`)
					}
		
					for (var i = 0; i <result.length ; i++) { 
						if( checkfilter(result[i]) == true ){
							continue
						}
						$('.maintable tbody').append(`<tr></tr>`)
						$('.maintable tbody tr').last().append(`<td class="cbx-row" style="width:10px;"><input  type="checkbox" id="" name="" value=""></td>`)
						$('.maintable tbody tr').last().append(`<td style="width:70px;" ><i class="fa-solid fa-pen-to-square edit-row grow-btn-when-hover"></i><i class="fa-solid fa-trash delete-row grow-btn-when-hover"></i></td>`)
						for (var j = 0; j<keyslength; j++){
							//nếu là object thì sẽ hiện thị name thay vì là id, thêm nút khi hover  sẽ hiện đầy đủ thông tin
							if(typeof result[i][keys[j]] === 'object' && result[i][keys[j]] !== null ){
								var p = `<a class="contentheader" >Foreign key info</a>`;
								
								for(var z = 0; z < Object.keys(result[i][keys[j]]).length; z++ ){
									let key = Object.keys(result[i][keys[j]])[z]
									let data = result[i][keys[j]][key]
									if(typeof data === 'object' && data !== null){
										data= data[Object.keys(data)[0]]
									}
									p = p + `<a class="key">${key}</a>: <a class="data">${data}</a> </br></br>`
									
								}
								let subobject = result[i][keys[j]]
								$('.maintable tbody tr').last().append(`<td name="${keys[j]}" data-objectkey="${Object.keys(subobject)[0]}" data-objectvalue=${subobject[Object.keys(subobject)[0]]}>
								<div class="viewobj">
								      <div class="showobj">
								      	<div class="content">${p}</div>
								        
								      </div>
								    </div>
								${result[i][keys[j]][Object.keys(result[i][keys[j]])[1]]}
								</td>`)
							}
							else //không phải là object
							{
								$('.maintable tbody tr').last().append(`<td name="${keys[j]}" >${result[i][keys[j]]}</td>`)
								
							}
						}	
					}
					getmaxpage();
					decoratetable();
					

				},
				error : function(error) {
					
					toast({
			          title: "ERROR",
			          message: "An error occur!",
			          type: "error", //or success
			        });
				}
			});
		}
//create, update, delete data
function EditTable(url="",type="POST",data={}) {
	var status;
	console.log(data)
	fetch(rootURL+url, {
	  method: type, // or 'PUT'
	  headers: {
	    'Content-Type': 'application/json',
	  },
	  body: JSON.stringify(data),
	})
	.then((response) =>{ 
		status = response.status
		
		return response.text()
		})
	  .then((data) => {
		
		if(status == 200){
			toast({
	          title: "SUCCESS",
	          message: "oke",
	          type: "success", //or success
	        });
			//console.log('Success:', data)
		
			let url = $(".main_content__body #geturl").data("value")
			
			let curpage = parseInt($("#currentpage").val())
			
			LoadTable(url+"?pageNumber=" + curpage);
			getmaxpage()
		}
	    else{
		toast({
	          title: "ERROR",
	          message: "An error occur!",
	          type: "error", //or success
	        });
			
		}
	   
	  })
	  .catch((error) => {
		toast({
	          title: "ERROR",
	          message: "An error occur!",
	          type: "error", //or success
	        });
	    console.error('Error:', error);
	  });
	/*.then((response) =>{ 
		
		status = response.status
		console.log(status)
		return response.json()
	 
	})
	.then((data) => {
		console.log('qw')
		console.log(status)
		if(status == 200){
			console.log('Success:', data)
			
			let url = $(".main_content__body #geturl").data("value")
			
			let curpage = parseInt($("#currentpage").val())
			
			LoadTable(url+"?pageNumber=" + curpage);
		}
	    else{
			
		}
	   
	  })
	  .catch((error) => {
	   
	  });
	 /* .then((response) => 
	  {
		if(response.status == 200){
			
		}
		else{
			
		}
	})
	.catch((error) => {
	    
	   
	  });*/
	  
	  
};

//array to object
/*function ToObject(Name,Data){
			//
			if(Name.length == Data.length && Name.length > 0){
				var o = {}
				for(var i in Name){
					o[Name[i]] = Data[i];
				}
				return o;
			}
			return false
		}	*/
		
$("table").on("click", ".edit-row", function (e) {
	execUrl = $(".main_content__body #editurl").data("value")
	execType = "PUT"
	$(".modal-body .toggledisable").prop('disabled', false);
	$(".modal-body .toggledisable2").prop('disabled', true);
    
    let row = $(this).closest('tr');
   // var keys = $('thead tr').find("th");
    //let test = $(row).find("td[name='user']");
    //let td = $(row).find("td");
    
	let inp = $('#AddAndEdit .modal-body input');
	let sel = $('#AddAndEdit .modal-body select');
	let inpobj = $('#AddAndEdit .modal-body input.obj');
    for(let i = 0;i< inp.length ; i++){
		let name = $(inp).eq(i).attr("name")
		$(inp).eq(i).val($(row).find("td[name=" + name+"]").eq(0).html())
	}
	for(let i = 0;i< sel.length ; i++){
		let name = $(sel).eq(i).attr("name")
		
		$(sel).eq(i).val($(row).find("td[name=" + name+"]").eq(0).html())
	}
	for(let i = 0;i< inpobj.length ; i++){
		let name = $(inpobj).eq(i).attr("name")
		//console.log($(row).find("td[name=" + name+"]").eq(0).data('userid'))
		$(inpobj).eq(i).val($(row).find("td[name=" + name+"]").eq(0).data('objectvalue'))
		$(inpobj).eq(i).data("objkey", ($(row).find("td[name=" + name+"]").eq(0).data('objectkey')) )
		$(inpobj).eq(i).data("objvalue",($(row).find("td[name=" + name+"]").eq(0).data('objectvalue')))
	}
	$('#AddAndEdit').css("display", "block");
	
	$('#AddAndEdit #type').attr('data-value','PUT');
  
});

$(".main_content").on("click", ".addbtn", function (e) {
	execUrl = $(".main_content__body #addurl").data("value")
	execType = "POST"
	$('#AddAndEdit').css("display", "block");	
})

$(".main_content").on("click", ".refreshbtn", function (e) {
	let url = $(".main_content__body #geturl").data("value")
	let curpage = parseInt($("#currentpage").val())
	LoadTable(url+"?pageNumber=" + curpage);
})

$(".main_content").on("click", ".findbtn", function (e) {
	
	$('#FindRecord').css("display", "block")
})

$(".main_content").on("click", ".next-status", function (e) {
	$('.maintable .cbx-row input[type=checkbox]').each(function (index) {
		if(this.checked){
			let obj = {};
			obj['status'] = (parseInt($(this).closest('tr').find('td').eq(5).data('originstatus')) + 1)
			obj['orderId'] = $(this).closest('tr').find('td').eq(1).html()
			if(obj['status']!=1 ){
				toast({
		          title: "Thông báo",
		          message: "Đơn hàng đã được xác nhận!",
		          type: "error", //or success
		        });
				return false;
			}
			
			fetch(rootURL+ '/orders/update', {
			  method: 'PUT',
			  headers: {
			    'Content-Type': 'application/json',
			  },
			  body: JSON.stringify(obj),
			})
			  .then((response) => response.json())
			  .then((data) => {
			    console.log('Success:', data);
			    let url = $(".main_content__body #geturl").data("value")
		
				LoadTable2(url);
			  })
			  .catch((error) => {
			    console.error('Error:', error);
			  });
			//EditTable("/orders/update","PUT", obj)
			return false;
		}
    });
})


$(".main_content").on("click", ".handingbox", function (e) {
	$('.maintable .cbx-row input[type=checkbox]').each(function (index) {
		if(this.checked){
			let obj = {};
			obj['status'] = (parseInt($(this).closest('tr').find('td').eq(5).data('originstatus')) + 1)
			obj['orderId'] = $(this).closest('tr').find('td').eq(2).html()
			if(obj['status']!=3 ){
				toast({
		          title: "Cảnh báo",
		          message: "Cần có đơn hàng có trạng thái chưa giao!",
		          type: "error", //or success
		        });
				return false;
			}
			//let newobj = {"orderId": 4,"status": 5}
			//console.log(obj)	
			EditTable("/orders/update","PUT", obj)
			//return false;
		}
    });
})


$(".main_content").on("click", ".deliver", function (e) {
	$('.maintable .cbx-row input[type=checkbox]').each(function (index) {
		if(this.checked){
			let obj = {};
			obj['status'] = (parseInt($(this).closest('tr').find('td').eq(5).data('originstatus')) + 1)
			obj['orderId'] = $(this).closest('tr').find('td').eq(2).html()
			if(obj['status']== 2 ){
				EditTable("/orders/update","PUT", obj)
			}
			else{
				
				toast({
		          title: "Cảnh báo",
		          message: "Đơn hàng đã có người khác nhận",
		          type: "error", //or success
		        });
				return false;
			}
			//let newobj = {"orderId": 4,"status": 5}
			//console.log(obj)	
			
		}
    });
})


$(".main_content__footer").on("click", ".delete-multi-row", function (e) {
	
	let row = $('.main_content tbody tr')
	row.each(function(){
		//console.log(this)
		let td = $(this).find('td')
		if($(this).find('input[type=checkbox]').prop('checked') == true ){
			console.log('reue')
			let obj = {}
			obj[td.eq(2).attr("name")] = td.eq(2).html() 
			EditTable($(".main_content__body #deleteurl").data("value"),"DELETE",obj)
		}
	})
})

$(".main_content").on("click", ".delete-row", function (e) {
	let row = $(this).closest('tr');
	let td = row.find('td')
	let obj = {}
	/*
	for(let i = 2; i < td.length; i++){
		obj[td.eq(i).attr("name")] = td.eq(i).html() 
	}*/
	
	obj[td.eq(2).attr("name")] = td.eq(2).html() 
	
	console.log($(".main_content__body #deleteurl").data("value"))
	console.log(obj)
	EditTable($(".main_content__body #deleteurl").data("value"),"DELETE",obj)
})

$("#AddAndEdit").on("click", "#oke", function (e) {
	if(!window.confirm("Save data?")){
		return false;
	}
	
	let inp = $('#AddAndEdit .modal-body input');
	let sel = $('#AddAndEdit .modal-body select');
	let inpobj = $('#AddAndEdit .modal-body input.obj');
	//console.log(inp.length)
	//console.log(sel.length)
	let obj = {}
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
	//console.log(obj)
	EditTable(execUrl,execType,obj) 
		
	
});  

$("#AddAndEdit").on("click", ".close", function (e) {
	resetInput();
	$('#AddAndEdit').css("display", "none");
	$(".modal-body .toggledisable").prop('disabled', true);
	$(".modal-body .toggledisable2").prop('disabled', false);
	//console.log($('.maintable thead tr').length)
});

$("#TblChooseAttr").on("click", ".close-a", function (e) {
	$('#TblChooseAttr').css("display", "none");
});


$("#TblChooseObj").on("click", ".close", function (e) {
	$('#TblChooseObj').css("display", "none");
});

function resetInput(){
	let inp = $('#AddAndEdit .modal-body input');
	let sel = $('#AddAndEdit .modal-body select');
	for(let i = 0;i< inp.length ; i++){
		$(inp).eq(i).val("")
	}
	for(let i = 0;i< sel.length ; i++){
		sel[i].selectedIndex = 0;
	}
}

//check box
$('.maintable').on('change', '.cbx-all :checkbox', function() {
    if (this.checked) {
    	$('.maintable .cbx-row input[type=checkbox]').each(function () {
    	    $(this).prop('checked', true);
    	    
    	});
    } else {
    	$('.maintable .cbx-row input[type=checkbox]').each(function () {
    	    $(this).prop('checked', false);
    	});
    }
});
$('.maintable').on('change', '.cbx-row :checkbox', function(e) {
	
    if (!this.checked) {
    	$('.maintable .cbx-all input[type=checkbox]').prop('checked', false);
    }
});
$('.maintable').on('click', '.cbx-row :checkbox', function(e) {
	
    if (!this.checked) {
    	$(this).prop('checked', true);
    }
    else{
		$(this).prop('checked', false);
	}
});


// button clic=>show sub table for table have foeign key
$("#AddAndEdit").on("click", ".btnchooseobj", function (e) {
	/* console.log($(this).data("url"))
	console.log($(this).data("inputid")) */
	let inputId = $(this).data("inputid")
	
	$.ajax({
		url : "http://localhost:8083"+$(this).data("url"),
		type : "GET",
		dataType: "json",				
		success : function(result) {
			var keys = Object.keys(result[0])
			var keyslength = keys.length
			
			$('.subtable thead tr').remove()
			$('.subtable tbody tr').remove()
			$('.subtable p').remove()
			$('.subtable').append(`<p hidden id="inputId">${inputId}</p>`)
			$('.subtable thead').append(`<tr></tr>`)
			$('.subtable thead tr').append(`<th></th>`)
			
			for (var i = 0; i<keyslength; i++){
				$('.subtable thead tr').append(`<th>${keys[i]}</th>`)
			}

			for (var i = 0; i <result.length ; i++) { 
				$('.subtable tbody').append(`<tr></tr>`)
				$('.subtable tbody tr').last().append(`<td style="width:70px;" ><button class="btnsubmit" >chọn</button></td>`)
				
				for (var j = 0; j<keyslength; j++){
					if(typeof result[i][keys[j]] === 'object' && result[i][keys[j]] !== null ){
						let objdata = result[i][keys[j]]
						$('.subtable tbody tr').last().append(`<td name="${keys[j]}" >${objdata[Object.keys(objdata)[0]]}</td>`)					
					}
					else{
						
						$('.subtable tbody tr').last().append(`<td name="${keys[j]}" >${result[i][keys[j]]}</td>`)
					}
				}	
			}
			$('#TblChooseObj').css("display", "block");
		},
		error : function(error) {
			toast({
	          title: "ERROR",
	          message: "An error occur!",
	          type: "error", //or success
	        });
		}
	});
});

$("#TblChooseObj").on("click", "button.btnsubmit", function (e) {
	let inputId = $('.subtable #inputId').html();
	let input = $("input.obj#"+inputId)
	
	input.data("objkey",$(".subtable thead tr th").eq(1).html())
	input.data("objvalue", $(this).closest('tr').find('td').eq(1).html())
	input.val($(this).closest('tr').find('td').eq(1).html())
	
	$('#TblChooseObj').css("display", "none");
	
});

//on change page number 
$(document).on('change','#currentpage' , function(e){
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
	LoadTable(url+"?pageNumber=" + curpage);
}); 


$(document).on('click','#first-page' , function(e){
	
	$("#currentpage").val(1)
	
	let url = $(".main_content__body #geturl").data("value")
	let curpage = $(this).val()
	LoadTable(url+"?pageNumber=" + curpage);
}); 

$(document).on('click','#pre-page' , function(e){
	let prepage = parseInt($("#currentpage").val()) -1 
	if(prepage < 1){
		toast({
	          title: "Thông báo",
	          message: "Trang bạn nhập không chính xác",
	          type: "error", //or success
	        });
		return false;
	}
	
	$("#currentpage").val(prepage)
	
	let url = $(".main_content__body #geturl").data("value")
	
	LoadTable(url+"?pageNumber=" + prepage);
}); 

$(document).on('click','#next-page' , function(e){
	let nextpage = parseInt($("#currentpage").val()) +1 
	let url = $(".main_content__body #geturl").data("value")
	
	if(nextpage >lastpage){
		toast({
	          title: "Thông báo",
	          message: "Trang bạn nhập không chính xác",
	          type: "error", //or success
	        });
		return false;
	}
	
	$("#currentpage").val(nextpage)	
	LoadTable(url+"?pageNumber=" + nextpage);
}); 

$(document).on('click','#last-page' ,async function(e){
	//var lastpage;
	let url = $(".main_content__body #geturl").data("value")
	//let counturl = $(".main_content__body #counturl").data("value")
	/*await fetch(rootURL + counturl)
	  .then((response) => response.json())
	  .then((data) =>{
		lastpage =  parseInt(parseInt(data) / 10 )+1 
		console.log(lastpage)
	}) */
	//console.log(lastpage)
	$("#currentpage").val(lastpage)
	LoadTable(url+"?pageNumber=" + lastpage);
}); 


$('.maintable').on('click','tbody tr' ,function(e){
	
	let row = $(this).find('input:checkbox');
	if($(row).prop('checked'))
	{
		$(row).prop('checked', false);
	}
	else{
		$(row).prop('checked', true);
	}
	
}); 

$(document).on('change', '#showdeleted', function(e){
	let url = $(".main_content__body #geturl").data("value")
	//let curpage = parseInt($("#currentpage").val())
	LoadTable(url+"?pageNumber=1");
})


$("#FindRecord").on('click', '.close', function () {
		$("#FindRecord").css("display", "none")
	})

	




function FilterTable(url="",field, search, pagenum = 1) {
		filter = 1;
		gfield = field;
		gsearch= search;
		
		url = url + (url.includes("?"))?"?":"&";

		url = url + $("#showdeleted").prop("checked")?"viewdeleted=1":"viewdeleted=0"
			
			url = url + "&pageNumber=0"
			
			$.ajax({
				url : rootURL+url,
				type : "GET",
				dataType: "json",
				
				success : function(result) {
					console.log(result)
					$('.maintable thead tr').remove()
					$('.maintable tbody tr').remove()
					var keys = Object.keys(result[0])
					var keyslength = keys.length
					
					$('.maintable thead').append(`<tr></tr>`)
					$('.maintable thead tr').append(`<th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>`)
					$('.maintable thead tr').append(`<th></th>`)
					
					for (var i = 0; i<keyslength; i++){
						// nếu là 1 object {} thì đổi tên thành trường thứ 2(index = 1) của object 
						if(typeof result[0][keys[i]] === 'object' && result[0][keys[i]] !== null){
							$('.maintable thead tr').append(`<th>${keys[i]}</th>`)
							//$('.maintable thead tr').append(`<th>${Object.keys(result[0][keys[i]])[0]}</th>`)
						}
						else {
							$('.maintable thead tr').append(`<th>${keys[i]}</th>`)
						}
						
						//$('#AddAndEdit .modal-body').append(`<label >${keys[i]}</label><input name="${keys[i]}"></br>`)
					}
		
					for (var i = 0; i <result.length ; i++) { 
						$('.maintable tbody').append(`<tr></tr>`)
						$('.maintable tbody tr').last().append(`<td class="cbx-row" style="width:10px;"><input  type="checkbox" id="" name="" value=""></td>`)
						$('.maintable tbody tr').last().append(`<td style="width:70px;" ><i class="fa-solid fa-pen-to-square edit-row grow-btn-when-hover"></i><i class="fa-solid fa-trash delete-row grow-btn-when-hover"></i></td>`)
						for (var j = 0; j<keyslength; j++){
							//nếu là object thì sẽ hiện thị name thay vì là id, thêm nút khi hover  sẽ hiện đầy đủ thông tin
							if(typeof result[i][keys[j]] === 'object' && result[i][keys[j]] !== null ){
								var p = `<a class="contentheader" >Foreign key info</a>`;
								
								for(var z = 0; z < Object.keys(result[i][keys[j]]).length; z++ ){
									let key = Object.keys(result[i][keys[j]])[z]
									let data = result[i][keys[j]][key]
									if(typeof data === 'object' && data !== null){
										data= data[Object.keys(data)[0]]
									}
									p = p + `<a class="key">${key}</a>: <a class="data">${data}</a> </br></br>`
									
								}
								let subobject = result[i][keys[j]]
								$('.maintable tbody tr').last().append(`<td name="${keys[j]}" data-objectkey="${Object.keys(subobject)[0]}" data-objectvalue=${subobject[Object.keys(subobject)[0]]}>
								<div class="viewobj"><i class="fa-solid fa-eye viewobj"></i>
								      <div class="showobj">
								      	<div class="content">${p}</div>
								        
								      </div>
								    </div>
								${result[i][keys[j]][Object.keys(result[i][keys[j]])[0]]}
								</td>`)
							}
							else //không phải là object
							{
								$('.maintable tbody tr').last().append(`<td name="${keys[j]}" >${result[i][keys[j]]}</td>`)
								
							}
						}	
					}
					decoratetable();

				},
				error : function(error) {
					toast({
			          title: "ERROR",
			          message: "An error occur!",
			          type: "error", //or success
			        });
				}
			});
		}
		
		
		function LoadTable2(url="",type="GET",data={}) {
		
		
			$.ajax({
				url : rootURL+url,
				type : type,
				data:data,
				dataType: "json",
				
				success : function(result) {
					//$('.maintable thead tr').remove()
					$('.maintable tbody tr').remove()
					var keys = Object.keys(result[0])
					var keyslength = keys.length
					
		
					for (var i = 0; i <result.length ; i++) { 
							let shipname = '';
							if(result[i].shipId != null){
								shipname = result[i].shipId.name
							}
							$('.maintable tbody').append(`<tr></tr>`)
							$('.maintable tbody tr').last().append(`<td class="cbx-row" style="width:10px;"><input  type="checkbox" id="" name="" value=""></td>`)
							
							$('.maintable tbody tr').last().append(`<td  >${result[i].orderId}</td>`)
							$('.maintable tbody tr').last().append(`<td >${result[i].cusId.name}</td>`)
							$('.maintable tbody tr').last().append(`<td  >${result[i].OrderDate}</td>`)
							$('.maintable tbody tr').last().append(`<td  >${result[i].paymentMethod.method}</td>`)
							$('.maintable tbody tr').last().append(`<td  >${result[i].status}</td>`)
							$('.maintable tbody tr').last().append(`<td  >${result[i].shipAddress}</td>`)
							$('.maintable tbody tr').last().append(`<td  >${shipname}</td>`)
							$('.maintable tbody tr').last().append(`<td><button data-orderid=${result[i].orderId} class="showorderdetail" >xem</button></td>`)
						}
					getmaxpage();
					decoratetable();
				},
				error : function(error) {
					toast({
			          title: "ERROR",
			          message: "An error occur!",
			          type: "error", //or success
			        });
				}
			});
		}
		
$(document).on('click', '.showorderdetail', function(){
	let id = $(this).data('orderid')
	
	
	$.ajax({
		url : "http://localhost:8083/orderdetail/get-all-order-detail?orderid=" + id,
		type : "GET",
		dataType: "json",				
		success : function(result) {
			console.log(result)
			//var keys = Object.keys(result[0])
			//var keyslength = keys.length
			$('#TblChooseObj').css("display", "block");
			
			$('.subtable tbody tr').remove()
			let tong = 0;
			for (var j = 0; j<result.length; j++){
				console.log(result[j])
				tong = tong + parseInt(result[j].productId.price)
				console.log(tong)
				let mn = formatmoney(result[j].productId.price, " đ")
				$('.subtable tbody').append(`<tr></tr>`)
				$('.subtable tbody tr').last().append(`<td>${result[j].productId.pname}</td>`)
				$('.subtable tbody tr').last().append(`<td>${result[j].quantity}</td>`)
				$('.subtable tbody tr').last().append(`<td>${mn}</td>`)
			}
			tong = formatmoney(tong, " đ")
			$('#TongTien').html('Tổng: ' + tong)	
			
			$('#TblChooseObj').css("display", "block");
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