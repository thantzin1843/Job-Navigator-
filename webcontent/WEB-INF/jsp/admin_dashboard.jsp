<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.lang.Integer" %>
<%
    // Retrieve the session attribute
    Integer adminId = (Integer) session.getAttribute("admin_id");

    if (adminId != null) {
       
        
       
    } else {
       
    	response.sendRedirect("login");
    }
    
    
%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Job Navigator</title>

<script src="https://cdn.tailwindcss.com"></script>
<script>
	tailwind.config = {
		theme : {
			extend : {
				width : {
					'custom-xsm' : '3rem',
					'custom-sm' : '8rem',
					'custom-md' : '12rem',
					'custom-lg' : '16rem',
					'custom-xl' : '20rem',
				},
				height : {
					'custom-xsm' : '3rem',
					'custom-sm' : '8rem',
					'custom-md' : '12rem',
					'custom-lg' : '16rem',
					'custom-xl' : '20rem',
				},
				screens : {
					'sm' : '640px',
					'md' : '768px',
					'lg' : '1024px',
					'xl' : '1280px',
					'2xl' : '1536px',
				},
			},
			fontFamily : {
				cabin : [ 'Cabin', 'sans-serif' ],
			},
		}

	}
	
</script>


<script>
	window.onload = function() {
		
		function updateClock() {
	        var CDate = new Date();
	        var NewDate = CDate.toDateString();
	        NewDate = NewDate + " - " + CDate.toLocaleTimeString();
	        document.getElementById('ct').innerHTML = NewDate;
	    }

	    function startClock() {
	        updateClock(); // Update the clock immediately
	        setInterval(updateClock, 1000); // Update the clock every second
	    }

	    // Start the clock
	    startClock();
	    
		var jobSeekerPercentage = parseFloat("${jobSeekerPercentage}");
		var companyPercentage = parseFloat("${companyPercentage}");
		console.log(jobSeekerPercentage);
		console.log(companyPercentage);

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			theme : "light2",
			title : {
				text : ""
			},
			data : [ {
				type : "pie",

				startAngle : 240,
				yValueFormatString : "##0.00\"%\"",
				indexLabel : "{label} {y}",
				dataPoints : [ {
					y : jobSeekerPercentage,
					label : "JobSeekers",
					color : "#36A2EB"
				}, {
					y : companyPercentage,
					label : "Companies",
					color : "#FF6384"
				},

				]
			} ]
		});
		chart.render();

		
	}
	
</script>



<!--cabin font-->
<link href='https://fonts.googleapis.com/css?family=Cabin'
	rel='stylesheet'>
<!--icons-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
@media ( max-width : 850px) {
	.container {
		min-width: 800px;
	}
}

.hover-bg-opacity:hover {
	background-color: rgba(193, 193, 235, 0.74);
	cursor: pointer;
}

.active {
	background-color: rgba(193, 193, 235, 0.74);
	cursor: pointer;
}

.hide-scrollbar::-webkit-scrollbar {
	scrollbar-width: none;
	-ms-overflow-style: none;
}

.text-gold {
	color: #f0dc00;
}

