<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

int companyId = (Integer) session.getAttribute("companyId");
session.setAttribute("companyId", companyId);

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Navigator - Point Purchase</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
.custom-bg {
	background-color: #C1C1EB;
}

</style>
 <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
</head>
<body class="bg-gray-100 pb-6 px-6">
<div class="px-4  ml-5 w-fit h-fit ">
		<a href="/Final_JN/">
            <h6 class="text-base font-medium"> 
            <i class="fa-solid fa-arrow-left"> </i>Back</h6>
        </a>
</div>
	<div class=" max-w-2xl mx-auto custom-bg rounded-lg py-4">
		<div class="text-center text-black font-bold">Your Point</div>
		<c:forEach var="cp" items="${company_points}">
			<div class="flex justify-center items-center mt-2">
				<svg class="w-4 h-4 text-red-500 mr-1" fill="currentColor"
					viewBox="0 0 20 20">
	                <path
						d="M10 15l-5.5 3 1.5-5.8L1 7.3l5.9-.5L10 2l2.1 4.8 5.9.5-5 4.9 1.5 5.8z" />
	            </svg>
				<span
					class="inline-flex items-center bg-white rounded-full px-3 py-1 text-purple-600 font-semibold">

					${cp.pointsBalance} Points </span>
			</div>
			<div
				class="bg-black text-white text-sm mt-2 py-1 px-4 flex justify-between">
				<span class="ml-10">Latest Update</span> <span class="mr-10"><fmt:formatDate value="${cp.lastUpdated}" pattern="dd MMMM, yyyy HH:mm:ss" var="formattedDate" />
        	    <p>${formattedDate}</p></span>
			</div>
		</c:forEach>
	</div>
	<div class="flex items-center justify-center">
		<div class="mt-5 flex flex-col items-center">
			<svg xmlns="http://www.w3.org/2000/svg"
				class="w-6 h-6 text-red-500 mb-2" viewBox="0 0 576 512">
				<!-- Font Awesome icon -->
				<path
					d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96zM252 160c0 11 9 20 20 20l44 0 0 44c0 11 9 20 20 20s20-9 20-20l0-44 44 0c11 0 20-9 20-20s-9-20-20-20l-44 0 0-44c0-11-9-20-20-20s-20 9-20 20l0 44-44 0c-11 0-20 9-20 20z" /></svg>
			<span class="text-black text-sm font-semibold">Purchase Points</span>
			<span class="text-gray-600 text-xs mt-2">Select the number of
				coins you want to purchase</span>

		</div>
	</div>

	<div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-6 ml-9 mr-9">
		<c:forEach var="pointPackage" items="${point_packages}">
			<a href="/Final_JN/point_purchase/payment/${pointPackage.packageId}">
				<button 
					class="border border-gray-800 rounded-lg p-4 mb-2 cursor-pointer hover:bg-purple-500 transition-colors duration-100 w-full text-left group">
					<div class="flex justify-between items-center">
						<div
							class="flex justify-between items-center ml-5 group-hover:text-white">
							<svg class="w-4 h-4 text-current mr-1" fill="currentColor"
								viewBox="0 0 20 20">
	                        <path
									d="M10 15l-5.5 3 1.5-5.8L1 7.3l5.9-.5L10 2l2.1 4.8 5.9.5-5 4.9 1.5 5.8z" />
	                    </svg>
							<span
								class="text-black text-lg font-semibold ml-7 group-hover:text-white">${pointPackage.points}
								Points</span>
						</div>

						<div
							class="text-gray-700 flex justify-center items-center group-hover:text-white">
							<div class="flex flex-col items-center">
								<span class="text-xs font-semibold">Buy Now</span> <span
									class="text-xs font-semibold">${pointPackage.cost} MMK</span>
							</div>
							<div class="ml-5 group-hover:text-white">
								<svg xmlns="http://www.w3.org/2000/svg"
									class="w-7 h-5 text-current" fill="currentColor"
									viewBox="0 0 576 512">
	                            <path
										d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
	                        </svg>
							</div>
						</div>
					</div>
				</button>
			</a>
		</c:forEach>


	</div>




</body>
</html>
