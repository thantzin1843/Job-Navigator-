<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html lang="en">
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
	function display_c(){
	  	   var refresh=1000; // Refresh rate in milli seconds
	  	   mytime=setTimeout('display_ct()',refresh)
	  	}

	  	function display_ct() {
	  	  var CDate = new Date()
	  	  var NewDate=CDate.toDateString(); 
	  	  NewDate = NewDate + " - " + CDate.toLocaleTimeString();
	  	  document.getElementById('ct').innerHTML = NewDate;
	  	  display_c();
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

.slider {
	transition: transform 0.3s ease;
	background-color: rgba(193, 193, 235, 0.74);
}

.border-active {
	border-color: #7905EE;
}
</style>
</head>
<%
        String contextPath = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
  %>
<body class="font-cabin bg-[#F6F3F3]" onload=display_ct();>
	<div class="container max-w-screen-xl mx-auto p-2 h-screen">
		<div class="w-full h-72 bg-[#9696E8] rounded relative">
			<div class="w-full px-6 pt-6 absolute flex gap-3">
				<!-- nav panel -->
				<div
					class=" bg-[#FFFFFF] opacity-90 w-56 h-auto p-3 rounded-lg flex-col justify-center gap-2 shadow-md">
					<div class="flex items-center justify-center">
						<img src="<%= contextPath %>/resources/images/logo.png" class="w-32 h-20">
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3  hover-bg-opacity rounded">
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
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity active rounded">
						<a href="adminReviews"> <i class="fa-solid fa-comment"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">View Reviews</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
						<a href="adminPayment"> <i class="fa-solid fa-money-check-dollar "
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
							<a href="adminprofile"> <i class="fa-solid fa-user "
								style="color: #000000; font-size: 15px;"></i> &nbsp; <span
								class="text-base font-normal">Profile</span>
							</a>
						</div>

						<div
							class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
							<a href="#"  onclick="confirmLogout(event)"> <i class="fa-solid fa-arrow-right-from-bracket"
								style="color: #000000; font-size: 15px;"></i> &nbsp; <span
								class="text-base font-normal">Logout</span>
							</a>
						</div>
					</div>
				</div>

				<!-- content -->
				<div class="w-11/12 mt-5 mx-3">
					<div class="flex flex-row justify-between flex-wrap">
						<div class="justify-self-start">
							<i class="fa-solid fa-comment"
								style="color: #ffffff; font-size: 20px;"></i> &nbsp; <span
								class="text-xl font-bold text-white">Reviews and Ratings</span>
						</div>
						<div class="flex justify-end justify-self-end gap-3">
							<span id='ct' class="rounded p-2 text-white"></span>
							<!-- <i class="fa-solid fa-bell"
								style="color: #ffffff; font-size: 20px; margin-top: 7px;"></i>  -->
								<img src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}" class="w-10 h-10 rounded-full">
								
						</div>

					</div>

					<div
						class="w-full h-58 flex flex-col justify-start mt-5 bg-white shadow-md rounded p-5">
						<h5 class="text-normal font-normal text-gray-700">
							${reviews.size()} Reviews</h5>
						<br />

						<div class="w-full flex flex-row flex-nowrap gap-2 item-center">

							<!-- review part -->
							<div
								class="w-3/4 flex-col flex-wrap justify-between   overflow-y-scroll hide-scrollbar"
								style="height: 350px;">
								<c:forEach var="review" items="${reviews}">

									<div
										class="reviews w-full flex-col flex-wrap rounded p-5 cursor-pointer border-2 mb-5">
										<input type="hidden" name="reviewId"
											value="${review.reviewId}">
										<script>
											// Log the review ID to the console
											console.log('${review.reviewId}');
										</script>
										<div class="flex flex-row flex-wrap justify-between">
											<div class="flex flex-row flex-wrap">
												
													<c:if test="${empty review.reviewerPhoto}">
														<img
													src="<%= contextPath %>/resources/Upload_image/default_pic.jpg"
													class="rounded-full w-12 h-12">
													</c:if>
													<c:if test="${not empty review.reviewerPhoto}">
														<img
													src="<%= contextPath %>/resources/Upload_image/${review.reviewerPhoto}"
													class="rounded-full w-12 h-12">
													</c:if>
												<div>
													<h6 class="text-base ml-2 font-bold">${review.reviewerRole}</h6>
													<span class="text-sm ml-2 text-gray-500">${review.reviewDate}</span>
												</div>
											</div>
											<div class="flex flex-row flex-nowrap justify-center">
												<c:forEach var="i" begin="1" end="${review.rating}">
													<i class="fa-solid fa-star" style="color: #f0dc00;"></i>
												</c:forEach>
												<c:forEach var="i" begin="1" end="${5 - review.rating}">
													<i class="fa-solid fa-star" style="color: #8a8a8a;"></i>
												</c:forEach>
											</div>
										</div>
										<div class="text-base">${review.reviewText}</div>
									</div>
								</c:forEach>
							</div>
							<div class="flex justify-center ml-10 item-center">
<form:form action="/Final_JN/adminReviews/delete" method="POST" modelAttribute="rd">
    <input type="hidden" name="reviewId" id="reviewIdInput" value="">
    <button id="deleteButton" type="submit" class="w-auto bg-white border-2 border-[#7905EE] text-[#c52626] font-normal text-base px-4 py-2 rounded-lg flex flex-wrap justify-center">
        <i class="fa-solid fa-trash" style="color: #c52626;"></i>&nbsp;Delete
    </button>
</form:form>



</div>
						</div>







					</div>
				</div>
			</div>

		</div>

	</div>



	<script>
		let selectedReviewId = null;

		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const reviews = document
									.getElementsByClassName("reviews");
							for (let i = 0; i < reviews.length; i++) {
								reviews[i]
										.addEventListener(
												'click',
												function() {
													// Deselect previously selected review
													const activeReview = document
															.querySelector('.reviews.border-active');
													if (activeReview
															&& activeReview !== this) {
														activeReview.classList
																.remove("border-active");
													}

													// Toggle selection on current review
													this.classList
															.toggle("border-active");

													// Update selected review ID
													selectedReviewId = this
															.querySelector('input[name="reviewId"]');
													console
															.log(
																	'Selected Review ID:',
																	selectedReviewId.value);
													if (selectedReviewId) {
														
														document.getElementById('reviewIdInput').value = selectedReviewId.value;
														console
														.log(
																'Selected Review ID again:',
																reviewIdInput.value);
														
														//document.getElementById('deleteForm')
														 //		.submit();
													} else {
														alert('No review selected');
													}// Log the selected review ID
												});
							}

							
						});
		
		
		function confirmLogout(event) {
		    event.preventDefault();  // Prevent the default anchor behavior
		    if (confirm("Are you sure you want to log out?")) {
		        window.location.href = '/Final_JN/logout';  // Redirect to logout if confirmed
		    }
		}
</script>
</body>
</html>