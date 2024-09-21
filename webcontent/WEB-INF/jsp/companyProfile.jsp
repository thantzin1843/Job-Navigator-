<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.lang.Integer" %>
<%
    // Retrieve the session attribute
    Integer compId = (Integer) session.getAttribute("company_id");

    if (compId != null) {
    	session.setAttribute("company_id", compId);       
        
       
    } else {
       
    	response.sendRedirect("login");
    }
    
   
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Company Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<style>
body {
	font-family: 'Inter', sans-serif;
}

.custom-rounded {
	width: 6rem;
	height: 6rem;
	border-radius: 0.5rem;
	/* Adjust this value to make the image slightly rounded */
}


.scrollable-container {
max-height: 240px;
    overflow-y: scroll; /* Enable scrolling */
    scrollbar-width: none; /* For Firefox */
}

.scrollable-container::-webkit-scrollbar {
    display: none; /* For Chrome, Safari, and other WebKit browsers */
}


.custom-rounded1 {
	width: 10rem;
	height: 1.8rem;
	border-radius: 0.8rem;
	/* Adjust this value to make the image slightly rounded */
}

.custom-rounded2 {
	width: 7rem;
	height: 1.8rem;
	border-radius: 0.8rem;
	/* Adjust this value to make the image slightly rounded */
}

.custom-bg {
	background-color: #9696E8;
}

.custom-bg1 {
	background-color: #7905EE;
}

.custom-bg2 {
	background-color: #E6E6FA;
}

.custom-bg3 {
	background-color: #8035FB;
}

.nav-link {
	position: relative;
	text-decoration: none;
}

.nav-link::after {
	content: '';
	position: absolute;
	left: 0;
	bottom: -2px; /* Adjust to position the underline */
	width: 100%;
	height: 2px; /* Adjust thickness of underline */
	background-color: purple; /* Color of the underline */
	transform: scaleX(0);
	transition: transform 0.3s ease;
}

.nav-link.active::after {
	transform: scaleX(1);
}

.star-rating {
	display: flex;
	direction: row;
}

.star {
	font-size: 0.8em;
	color: gray; /* Default color for empty stars */
}

.star.filled {
	color: gold;
}

.star1 {
	font-size: 2rem;
	cursor: pointer;
	color: #ccc; /* Default star color */
}

.star1.text-yellow-500 {
	color: #f59e0b; /* Highlighted star color (yellow) */
}

.star1:hover {
	color: #f59e0b;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgba(0, 0, 0, 0.5); /* Black with transparency */
	justify-content: center;
	align-items: center;
}

