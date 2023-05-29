<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SUNNY | Trang quản trị</title>


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
<script src="//code.jquery.com/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">



</head>
<body class="no-skin">
	<div class="app">
		<!-- header -->
		<%@ include file="/common/admin/header.jsp"%>
		<!-- header  -->


		<div class="main-container" id="main-container">
			<!-- sidebar -->
			<%@ include file="/common/admin/left.jsp"%>
			<!-- sidebar -->

			<div class="main_content">

				<h3 class="tlt">Line Chart</h3>
				<div >
					<canvas id="myChart"></canvas>
				</div>
				<script>
    let myChart = document.getElementById('myChart').getContext('2d');
    // Global Options
    Chart.defaults.global.defaultFontFamily = 'Lato';
    Chart.defaults.global.defaultFontSize = 18;
    Chart.defaults.global.defaultFontColor = '#777';

    let massPopChart = new Chart(myChart, {
      type:'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
      data:{
        labels:[<c:forEach items="${listuser}" var="item">'${item.createdAt}',</c:forEach>],
        datasets:[{
          label:'Population',
          data:[<c:forEach items="${listuser}" var="item">${item.point},</c:forEach>],
          backgroundColor:'green',
          
          borderWidth:1,
          borderColor:'#777',
          hoverBorderWidth:3,
          hoverBorderColor:'#000'
        }]
      },
      options:{
        title:{
          display:true,
          text:'Thống kê người dùng mới',
          fontSize:25
        },
        legend:{
          display:true,
          position:'right',
          labels:{
            fontColor:'#000'
          }
        },
        layout:{
          padding:{
            left:50,
            right:0,
            bottom:0,
            top:0
          }
        },
        tooltips:{
          enabled:true
        }
      }
    });
  </script>
			</div>
		</div>
	</div>

	<!-- script for action in page -->
	<script>
      // display active item
      let item = document.querySelectorAll(".item");
      let subitem = document.querySelectorAll(".sub-item");
      for (let i = 0; i < item.length; i++) {
        item[i].onclick = function () {
          
          let j = 0;
          let k =0;
          let list = document.querySelectorAll(".list");
          while (k < subitem.length) {
            
            subitem[k++].className = "sub-item";
          }
          while (j < list.length) {
            
            list[j++].className = "list";
          }
          item[i].closest(".list").className = "list active";
        };
      }
      
      for (let i = 0; i < subitem.length; i++) {
        subitem[i].onclick = function () {
          
          let j = 0;
          let k = 0;
          let list = document.querySelectorAll(".list");
          while (k < list.length) {
            
            list[k++].className = "list";
          }
          while (j < subitem.length) {
            
            subitem[j++].className = "sub-item";
          }
          subitem[i].className = "sub-item active";
          subitem[i].closest(".list").className  = "list active";
        };
      }

      // toggle on menu button
      
      let menuToggle = document.querySelector(".toggle");
      let navigation = document.querySelector(".navigation");
      let content = document.querySelector(".main_content");
      let menutoggleclick = function () {
        let subbtn  = document.querySelectorAll(".sub-btn");
        menuToggle.classList.toggle("active");
        navigation.classList.toggle("active");
        content.classList.toggle("active");
        //disable dropdown
        for(let i = 0; i < subbtn.length; i++ ){
          subbtn[i].classList.toggle("hover-btn")
        }


      };
      menutoggleclick();
      menuToggle.onclick = menutoggleclick;

      

      
    </script>
	<script>
      // show hide dropdown list
      $(document).ready(function(){
        $('.sub-btn').click(function(){
          if(!this.classList.contains("hover-btn")){
            $(this).next('.sub-menu').slideToggle();
            $(this).find('.dropdown').toggleClass('rotate')
          }
        })
      })
      
      test();
      function test() {
    	  $.get('/sunnyFE/account/getsession', function(ketqua) {
    		  let u = ketqua.user
    		  if(u == null || !(u.roleId.roleId == 3 || u.roleId.roleId == 1) ){
    			  window.location.href = "/sunnyFE/account/login";
    		  }
    		  if(u.roleId.roleId == 3){
    			  $('.authentication-admin').remove()
    		  }
    	  })
	}
      
      function checkfilter(o) {
		return false;
	}
      
      function formatmoney(n, currency) {
			
			const money = n.toString();
			return money.replace(/\B(?=(\d{3})+(?!\d))/g, ',') + currency;
			}
    </script>


</body>
</html>
