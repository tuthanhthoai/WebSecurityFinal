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
				<style>
.maintable tr>*:nth-child(5) {
	display: none;
}
</style>
				<div class="main_content__body">
					<p hidden="true" id="geturl" data-value="/usermanagement/get"></p>
					<p hidden="true" id="addurl" data-value="/usermanagement/create"></p>
					<p hidden="true" id="editurl" data-value="/usermanagement/update"></p>
					<p hidden="true" id="deleteurl" data-value="/usermanagement/delete"></p>
					<p hidden="true" id="counturl"
						data-value="/usermanagement/count?table=User"></p>

					<div class="main_content__body-title">
						<p>
							Danh sách tài khoản người dùng <span class="showdeleted">
								<a>deleted: </a><input type="checkbox" id="showdeleted">
							</span>
						</p>

					</div>
					<table class="table maintable">
						<thead>
							<tr>
								<th class="cbx-all" style="width: 10px;"><input
									type="checkbox" id="" name="" value=""></th>
								<th>Last name</th>
								<th>First name</th>
								<th>Địa chỉ</th>
								<th>Email</th>
								<th>SĐT</th>
								<th>Point</th>
								<th>Active</th>
							</tr>
						</thead>
						<tbody>



							<c:forEach var="item" items="${listuser}">
								<tr class="odd gradeX">
									<td><input
									type="checkbox" id="" name="" value=""></td>

									<td>${item.firstName }</td>

									<td>${item.lastName }</td>
									<td>${item.addresses}</td>
									<td>${item.email}</td>
									<td>${item.phone}</td>
									<td>${item.point}</td>

								

								</tr>

							</c:forEach>

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
						<input id="currentpage" value=1> <a href="#"
							id="next-page"><i class="fa-solid fa-angle-right"></i></a> <a
							href="#" id="last-page"><i class="fa-solid fa-angles-right"></i></a>
					</div>
				</div>

				<div id="AddAndEdit" class="modal">


					<div class="modal-content">
						<div class="modal-header">
							<span class="close closex">&times;</span>
							<h2>Tài khoản</h2>
						</div>
						<div class="modal-body">


							<label>User ID:</label><input disabled name="userId"></br> <label>Tên
								tài khoản:</label><input class="toggledisable2" name="accountName"></br>
							<label>Mật khẩu:</label><input class="toggledisable2"
								type="password" name="password"></br> <label>Email:</label><input
								name="email"></br> <label>Số điện thoại:</label><input
								name="phone"></br> <label>Role:</label><input
								onkeydown="return false" class="obj" data-objkey=""
								data-objvalue="" id="roleId" name="roleId">
							<button data-inputid="roleId" data-url="/role/get"
								class="btnchooseobj">chọn</button>
							</br> <label>Enable:</label><select class="toggledisable" disabled
								name="enable">
								<option value="true">true</option>
								<option value="false">false</option>
							</select></br> <label>Deleted:</label><select class="toggledisable" disabled
								name="deleted">
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
						<div class="modal-footer"></div>
					</div>

				</div>


				<div id="FindRecord" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close closex">&times;</span>
							<h2>Modal Header</h2>
						</div>
						<div class="modal-body">

							<select name="Field">
								<option value="userId">userId</option>
								<option value="accountName">accountName</option>
								<option value="email">email</option>
							</select><input name="findrecord" id="findrecord" class="findrecord"
								placeholder="dữ liệu muốn tìm">

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
					$('.viewbtn')
							.click(
									function() {
										console
												.log($('.maintable .cbx-row :checkbox:checked:last'))
									});

					$("#find").click(
							function() {
								let url = $(".main_content__body #geturl")
										.data("value")
								let field = $("select[name=Field]").val()
								let search = $("input[name=findrecord]").val()

								//alert(field)
								alert(url)
								FilterTable(url, field, search);
							})
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
			item[i].onclick = function() {

				let j = 0;
				let k = 0;
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
			subitem[i].onclick = function() {

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
				subitem[i].closest(".list").className = "list active";
			};
		}

		// toggle on menu button

		let menuToggle = document.querySelector(".toggle");
		let navigation = document.querySelector(".navigation");
		let content = document.querySelector(".main_content");
		let menutoggleclick = function() {
			let subbtn = document.querySelectorAll(".sub-btn");
			menuToggle.classList.toggle("active");
			navigation.classList.toggle("active");
			content.classList.toggle("active");
			//disable dropdown
			for (let i = 0; i < subbtn.length; i++) {
				subbtn[i].classList.toggle("hover-btn")
			}

		};
		menutoggleclick();
		menuToggle.onclick = menutoggleclick;
	</script>
	<script>
		// show hide dropdown list
		$(document).ready(function() {
			$('.sub-btn').click(function() {
				if (!this.classList.contains("hover-btn")) {
					$(this).next('.sub-menu').slideToggle();
					$(this).find('.dropdown').toggleClass('rotate')
				}
			})
		})

		test();
		function test() {
			$.get('/sunnyFE/account/getsession', function(ketqua) {
				let u = ketqua.user
				if (u == null
						|| !(u.roleId.roleId == 3 || u.roleId.roleId == 1)) {
					window.location.href = "/sunnyFE/account/login";
				}
				if (u.roleId.roleId == 3) {
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