/* Modal content */
.modal-content {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	text-align: center;
	max-width: 400px;
	width: 100%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Button styles */
.btn {
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
	margin: 10px;
}

.confirm-btn {
	background-color: #e74c3c;
	color: white;
}

.cancel-btn {
	background-color: #bdc3c7;
	color: black;
}

.modal-content h2 {
	font-size: 20px;
	margin-bottom: 10px;
}

.modal-content p {
	margin-bottom: 20px;
	font-size: 16px;
}
</style>
</head>
<%
String contextPath = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
%>
<body class="bg-white">
	<div class="flex">
		<!-- Sidebar -->
		<div class="w-1/4 custom-bg p-8">
			<a href="/Final_JN/" class="flex flex-wrap mb-4 text-white text-xs"><svg
					xmlns="http://www.w3.org/2000/svg" fill="currentColor"
					class="w-4 h-4 mr-2" viewBox="0 0 448 512">
					<path
						d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z" /></svg>Back
				to main page</a>
			<div class="justify-center">

			 <c:if test="${not empty compImg}">
				<img src="<%= contextPath %>/resources/Upload_image/${compImg}"
					alt="Company Photo" class="w-24 h-24 custom-rounded mb-4" />
			</c:if>
			
			<c:if test="${empty compImg}">
				<img src="<%= contextPath %>/resources/Upload_image/default.jpg"
					alt="Company Photo" class="w-24 h-24 custom-rounded mb-4" />
			</c:if>



				<c:if test="${not empty company.companyName}">
					<h2 class="font-bold text-lg text-white mb-2">${company.companyName}</h2>
				</c:if>



				<div
					class="flex item-center space-x-1 mb-2 sm:space-x-1 flex-wrap sm:flex-nowrap">
					<%-- Loop through the social media accounts --%>
					<c:forEach var="account" items="${company.socialMediaAccounts}">
						<c:choose>
							<%-- Twitter --%>
							<c:when test="${account.platform == 'Twitter'}">
								<div class="mb-2">
									<a href="${account.accountUrl}"
										class="rounded-full p-1 w-8 h-8 flex items-center justify-center">
										<i class="fa-brands fa-twitter text-2xl text-blue-600"></i>
									</a>
								</div>
							</c:when>

							<%-- Instagram --%>
							<c:when test="${account.platform == 'Instagram'}">
								<div class="mb-2">
									<a href="${account.accountUrl}"
										class="rounded-full p-1 w-8 h-8 flex items-center justify-center">
										<i class="fa-brands fa-instagram text-2xl"
										style="color: #3430e8;"></i>
									</a>
								</div>
							</c:when>

							<%-- LinkedIn --%>
							<c:when test="${account.platform == 'LinkedIn'}">
								<div class="mb-2">
									<a href="${account.accountUrl}"
										class="rounded-full p-1 w-8 h-8 flex items-center justify-center">
										<i class="fa-brands fa-linkedin text-2xl"
										style="color: #0d3273;"></i>
									</a>
								</div>
							</c:when>

							<%-- Facebook --%>
							<c:when test="${account.platform == 'Facebook'}">
								<div class="mb-2">
									<a href="${account.accountUrl}"
										class=" rounded-full p-1 w-8 h-8 flex items-center justify-center">
										<i class="fa-brands fa-facebook text-2xl text-blue-800"></i>
									</a>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>

				<div class="text-left text-white">
					<p class="mb-2">
						<span class="text-sm block">Industry:</span> <span
							class="font-semibold text-sm"><c:out
								value="${company.industryType}" /></span>
					</p>
					<p class="mb-2">
						<span class="text-sm block">Location:</span> <span
							class="font-semibold text-sm"><c:out
								value="${company.location}" /></span>
					</p>
					<p class="mb-2">
						<span class="text-sm block">Company size:</span> <span
							class="font-semibold text-sm"><c:out
								value="${company.companySize}" /></span>
					</p>
					<p class="mb-2">
						<span class="text-sm block">Working Policy:</span> <span
							class="font-semibold text-sm"><c:out
								value="${company.workingPolicy}" /></span>
					</p>
					<p class="mb-2">
						<span class="text-sm block">Phone:</span> <span
							class="font-semibold text-sm"><c:out
								value="${company.phoneNumber}" /></span>
					</p>
				</div>
			</div>
		</div>

		<div class="w-3/4 p-14">
			<!-- Tabs -->
			<div class="flex space-x-8 mb-8">
				<a href="#about"
					class="nav-link text-purple-700 font-semibold active">About</a> <a
					href="#benefits" class="nav-link text-gray-700">Benefits</a> <a
					href="#jobs" class="nav-link text-gray-700">Jobs</a>
					<a href="#review" class="nav-link text-gray-700">Reviews</a>
					<a href="${pageContext.request.contextPath}/approve/application/page" class="nav-link text-gray-700">Applications</a>
			</div>
			<!-- About Section -->
			<section id="about" class="mb-8 rounded"
				style="border: 2px solid #EDEDED;  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">

				<div class="flex justify-between items-center mb-1 mt-3">
					<h2 class="text-xl font-semibold text-black ml-4 p-3">About</h2>
					<a href="/Final_JN/profile/${company.companyId}"
						class="custom-bg1 border border-black-700 rounded px-3 py-1 text-xs justify-between items-center font-semibold flex text-white mr-5">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
							class="w-3 h-3 m-2 ml-3" viewBox="0 0 512 512">
        <path
								d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160L0 416c0 53 43 96 96 96l256 0c53 0 96-43 96-96l0-96c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 96c0 17.7-14.3 32-32 32L96 448c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 64z" />
    </svg> Edit Profile
					</a>



				</div>
				<p class="text-black text-xs ml-4 p-3 mt-1 ">
					
					${company.description}
				</p>
			</section>
			<!-- Benefits Section -->
			<section id="benefits" class="mb-8 rounded"
				style="border: 2px solid #EDEDED; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<h2 class="text-xl font-semibold text-black  ml-4 p-3">Benefits</h2>
				<div class="flex flex-wrap ml-4 p-3 ">
					<c:choose>
						<c:when test="${not empty company.benefits}">
							<!-- Assuming benefits are a comma-separated list; adjust as needed -->
							<c:forEach var="benefit"
								items="${fn:split(company.benefits, ',')}">
								<div
									class="custom-bg text-xs font-bold custom-rounded1  flex justify-center items-center text-black  mb-4 mr-4 sm:w-full md:w-1/2 lg:w-1/3">
									<!-- Example SVG icons; replace or adjust as needed -->

									${benefit}
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>No benefits listed.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</section>


			<!-- Jobs Section -->
			<section id="jobs"  class="mb-8 rounded"
				style="border: 2px solid #EDEDED;  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div
					class="flex justify-between items-center mb-1 flex-wrap sm:flex-nowrap mt-5">
					<div class="flex items-center space-x-2">
						<h2 class="text-xl font-semibold text-black  ml-4 p-3 ">Jobs</h2>
						<div
							class="bg-purple-700 text-white rounded-full w-6 h-6 flex items-center justify-center">
							<span class="text-md font-bold"><%=request.getAttribute("jobCount")%></span>
						</div>
					</div>
					<div class="flex items-center space-x-2 mb-3 sm:mb-2">
						<a href="/Final_JN/post/${company.companyId}"
							class="custom-bg1 border border-black-700 text-white text-xs rounded px-3 py-2 flex items-center space-x-2 mr-5">
							<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
								class="w-4 h-4" viewBox="0 0 512 512">
        <path
									d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
    </svg> <span>Add Post</span>
						</a>

					</div>
				</div>

				<div class="scrollable-container ml-6 mr-4">
					<div class="flex flex-col space-y-4 mb-5">
						<c:forEach var="job" items="${jobs}">
							<input type="hidden" name="jobId" value="${job.jobId}"
								class="job-id-input" />

							<div class="custom-bg2 p-4 rounded-xl shadow ">
								<div
									class="flex justify-between items-center flex-wrap sm:flex-nowrap">
									<div class="mb-2">
										<h3 class="text-md font-bold text-black mb-4">${job.jobTitle}</h3>
										<div class="flex items-center text-sm text-gray-600 space-x-2">
											<p class="text-gray-500 flex">
												<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mr-2"
													viewBox="0 0 384 512">
												<path
														d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" /></svg>${job.location}
												(${job.workingSetting})
											</p>
											<p class="flex">
												<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mr-2"
													viewBox="0 0 512 512">
												<path
														d="M184 48l144 0c4.4 0 8 3.6 8 8l0 40L176 96l0-40c0-4.4 3.6-8 8-8zm-56 8l0 40L64 96C28.7 96 0 124.7 0 160l0 96 192 0 128 0 192 0 0-96c0-35.3-28.7-64-64-64l-64 0 0-40c0-30.9-25.1-56-56-56L184 0c-30.9 0-56 25.1-56 56zM512 288l-192 0 0 32c0 17.7-14.3 32-32 32l-64 0c-17.7 0-32-14.3-32-32l0-32L0 288 0 416c0 35.3 28.7 64 64 64l384 0c35.3 0 64-28.7 64-64l0-128z" /></svg>${job.employmentType}</p>
										</div>
									</div>
									<div class="flex space-x-2 items-center justify-between">
										<a href="/Final_JN/Editpost/${job.jobId}"
											class=" custom-bg3 border custom-rounded2 px-4 py-2 text-xs font-semibold flex text-white items-center">
											<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
												class="w-3 h-3 mr-2" viewBox="0 0 512 512">
											<path
													d="M471.6 21.7c-21.9-21.9-57.3-21.9-79.2 0L362.3 51.7l97.9 97.9 30.1-30.1c21.9-21.9 21.9-57.3 0-79.2L471.6 21.7zm-299.2 220c-6.1 6.1-10.8 13.6-13.5 21.9l-29.6 88.8c-2.9 8.6-.6 18.1 5.8 24.6s15.9 8.7 24.6 5.8l88.8-29.6c8.2-2.7 15.7-7.4 21.9-13.5L437.7 172.3 339.7 74.3 172.4 241.7zM96 64C43 64 0 107 0 160L0 416c0 53 43 96 96 96l256 0c53 0 96-43 96-96l0-96c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 96c0 17.7-14.3 32-32 32L96 448c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l96 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 64z" /></svg>
											Edit Post
										</a>
										<button class="deletebtn">
											<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mr-2"
												viewBox="0 0 448 512">
		<path
													d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z" />
	</svg>
										</button>

									</div>
									<!-- delete job -->
									<!-- Link to trigger the modal -->
									<div
										class="fixed inset-0 flex items-center justify-center w-full h-full hidden bg-black bg-opacity-50"
										id="DeleteBox">
										<div class="bg-white w-1/3 p-6 rounded-lg shadow-lg">
											<h2 class="text-lg font-semibold mb-4">Are You sure to delete this job post?</h2>
											<form action="/Final_JN/deletePost" method="post"
												id="deleteForm" style="display: inline;">
												<input type="hidden" name="jobId" value="${job.jobId}">
												<script>
												console.log(${job.jobId});
												</script>

												<div class="flex justify-end">
													<button type="button"
														class="bg-gray-300 text-black px-4 py-2 rounded mr-2"
														onclick="hideBox()">Cancel</button>
													<button type="submit"
														class="custom-bg1 text-white px-4 py-2 rounded">Delete</button>
												</div>
											</form>
										</div>


										<!-- Hidden form for deletion -->

									</div>
								</div>
							</div>


						</c:forEach>
					</div>
				</div>
			</section>
			<div class="mb-8" class="mb-8 rounded" id="review"
				style="border: 2px solid #EDEDED;  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div class="flex items-center space-x-2">
					<h2 class="text-xl font-semibold text-black ml-4 p-3 mt-2">Review</h2>
					<div
							class="bg-purple-700 text-white rounded-full w-6 h-6 flex items-center justify-center">
							<span class="text-md font-bold">${reviews.size()}</span>
						</div>
					
				</div>
				<div class="scrollable-container ml-6 mr-4">
					<c:forEach var="review" items="${reviews}">
						<input type="hidden" name="jobId" value="${review.jobSeekerId}"
							class="jobseeker-id-input" />
						<div class="mt-6 bg-gray-50 p-4 rounded-lg shadow-inner mb-5">
							<div class="border-b pb-5">
								<div class="flex">
									<!-- Profile and Star Rating -->
									<div class="flex flex-col items-center mr-4">
										<div
											class="w-12 h-12 rounded-full border-4 border-blue-500 overflow-hidden">
											<img
												src="<%= contextPath %>/resources/Upload_image/${review.jobSeekerPhoto}"
												alt="User Image" class="w-full h-full object-cover">
										</div>
										<div class="mt-2 star-rating">
											<c:forEach var="i" begin="1" end="5">
												<i
													class="fas fa-star star ${i <= review.rating ? 'filled' : ''}"></i>
											</c:forEach>
										</div>
									</div>

									<!-- Content -->
									<div class="flex-1">
										<div class="flex flex-row mb-2 justify-between">
										<div class="mb2">
											<h3 class="font-bold">${review.firstName}
												${review.lastName} ( ${review.position} )</h3>
											<p class="text-xs">${review.reviewDate}</p>
											</div>
											<button class="deletereviewbtn">
											<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mr-2"
												viewBox="0 0 448 512">
		<path
													d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z" />
	</svg>
										</button>

										</div>
										<!-- Review Text and Delete Button in Flexbox -->
										<div class="flex justify-between items-center">
											<p class="text-xs">${review.reviewText}</p>
											
										</div>
										
										<div
										class="fixed inset-0 flex items-center justify-center w-full h-full hidden bg-black bg-opacity-50"
										id="DeleteReviewBox">
										<div class="bg-white w-1/3 p-6 rounded-lg shadow-lg">
											<h2 class="text-lg font-semibold mb-4">Are you sure to delete this review ?</h2>
											<form action="/Final_JN/deleteReview" method="post"
												id="deletereviewForm" style="display: inline;">
												<input type="hidden" name="reviewId" value="${review.reviewId}">
												<script>
												console.log(${review.reviewId});
												</script>

												<div class="flex justify-end">
													<button type="button"
														class="bg-gray-300 text-black px-4 py-2 rounded mr-2"
														onclick="hideBox1()">Cancel</button>
													<button type="submit"
														class="custom-bg1 text-white px-4 py-2 rounded">Delete</button>
												</div>
											</form>
										</div>
										
									</div>
								</div>
							</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>

		</div>
	</div>
	<script>
    document.querySelectorAll('.job-id-input').forEach(function(input) {
        console.log('Job ID:', input.value);
    });
    const stars = document.querySelectorAll('.star1');
    const ratingInput = document.getElementById('rating');

    stars.forEach(star => {
        star.addEventListener('click', function() {
            const ratingValue = this.getAttribute('data-value');
            ratingInput.value = ratingValue;

            // Reset all stars to default color
            stars.forEach(s => s.classList.remove('text-yellow-500'));

            // Highlight stars up to the selected rating
            for (let i = 0; i < ratingValue; i++) {
                stars[i].classList.add('text-yellow-500');
            }
        });
    });
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function() {
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
    
 // Select all delete buttons
    const deleteButtons = document.querySelectorAll('.deletebtn');

    // Add event listener to each delete button
    deleteButtons.forEach(function(btn, index) {
    	btn.addEventListener("click", function() {
    		const deleteBox = document.querySelectorAll('#DeleteBox')[index];
    		deleteBox.classList.toggle('hidden');
    		document.getElementById('container').classList.toggle('disabled-background');
    	});
    });

    function hideBox() {
    	// Ensure the correct delete box is hidden
    	document.querySelectorAll('#DeleteBox').forEach(box => box.classList.add('hidden'));
    	document.getElementById('container').classList.remove('disabled-background');
    }
    
    
    
    const deletereviewButtons = document.querySelectorAll('.deletereviewbtn');

    // Add event listener to each delete button
    deletereviewButtons.forEach(function(btn, index) {
    	btn.addEventListener("click", function() {
    		const deleteBox = document.querySelectorAll('#DeleteReviewBox')[index];
    		deleteBox.classList.toggle('hidden');
    		document.getElementById('container').classList.toggle('disabled-background');
    	});
    });

    function hideBox1() {
    	// Ensure the correct delete box is hidden
    	document.querySelectorAll('#DeleteReviewBox').forEach(box => box.classList.add('hidden'));
    	document.getElementById('container').classList.remove('disabled-background');
    }
    

    </script>
</body>
</html>
