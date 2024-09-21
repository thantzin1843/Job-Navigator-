<header class="header custom-header py-5">
        <div class="container d-flex flex-column flex-lg-row align-items-center">
            <div class="header-content text-center text-lg-start mb-4 mb-lg-0">
                <h1 class="display-3">Find a Job With Your Interests and Abilities</h1>
                <p class="lead">Don't wait for the opportunity: create it</p>
            </div>
            <div class="header-image text-center">
                <img src="${pageContext.request.contextPath}/resources/img/v145_9.png" alt="Header Image" class="img-fluid">
            </div>
        </div>
        
		<div class="container mt-5">
		    <div class="custom-container"> <!-- Custom Container with All Sections in a Row -->
		        <form action="showfilter" method="post" >
					<div class="row">
				    	<div class="col dropdown custom-dropbox md-5">
				      		<input type="text" name="categoryName" list="som" class="form-control" style="border:none;" placeholder="Search Job Title">
				      			<datalist id="som">
				                    <option value="Software Engineer">
				                    <option value="Data Scientist">
				                    <option value="Product Manager">
				                </datalist>
				    	</div>
					    <div class="col dropdown custom-dropbox md-6 p-2">
						    <select id="locationDropdown" name="location" class="form-select" style="border:none;">
						    	  <option value="" disabled selected hidden>Select Location</option>
							    <c:forEach var="location" items="${locations}">
							        <option value="${location}">${location}</option>
							    </c:forEach>
							</select>
						    <!-- <i class="fas fa-map-marker-alt" id="locationDropdown" role="button" aria-expanded="false"></i>
						    <ul class="dropdown-menu" aria-labelledby="locationDropdown">
						        <c:forEach var="location" items="${locations}">
						            <li>
						                <a class="dropdown-item" href="#" data-value="${location}">${location}</a>
						            </li>
						        </c:forEach>
						    </ul>  -->
						    
						    
						</div>
					    <div class="col md-1">
					    	<button class="btn btn-light transparent border btn-search">Search</button>
					    </div>
				  	</div>
				</form>
		    </div>
		</div>
    </header>

    <section class="intro">
        <!-- Welcome text row -->
        <div class="row w-100">
            <div class="col-12">
                <h2>Welcome To Job Navigator</h2>
            </div>
        </div>
        <!-- Statistics boxes row -->
        <div class="row w-100">
            <div class="col-md-4 mb-4">
                <div class="box p-4 border rounded shadow-sm box-1">
                    <img src="${pageContext.request.contextPath}/resources/img/seekers.png" alt="Description" class="img-fluid">
                    <p class="mb-0">${JSCount} Registered Job Seekers</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="box p-4 border rounded shadow-sm box-2">
                    <img src="${pageContext.request.contextPath}/resources/img/post.png" alt="Description" class="img-fluid">
                    <p class="mb-0">${JobsCount} Researchable Posts</p>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="box p-4 border rounded shadow-sm box-3">
                    <img src="${pageContext.request.contextPath}/resources/img/company.png" alt="Description" class="img-fluid">
                    <p class="mb-0">${companyCount} Registered Employers</p>
                </div>
            </div>
        </div>
    </section>
    
    <div class="container-center">
	    <section class="categories py-5 px-5">
	        <h2 class="mb-4">Explore Jobs By Categories</h2>
	        <div class="row">
	            <c:forEach var="category" items="${categories}">
	                <div class="col-6 col-md-4 col-lg-2 mb-4 w-fit">
	                    <div class="category p-2" style="width:180px; height:50px; border-radius:10px; padding:3px">
	                        <!-- <img src="${pageContext.request.contextPath}/resources/img/${category.imageFilename}" 
	                             alt="${category.categoryName}" class="img-fluid mb-2"> -->
	                        <span>${category.categoryName}</span>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </section>
	</div>

	<div class="main-content">
		<div class="testimonial-wrapper">
			<div class="testimonial-container">
			<h2 class="mb-4">What Our Clients Say About Us</h2>
		        <c:choose>
		            <c:when test="${not empty testimonials}">
		                <c:forEach var="testimonial" items="${testimonials}">
		                    <div class="testimonial-item">
		                        <div class="userinfo w-full">
		    						
		    						<div class="username-role w-full flex flex-row justify-between gap-10">		    						
		       	 						<div>
			       	 						<h2 class="username">${testimonial.user.username}</h2>
			        						<p class="role">${testimonial.user.role}</p>
		        						</div>
		        						
		        						
		    						</div>
								</div>
		                        <div class="testimonial-text-container">
		                            <p class="testimonial-text">${testimonial.reviewText}</p>
		                        </div>
		                        <div class="stars">
		                            <c:forEach var="i" begin="1" end="${testimonial.rating}">
		                    			<span class="star">&#9733;</span> <!-- Filled star -->
		                			</c:forEach>
		                			<!-- Empty Stars -->
		               				<c:forEach var="i" begin="${testimonial.rating + 1}" end="5">
		                    			<span class="star">&#9734;</span> <!-- Empty star -->
		                			</c:forEach>
		                        </div>
		                        <span class="arrow arrow-prev" onclick="prevTestimonial()">&#10094;</span>
		                        <span class="arrow arrow-next" onclick="nextTestimonial()">&#10095;</span>
		                    </div>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                <p>No testimonials available.</p>
		            </c:otherwise>
		        </c:choose>
		    </div>
    	</div>
		
    <div class="container-fluid platform">
        <!-- <div class="row text-center">
            <div class="col-6 col-md-3 d-flex justify-content-center mb-3">
                <img src="${pageContext.request.contextPath}/resources/img/ciscoTransparent.png" class="img-fluid" alt="Image 1">
            </div>
            <div class="col-6 col-md-3 d-flex justify-content-center mb-3">
                <img src="${pageContext.request.contextPath}/resources/img/microsoftTransparent.png" class="img-fluid" alt="Image 2">
            </div>
            <div class="col-6 col-md-3 d-flex justify-content-center mb-3">
                <img src="${pageContext.request.contextPath}/resources/img/amazonTransparent.png" class="img-fluid" alt="Image 3">
            </div>
            <div class="col-6 col-md-3 d-flex justify-content-center mb-3">
                <img src="${pageContext.request.contextPath}/resources/img/slackTransparent.png" class="img-fluid" alt="Image 4">
            </div>
        </div> -->
    </div>
    </div>
    
    <div class="footer bg-dark text-white py-4">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12 col-md-4 mb-3 mb-md-0 text-center"> <!-- Center align content -->
                    <img src="${pageContext.request.contextPath}/resources/img/logo_color.png" class="img-fluid mb-3"> <!-- Adjust logo size -->
                    <div class="d-flex justify-content-center align-items-center mb-2"> <!-- Center email -->
                        <i class="ri-mail-line me-2"></i>
                        <p class="mb-0">jobnavigator@gmail.com</p>
                    </div>
                    <div class="d-flex justify-content-center align-items-center"> <!-- Center phone -->
                        <i class="ri-phone-line me-2"></i>
                        <p class="mb-0">09-798376287</p>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-3 mb-md-0">
                    <p class="h5 mb-3">Navigation</p>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none">Home</a></li>
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none">Find jobs</a></li>
                        <li class="mb-2"><a href="search_company" class="text-white text-decoration-none">Find Companies</a></li>
                        <li><a href="#" class="text-white text-decoration-none">Post Jobs</a></li>
                    </ul>
                </div>
                <div class="col-12 col-md-4">
                    <p class="h5 mb-3">About Us</p>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="text-white text-decoration-none">Legal</a></li>
                        <li class="mb-2"><a href="term" class="text-white text-decoration-none">Terms and Conditions</a></li>
                        <li><a href="privacypolicy" class="text-white text-decoration-none">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="text-center">
                <p class="mb-0">&copy; 2024 Job Navigator</p>
            </div>
        </div>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>