.text-gray {
	color: #8a8a8a;
}
</style>
</head>
<%
String contextPath = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
%>
<body class="font-cabin bg-[#F6F3F3]" >
	<div class="container max-w-screen-xl mx-auto p-2 h-screen">
		<div class="w-full h-72 bg-[#9696E8] rounded relative">
			<div class="w-full px-6 pt-6 absolute flex gap-3">
				<!-- nav panel -->
				<div
					class=" bg-[#FFFFFF] opacity-90 w-56 h-fit p-3 rounded-lg flex-col justify-center gap-2 shadow-md sticky">
					<div class="flex items-center justify-center">
						<img src="<%=contextPath%>/resources/images/logo.png"
							class="w-32 h-20">
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 active rounded">
						<a href="admin_dashboard"> <i class="fa-solid fa-house"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">Dashboard</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
						<a href="adminaccounts"> <i class="fa-solid fa-users"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">User Accounts</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
						<a href="adminReviews"> <i class="fa-solid fa-comment"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">View Reviews</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
						<a href="adminPayment"> <i
							class="fa-solid fa-money-check-dollar "
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">Check Payment</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
						<a href="adminPackages"> <i class="fa-solid fa-star"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">Manage Points</span>
						</a>
					</div>

					<div class="mt-12 mb-3">
						<div
							class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
							<a href="adminprofile"> <i class="fa-solid fa-user"
								style="color: #000000; font-size: 15px;"></i> &nbsp; <span
								class="text-base font-normal">Profile</span>
							</a>
						</div>

						<div
							class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
							<a href="#" onclick="confirmLogout(event)"> <i class="fa-solid fa-arrow-right-from-bracket"
								style="color: #000000; font-size: 15px;"></i> &nbsp; <span
								class="text-base font-normal">Logout</span>
							</a>
						</div>
					</div>
				</div>

				<!-- content -->
				<div class="w-11/12 h-fit mt-5 mx-3 ">
					<div class="flex flex-row justify-between">
						<div class="justify-self-start">
							<i class="fa-solid fa-house"
								style="color: #ffffff; font-size: 20px;"></i> &nbsp; <span
								class="text-xl font-bold text-white">Dashboard</span>
						</div>
						<div class="flex justify-end justify-self-end gap-3">
							<span id='ct' class="rounded p-2 text-white"></span> 
							<!-- <i class="fa-solid fa-bell"
								style="color: #ffffff; font-size: 20px; margin-top: 7px;"></i> -->
							<img
								src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}"
								class="w-10 h-10 rounded-full">
						</div>
					</div>

					<div class="w-full flex flex-row justify-center gap-5 mt-5">
						<div
							class="w-auto h-auto p-3 rounded bg-white shadow-md flex flex-row flex-wrap">
							<div class="flex flex-col flex-wrap w-1/2">
								<h3 class="font-bold text-[#858181] text-base">Registered
									Job Seekers</h3>
								<h4 class="font-bold text-[#7905EE] text-base">${JSCount}</h4>
							</div>
							<div class="w-1/2 flex justify-center">
								<img
									src="${pageContext.request.contextPath}/resources/images/noback/total_js.png"
									class="w-14 h-14 mt-2">
							</div>
						</div>

						<div
							class="w-auto h-auto p-3 rounded bg-white shadow-md flex flex-row flex-wrap">
							<div class="flex flex-col flex-wrap w-1/2">
								<h3 class="font-bold text-[#858181] text-base">Searchable
									Posts</h3>
								<h4 class="font-bold text-[#7905EE] text-base">${JobsCount}</h4>
							</div>
							<div class="w-1/2 flex justify-center">
								<img
									src="${pageContext.request.contextPath}/resources/images/noback/total_post.png"
									class="w-14 h-14 mt-2">
							</div>
						</div>

						<div
							class="w-auto h-auto p-3 rounded bg-white shadow-md flex flex-row flex-wrap">
							<div class="flex flex-col flex-wrap w-1/2">
								<h3 class="font-bold text-[#858181] text-base">Registered
									Companies</h3>
								<h4 class="font-bold text-[#7905EE] text-base">${companyCount}</h4>
							</div>
							<div class="w-1/2 flex justify-center">
								<img
									src="${pageContext.request.contextPath}/resources/images/noback/total_company.png"
									class="w-14 h-14 mt-2"> 
							</div>
						</div>

						<div
							class="w-auto h-auto p-3 rounded bg-white shadow-md flex flex-row flex-wrap">
							<div class="flex flex-col flex-wrap w-1/2">
								<h3 class="font-bold text-[#858181] text-base">Point
									Packages</h3>
								<h4 class="font-bold text-[#7905EE] text-base">${pointsPackage}</h4>
							</div>
							<div class="w-1/2 flex justify-center">
								<img
									src="${pageContext.request.contextPath}/resources/images/icons/pointsIcon.png"
									class="w-14 h-14 mt-2"> 
							</div>
						</div>

					</div>

					<div
						class="hide-scrollbar h-96 flex flex-row justify-center flex-wrap gap-7 mt-5">
						<div class="w-fit h-fit p-8 rounded-lg shadow-xl bg-white">
							<h2 class="font-bold text-[#7905EE] text-base">Website's
								Users</h2>
							<!--<canvas id="piechart" width="300" height="200"></canvas> 
                            <div id="chartContainer" style="height: 300px; width: 100%;"> -->
							<div style="width: 400px; height: 200px">
								<div id="chartContainer" style="height: 200px; width: 100%;"></div>
								<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
							</div>
						</div>



						<div class="w-fit h-fit p-8 rounded-lg shadow-xl bg-white">
							<h2 class="font-bold text-[#7905EE] text-base">Website's
								Reviews</h2>
							<div
								class="mt-3 flex flex-col flex-nowrap justify-center text-center">
								<h2 class="font-bold text-5xl">${averageRating}</h2>
								<p class="font-medium text-base text-gray-500">(${WReviewCount}
									reviews)</p>
							</div>

							<div class="flex flex-row flex-nowrap justify-center">
								<%
								double averageRating = (Double) request.getAttribute("averageRating"); // Assuming you set averageRating in the request scope
								int fullStars = (int) Math.floor(averageRating);
								boolean hasHalfStar = averageRating - fullStars >= 0.5;
								%>

								<%
								for (int i = 1; i <= 5; i++) {
								%>
								<%
								if (i <= fullStars) {
								%>
								<i class="fa-solid fa-star text-gold"></i>
								<%
								} else if (i == fullStars + 1 && hasHalfStar) {
								%>
								<i class="fa-solid fa-star-half-stroke text-gold"></i>
								<%
								} else {
								%>
								<i class="fa-solid fa-star text-gray"></i>
								<%
								}
								%>
								<%
								}
								%>
							</div>
						</div>

						<div class="w-fit h-fit p-8 rounded-lg shadow-xl bg-white">
							<h2 class="font-bold text-[#7905EE] text-base">Payments
								Overview</h2>
							<div
								class="mt-3 flex flex-col flex-nowrap justify-center text-center">
								<h2 class="font-bold text-lg">Total: ${paymentCount}</h2>

								<div class="border-2 border-dotted border-[#9696E8] mt-2">
								</div>
								<div class="flex flex-row justify-between mt-2">
									<!--<img
										src="${pageContext.request.contextPath}/resources/images/icons/payment.png"
										class="w-10 h-8 mt-2"> -->
									<h2 class="font-normal text-lg mt-4">Pending:
										${PendingCount}</h2>
								</div>

								<div class="flex flex-row justify-between mt-2">
									<!-- <img
										src="${pageContext.request.contextPath}/resources/images/icons/credit-card-payment.png"
										class="w-10 h-8 mt-2"> -->
									<h2 class="font-normal text-lg mt-4">Approve:
										${ApproveCount}</h2>
								</div>

								<div class="flex flex-row justify-between mt-2">
									<!-- <img
										src="${pageContext.request.contextPath}/resources/images/icons/credit-card.png"
										class="w-10 h-8 mt-2"> -->
									<h2 class="font-normal text-lg mt-4">Cancel:
										${CancelCount}</h2>
								</div>

							</div>



						</div>



					</div>
				</div>


			</div>
</div>
		</div>
		
		
<script type="text/javascript">
function confirmLogout(event) {
    event.preventDefault();  // Prevent the default anchor behavior
    if (confirm("Are you sure you want to log out?")) {
        window.location.href = '/Final_JN/logout';  // Redirect to logout if confirmed
    }
}
</script>
</body>
</html>