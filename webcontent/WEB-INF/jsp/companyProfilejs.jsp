<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.lang.Integer" %>
<%
    // Retrieve the session attribute
    Integer jobSeekerId = (Integer) session.getAttribute("jobseeker_id");

    if (jobSeekerId != null) {
    	session.setAttribute("jobSeekerId", jobSeekerId);        
       
    } else {
       
    	//response.sendRedirect("login");
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
	color: gold; /* Color for filled stars */
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
					href="#jobs" class="nav-link text-gray-700">Jobs</a> <a
					href="#reviews" class="nav-link text-gray-700">Review</a>
					
			</div>
			<!-- About Section -->
			<section id="about" class="mb-8 rounded"
				style="border: 2px solid #EDEDED; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div class="flex justify-between items-center  mb-1 mt-3">
					<h2 class="text-xl font-semibold text-black ml-4 p-3">About</h2>




				</div>
				<p class="text-black text-xs ml-4 p-3 mt-1 ">
					
					${company.description}
				
				</p>
			</section>
			<!-- Benefits Section -->
			<section id="benefits" class="mb-8 rounded"
				style="border: 2px solid #EDEDED; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<h2 class="text-xl font-semibold text-black ml-4 p-3">Benefits</h2>
				<div class="flex flex-wrap ml-4 p-3 ">
					<c:choose>
						<c:when test="${not empty company.benefits}">
							<!-- Assuming benefits are a comma-separated list; adjust as needed -->
							<c:forEach var="benefit"
								items="${fn:split(company.benefits, ',')}">
								<div
									class="custom-bg text-xs font-bold custom-rounded1 flex justify-center items-center text-black  mb-4 mr-4 sm:w-full md:w-1/2 lg:w-1/3">
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
			<section id="jobs" class="mb-8 rounded"
				style="border: 2px solid #EDEDED; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div
					class="flex justify-between items-center mb-1 flex-wrap sm:flex-nowrap mt-5">
					<div class="flex items-center space-x-2">
						<h2 class="text-xl font-semibold text-black ml-4 p-3 ">Jobs</h2>
						<div
							class="bg-purple-700 text-white rounded-full w-6 h-6 flex items-center justify-center">
							<span class="text-md font-bold"><%=request.getAttribute("jobCount1")%></span>
						</div>
					</div>
					<div class="flex items-center space-x-2 mb-3 sm:mb-2"></div>
				</div>


				<div class="scrollable-container ml-6 mr-4">
					<div class="flex flex-col space-y-4 mb-5">
						<c:forEach var="job" items="${jobs1}">

							<input type="hidden" name="jobId" value="${job.jobId}"
								class="job-id-input" />

							<div class="custom-bg2 p-4 rounded-2xl shadow ">
								<div
									class="flex justify-between items-center flex-wrap sm:flex-nowrap">
									<div class="mb-2">
										<h3 class="text-md font-bold text-black mb-1">${job.jobTitle}</h3>
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
										<a href="/Final_JN/jobdetail/${job.jobId}"
											class=" custom-bg3 border custom-rounded2 px-4 py-2 text-xs font-semibold flex text-white items-center">
											<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
												class="w-3 h-3 mr-2" viewBox="0 0 384 512">
												<path
													d="M0 64C0 28.7 28.7 0 64 0L224 0l0 128c0 17.7 14.3 32 32 32l128 0 0 288c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 64zm384 64l-128 0L256 0 384 128z" /></svg>
											Details
										</a>
										<!-- delete job -->
										<!-- <a href="/Final_JN/jobdetail/${job.jobId}" class="px-2 py-2"> 
										<svg
												xmlns="http://www.w3.org/2000/svg" fill="currentColor"
												class="w-4 h-4 ml-2" viewBox="0 0 512 512">
                                        <path
													d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM294.6 151.2c-4.2-4.6-10.1-7.2-16.4-7.2C266 144 256 154 256 166.3l0 41.7-96 0c-17.7 0-32 14.3-32 32l0 32c0 17.7 14.3 32 32 32l96 0 0 41.7c0 12.3 10 22.3 22.3 22.3c6.2 0 12.1-2.6 16.4-7.2l84-91c3.5-3.8 5.4-8.7 5.4-13.9s-1.9-10.1-5.4-13.9l-84-91z" />
                                    </svg>
										</a> -->
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
			</section>

			<div class="mb-8 rounded" id="reviews"
				style="border: 2px solid #EDEDED; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
				<div
					class="flex justify-between item-center mb-1 flex-wrap sm:flex-nowrap mt-5">
					<div class="flex items-center space-x-2">
						<h2 class="text-xl font-semibold text-black ml-4 p-3 mt-2">Review</h2>
						<div
							class="bg-purple-700 text-white rounded-full w-6 h-6 flex items-center justify-center">
							<span class="text-md font-bold">${reviews.size()}</span>
						</div>


					</div>
					<div class="flex items-center space-x-2 mb-3 sm:mb-2">
						<a href="#writeReview"
							class="custom-bg1 text-xs text-white px-3 py-2  rounded-full mr-5">Write
							a review</a>
					</div>
				</div>
				<div class="scrollable-container ml-6 mr-4">
					<c:forEach var="review" items="${reviews}">
						<input type="hidden" name="jobId" value="${review.jobSeekerId}"
							class="jobseeker-id-input" />
						<div class="mt-6 bg-gray-50 p-4 rounded-lg shadow-inner mb-5 ">
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
									<div>
										<div class="mb-2">
											<h3 class="font-bold">${review.name}
												 ( ${review.position} )</h3>
											<p class="text-xs">${review.reviewDate}</p>
											<script>
                            console.log(${review.name});
                            </script>

										</div>
										<div class="flex justify-between items-center">
											<p class="text-xs">${review.reviewText}</p>

										</div>
									</div>
								</div>


							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		<section id="writeReview" class="mb-8 rounded"
				style="border: 2px solid #EDEDED;  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
			<h2 class="text-xl font-semibold text-black ml-4 p-3 mt-5">Review</h2>
			<div class="ml-6 p-1 mr-6">
			<form action="/Final_JN/addreview" method="post" class="mt-1">
				<input type="hidden" name="company_id" value="${company.companyId}"
					class="c-id-input" />

				<!-- Hidden input to store the selected rating value -->
				<input type="hidden" name="rating" id="rating" value="0" />

				<div class="mb-4">
					<label class="block text-gray-700 text-sm font-bold mb-2">
						We are willing to receive your review! </label>

					<!-- Star Rating -->
					<div class="star-rating mb-4">
						<span class="star1" data-value="1">&#9733;</span> <span
							class="star1" data-value="2">&#9733;</span> <span class="star1"
							data-value="3">&#9733;</span> <span class="star1" data-value="4">&#9733;</span>
						<span class="star1" data-value="5">&#9733;</span>
					</div>

					<textarea name="review_text" rows="4"
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						placeholder="Your review..."></textarea>
				</div>

				<button type="submit"
					class="bg-purple-600 text-white px-4 py-2 rounded-full mb-4">Give
					Review</button>
			</form>
			</div>
</section>
		</div>
	</div>
	<script>
    document.querySelectorAll('.c-id-input').forEach(function(input) {
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

</script>
</body>
</html>
