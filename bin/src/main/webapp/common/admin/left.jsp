<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<div class="navigation">
          <ul>
            <li class="list">
              <b></b>
              <b></b>
              <a href="<c:url value='/admin'/>" class=" item active">
                <span class="icon"><i class="fa-solid fa-house"></i></span>
                <span class="title">Trang chủ</span>
                <i class="fa-solid fa-angle-right dropdown"></i>
              </a>
              
            </li>
            <li class="list authentication-admin">
              <b></b>
              <b></b>
              <a class="sub-btn item ">
                <span class="icon"><i class="fa-solid fa-user"></i></i></span>
                <span class="title">Tài khoản</span>
                <i class="fa-solid fa-angle-right dropdown"></i>
              </a>
              
              <div class="sub-menu">
                <a href="<c:url value='/admin/user'/>" class="item sub-item">
                  Tài khoản
                </a>
                <a href="<c:url value='/admin/customer'/>" class="item sub-item">
                  Khách hàng
                </a>
                <a href="<c:url value='/admin/employee'/>" class="item sub-item">
                  Nhân viên
                </a>
                <%-- <a href="<c:url value=''/>" class="item sub-item">
                  Shipper
                </a> --%>
              </div>
            </li>
            
            <li class="list">
              <b></b>
              <b></b>
              <a class="sub-btn item">
                <span class="icon"><i class="fa-solid fa-laptop"></i></span>
                <span class="title">Sản phẩm & đơn hàng</span>
                <i class="fa-solid fa-angle-right dropdown"></i>
              </a>
              
              <div class="sub-menu">
                
                <a href="<c:url value='/admin/Product'/>" class="item sub-item">
                  Sản phẩm
                </a>
                <a href="<c:url value='/admin/order'/>" class="item sub-item">
                  Đơn hàng
                </a>
                <%-- <a href="<c:url value='admin/discount'/>" class="item sub-item">
                  Discount
                </a> --%>
                <a href="<c:url value='/admin/bill'/>" class="item sub-item">
                  Hóa đơn
                </a>
              </div>
            </li>
            
          </ul>
        </div>

        <div class="toggle">
          <i class="fa-solid fa-list open"></i>
          <i class="fa-solid fa-list close"></i>
        </div>
   
   
