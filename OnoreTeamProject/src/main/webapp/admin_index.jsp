<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="./resources/admin/css/sidebars.css">
</head>
<body>
	
	<header class="navbar navbar-white sticky-top bg-white flex-md-nowrap p-0 shadow">
		<img class="navbar-brand col-md-2 col-lg-2 me-0 px-3 fs-6" src="./resources/admin/image/logo.png" alt="logo.png" />

		<div class="navbar-nav">
		  <div class="nav-item text-nowrap">
		    <a class="nav-link px-5" href="#">Sign out</a>
		  </div>
		</div>
	</header>
	
	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
	   <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
	     <span class="fs-5 fw-semibold">오노레 로고</span>
	   </a>
	   <ul class="list-unstyled ps-0">
	     <li class="mb-1">
	       <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
	         Home
	       </button>
	       <div class="collapse show" id="home-collapse">
	         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Updates</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Reports</a></li>
	         </ul>
	       </div>
	     </li>
	     <li class="mb-1">
	       <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
	         Dashboard
	       </button>
	       <div class="collapse" id="dashboard-collapse">
	         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Overview</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Weekly</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Monthly</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
	         </ul>
	       </div>
	     </li>
	     <li class="mb-1">
	       <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
	         Orders
	       </button>
	       <div class="collapse" id="orders-collapse">
	         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">New</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Processed</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Returned</a></li>
	         </ul>
	       </div>
	     </li>
	     <li class="border-top my-3"></li>
	     <li class="mb-1">
	       <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
	         Account
	       </button>
	       <div class="collapse" id="account-collapse">
	         <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">New...</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li>
	           <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Sign out</a></li>
	         </ul>
	       </div>
	     </li>
	   </ul>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>