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
		<p hidden="true" id="geturl" data-value="/orders/get"></p>
		<p hidden="true" id="addurl" data-value="/customer/create"></p>
	    <p hidden="true" id="editurl" data-value="/customer/update"></p>
	    <p hidden="true" id="deleteurl" data-value="/customer/delete"></p>
	    
		<div class="main_content__body-title">
			<p>Danh sách đơn đặt hàng</p>
		</div>
		<table  class="table maintable">
        <thead>
            <tr>
            <th class="cbx-all" style="width:10px;"><input  type="checkbox" id="" name="" value=""></th>
            
            <th>Mã đơn hàng</th>
            <th>Tên khách hàng</th>
            <th>Ngày đặt</th>
            <th>Thanh toán</th>
            <th>Trạng thái</th>
            <th>Địa chỉ</th>
            <th>Người giao hàng</th>
            <th>Chi tiết đơn hàng</th>
            </tr>
        </thead>
        <tbody>
        
        </tbody>
    </table>
	</div>
	<div class="main_content__footer">
		<!-- <i class="fa-solid fa-arrows-rotate refreshbtn grow-btn-when-hover"></i> -->
		<!-- <i class="fa-solid fa-box next-status grow-btn-when-hover"></i> -->
		<button class="grow-btn-when-hover next-status">Xác nhận đơn hàng</button>
		<!-- <i class="fa-solid fa-people-carry-box handingbox grow-btn-when-hover"></i> -->
	</div>
	
	 
	 <div id="TblChooseObj" class="modal">
	  <div class="modal-content" style="width: 50vw">
	    <div class="modal-header">
	      <span class="close closex">&times;</span>
	      <h2>Chi tiết đặt hàng</h2>
	    </div>
	    <div class="modal-body">
	    	<table class="table subtable">
		        <thead>
		   			<tr>
		   				<th>Tên sản phẩm</th>
		   				<th>Số lượng</th>
		   				<th>Số tiền</th>
		   			</tr>
		        </thead>
		        <tbody>
		        
		        </tbody>
		    </table>
		    <div>
		    	<label style="
    font-size: 16px;
    font-size: 20px;
    float: right;
    margin: 20px;" id="TongTien" >Tổng:</label>
		    </div>
		    
	    	
	    </div>
	    <div class="modal-footer">
	    	
	    	
	      
	    </div>
	  </div>
	
	</div> 
	 
	<!-- function  -->
	<script type="text/javascript">
	function decoratetable(){
		let status = {
				"0":"đang chờ xác nhận",
				"1":"đã xác nhận",
				"2":"đang giao hàng",
				"3":"đã giao hàng",
				"4":"đã nhận hàng",
				"5":"đã hủy",
		}
		let tr = $('.maintable tbody tr')
    	tr.each(function () {
    		let colstt = $(this).children().eq(5)
    		colstt.data('originstatus', colstt.html())
			//console.log(colstt.data('originstatus') )
			
    		if(colstt.html() == 0  ){
    			colstt.css('color','red')
    		} else if(colstt.html() == 2 || colstt.html() == 1 ){
    			colstt.css('color','blue')
    		} else {
    			colstt.css('color','green')
    		}
    		colstt.html(status[colstt.html()])
		})
	}
	</script>
	
	<script src="<c:url value='/views/admin/js/table.js'/>"></script>
	<script type="text/javascript">
		let url = $(".main_content__body #geturl").data("value")
		
		LoadTable2(url);
		//setTimeout(() => {  LoadOrderStatus(); }, 100);
				
	
	</script>
	
	<script>
	function LoadOrderStatus(){
		let status = $('.maintable thead tr th').filter(function(){return $(this).html()=='status'})
		let index = $('.maintable thead tr th').index(status)
		let tr = $('.maintable tbody tr')
		for(let i = 0; i< tr.length; i++){
			console.log(tr.eq(i).find('td').eq(index).append(`<i class="fa-solid fa-forward"></i>`))
		}
		
	}
	
	//on append table trigger
	/* (function($) {

        var origAppend = $.fn.append;

        $.fn.append = function () {
            return origAppend.apply(this, arguments).trigger("append");
        };
    })(jQuery);

    $(".maintable").bind("append", function() {
    	await
    	let tr = $('.maintable tr')
    	tr.each(function () {
			console.log( $(this).children().length )
		})
    }); */

    //$("div").append("<span>");
	
	</script>
</body>
</html>