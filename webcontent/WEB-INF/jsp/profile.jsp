<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Edit Profile</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
body {
	background-color: #f3f4f6;
}

.custom-bg {
	background-color: #E6E6FA;
}

.custom-bg1 {
	background-color: #7905EE;
}

.benefit_card{
background-color:#D9D9D9;
}

.card {
	background-color: #fafaff;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn-primary {
	background-color: #9696E8;
}

.btn-danger {
	background-color: #f56565;
}

.custom-rounded {
	width: 6rem;
	height: 6rem;
	border-radius: 0.5rem;
	/* Adjust this value to make the image slightly rounded */
}

.form-input, .form-select {
	border: 1px solid #000000;
	border-radius: 0.375rem;
}
.btn-delete { width:fit; color:white; border: none; cursor: pointer;  }

#industryType:invalid, #location:invalid, #phone:invalid , #name:invalid, #address:invalid, .socialMediaUrls:invalid{
    outline: 2px solid pink;
    animation:shake 500ms;
  }
  #industryType:valid , #location:valid, #phone:valid, #name:valid, #address:valid,  .socialMediaUrls:invalid{      
    /*outline: 2px solid lightgreen; */
  }
  @keyframes shake{
    25% {transform:translateX(4px);}
    50% {transform:translateX(-4px);}
    75% {transform:translateX(4px);}
  }
 
 .error{color:red}
</style>
<!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
</head>
<%
String contextPath = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
%>
<body class="flex items-center justify-center min-h-screen p-6">
	<div class="custom-bg p-8 rounded-lg w-full max-w-lg">
	<div class=" mt-2 ml-2  mb-2 w-fit h-fit ">
		<a href="/Final_JN/companyProfile">
             
            <i class="fa-solid fa-arrow-left"> </i>Back
        </a>
 	</div>
		<h2 class="text-lg font-bold mb-4">Edit Profile</h2>
		<div class="flex items-center mb-4 ">
			
			<c:if test="${not empty profile.companyPhoto}">
				<img
				src="<%= contextPath %>/resources/Upload_image/${profile.companyPhoto}"
				alt="Company Photo" class="w-24 h-24 custom-rounded mb-4" />
			</c:if>
			
			<c:if test="${empty profile.companyPhoto}">
				<img
				src="<%= contextPath %>/resources/Upload_image/default.jpg"
				alt="Company Photo" class="w-24 h-24 custom-rounded mb-4" />
			</c:if>
			<div class="flex-wrap sm:flex-nowrap">

				<form:form method="POST" action="/Final_JN/profile/uploadPhoto"
					enctype="multipart/form-data" modelAttribute="profile">
					<form:hidden path="companyId" />
					<input type="file" name="file"
						class="text-xs ml-8 mb-4 font-semibold py-1 px-3 rounded-xl" required="required"/>

					<button type="submit"
						class="text-white custom-bg1 text-xs ml-8 mb-4 font-semibold py-1 px-3 rounded-xl">Change
						Picture</button>
				</form:form>

				<form:form method="POST" action="/Final_JN/profile/deletePhoto"
					modelAttribute="profile">
					<form:hidden path="companyId" />
					<button type="submit"
						class="text-red-500 bg-white px-3 text-xs ml-8 py-1 font-semibold rounded-xl">
						Delete Picture</button>
				</form:form>

			</div>
		</div>
		<form:form action="/Final_JN/saveProfile" method="post"
			modelAttribute="profile" id="profileForm">
			<form:hidden path="companyId" />
			<div class="mb-4 flex">
				<form:label path="name" cssClass="text-sm font-medium mr-10">Name</form:label>
				<form:input path="name" cssClass="form-input w-full px-2" required="required"/>
				<form:errors path="name" cssClass="text-sm"/>
			</div>

			<div class="mb-4 flex">
				<form:label path="industryType" cssClass="text-sm font-medium mr-6">Industry</form:label>
				<form:input path="industryType" id="industryType" cssClass="form-input w-full px-2" placeholder="Technology" pattern="^([A-Za-z]+\s*)*$"/>
				<span id="industryError" class="text-sm text-red-600 hidden">Input should not include 'no'</span>     
				<form:errors path="industryType" cssClass="text-sm"/>					
			</div>

			<div class="mb-4 flex">
				<form:label path="location" cssClass="text-sm font-medium mr-6">Location</form:label>
				<form:input path="location" id="location" cssClass="form-input w-full px-2" placeholder="Yangon, Myanmar" pattern="^([A-Za-z]+\s*)*$"/>
				<form:errors path="location" cssClass="text-sm"/>
			</div>
			
			<div class="mb-4 flex">
				<form:label path="address" cssClass="text-sm font-medium ">Detail Address</form:label>
				<form:input path="address" id="address" cssClass="form-input w-full px-2" placeholder="Detail address" pattern="^[a-zA-Z0-9\- ,;.]+$"/>
				<form:errors path="address" cssClass="text-sm"/>
			</div>
			
			<div class="mb-4 flex">
				<form:label path="phoneNumber" cssClass="text-sm font-medium mr-9">Phone</form:label>
				<form:input path="phoneNumber" id="phone" cssClass="form-input w-full px-2" placeholder="09798886778" pattern="^09([0-9]{7}|[0-9]{8}|[0-9]{9})$"/>
				<form:errors path="phoneNumber" cssClass="text-sm"/>
			</div>

			<div class="mb-4 flex flex-col gap-2" id="socialMediaContainer">
				
				<c:choose>
							<c:when test="${not empty socialMedia}">								
									<div class="flex flex-row justify-between">
										<label class="text-sm font-medium mr-7">Social Media</label>
										<button type="button" class="btn-primary text-white py-1 px-3 rounded ml-2" onclick="addSocialMediaField()">+</button>
									</div>
							</c:when>
			    
						    <c:otherwise>
						    	<label class="text-sm font-medium mr-7">Social Media</label>
						    	<form:errors path="socialMediaUrls" cssClass="text-sm text-red"/>
						    </c:otherwise>
			    </c:choose>
				
						<c:choose>
							<c:when test="${not empty socialMedia}">
								 <!-- <p>${socialMedia.size()} </p> -->
									<!-- Loop through socialMedia map and create input fields -->	
													<!-- pattern="(https?:\/\/)?(www\.)?(facebook\.com\/.+|twitter\.com\/.+|instagram\.com\/.+|linkedin\.com\/.+|youtube\.com\/.+|youtu\.be\/.+)" -->				
									<c:forEach var="entry" items="${socialMedia}">
										
										<div class="flex">
										<form:input path="socialMediaUrls" value="${entry.accountUrl}"
											cssClass="form-input w-full px-2" 
											title="Please enter a valid social media URL" pattern="(https?:\/\/)?(www\.)?(facebook\.com\/.+|twitter\.com\/.+|instagram\.com\/.+|linkedin\.com\/.+|youtube\.com\/.+|youtu\.be\/.+)" />
										<form:input path="socialMediaPlatform" value="${entry.platform}" cssClass="form-input w-full ml-2 px-2" list="socialMediaList" id="socialMediaInput" readOnly="readOnly"/>
										
										<a href="/Final_JN/profile/deleteSocial/${entry.accountId}/<%= session.getAttribute("companyId") %>"><button type="button" class="btn-primary text-white py-1 px-3 rounded ml-2">
											<i class="fa-solid fa-xmark" style="color: #ffffff;"></i> 
										</button>  
										</a>
										
										</div>
										
									</c:forEach>
								
							</c:when>
							<c:otherwise>
								<!-- Default UI with placeholders if socialMedia is empty -->
								<div class="flex">
									<form:input path="socialMediaUrls"  
										placeholder="Paste your link" pattern="(https?:\/\/)?(www\.)?(facebook\.com\/.+|twitter\.com\/.+|instagram\.com\/.+|linkedin\.com\/.+|youtube\.com\/.+|youtu\.be\/.+)"
										cssClass="socialMediaUrls form-input w-full" />
									 <select name="socialMediaPlatform" class="form-input w-full ml-2 px-2">
					 	               <option value="" disabled selected>Select Platform</option>
					 	               <option value="Facebook">Facebook</option>
					 	               <option value="Instagram">Instagram</option>
					 	               <option value="LinkedIn">LinkedIn</option>
					 	               <option value="Twitter">Twitter</option>
					 	           </select>
									<button type="button"
										class="btn-primary text-white py-1 px-3 rounded ml-2"
										onclick="addSocialMediaField()">+</button>
								</div>
							</c:otherwise>
						</c:choose>
						
					

			</div>


			<div class="flex mt-2">
				<div class="mb-4 flex">
					<form:label path="workingPolicy"
						cssClass="text-sm font-medium mr-4">Policy</form:label>
					<form:select path="workingPolicy" cssClass="form-select w-30">

						<form:option value="Remote" label="Remote" />
						<form:option value="Onsite" label="On-site" />
						<form:option value="Hybrid" label="Hybrid" />

					</form:select>
				</div>
				<div class="ml-4 mb-4 flex">
					<form:label path="companySize" cssClass="text-sm font-medium mr-2">Company Size</form:label>
					<form:select path="companySize" cssClass="form-select w-full">
						<form:option value="Small" label="Small (1-50 employees)" />
						<form:option value="Medium" label="Medium (51-250 employees)" />
						<form:option value="Large" label="Large (251+ employees)" />
					</form:select>
				</div>
			</div>


			<div class="mb-4 flex  mt-2">
				<label class="text-sm font-medium mr-5">Benefits</label>
				<div class="flex">
					<input type="text" id="benefitInput" class="form-input w-full px-2"
						placeholder="Add benefits" />
					<button type="button"
						class="btn-primary text-white py-1 px-3 rounded ml-2"
						onclick="addBenefits()">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
							class="w-4 h-4" viewBox="0 0 512 512">
                        <path
								d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
                    </svg>
					</button>
					
				</div>
				
			</div>
		
			<input type="hidden" name="benefits" id="benefits" />
			<div id="benefitsContainer"
				class="mt-2 flex justify-start gap-2  mb-5"></div>
			<div class="mb-4">
				<form:label path="description"
					cssClass="block text-sm font-medium mb-1">About</form:label>
				<form:textarea path="description"
					cssClass="form-input mt-1 block w-full px-2" rows="4" />
			</div>

			<div class="flex justify-end space-x-4">
				<button type="reset"
					class="btn-primary text-white py-2 px-4 rounded">Cancel</button>

				<button type="submit" 
					class="btn-primary text-white py-2 px-4 rounded">Save
					Changes</button>
			</div>
		</form:form>



	</div>

	<script type="text/javascript">
	

	const benefitsString = '<c:out value="${profile.benefits}" />';
	
	const benefits = benefitsString
    .split(',') // Split by comma
    .map(benefit => benefit.trim())  // Trim each value
    .filter(benefit => benefit.length > 0);  // Remove empty values

    console.log(benefits);
	function addBenefits() {
		const benefitInput = document.getElementById('benefitInput');
		console.log(benefitInput);
		const benefitValue = benefitInput.value.trim();

		if (benefitValue && !benefits.includes(benefitValue)) { // Prevent duplicate
			// Add skill to the array
			benefits.push(benefitValue);
			console.log(benefits);
			
			updateBenefitsDisplay();
			
			// Clear the input field
			benefitInput.value = '';

			// Update the hidden input field with comma-separated skills
			updateBenefitsInput();
		}
	}
    
	// Function to handle deleting a benefit
    function deleteBenefit(index) {
        // Remove the benefit from the array
        benefits.splice(index, 1);

        // Update the display
        updateBenefitsDisplay();

        // Update the hidden input field with comma-separated benefits
       updateBenefitsInput();
    }
	
	

	function updateBenefitsInput() {
		const benefitsInput = document.getElementById('benefits');
		benefitsInput.value = benefits.join(', ');
		console.log(benefitsInput);// Update hidden input field with comma-separated list
	}
	const benefitsInput = document.getElementById('benefits');	
	benefitsInput.value = benefits;
	console.log(benefitsInput);
	
	function updateBenefitsDisplay() {
        const benefitsContainer = document.getElementById('benefitsContainer');
        benefitsContainer.innerHTML = ''; // Clear current display
        benefits.forEach((benefit, index) => {
            const newSpan = document.createElement('span');
            newSpan.className = 'w-fit h-fit benefit_card px-2 py-1 rounded-lg';
            newSpan.textContent = benefit;
            
         // Create and append the delete button
            const deleteButton = document.createElement('button');
            deleteButton.className = 'text-white text-xs font-bold bg-white-500 hover:bg-white-700 rounded-full pl-2 ';
            deleteButton.textContent = '✖';  // Unicode for 'X' or 'cross'
            deleteButton.onclick = () => deleteBenefit(index);
           
            
            newSpan.appendChild(deleteButton);
            benefitsContainer.appendChild(newSpan);
        });
    }
	// Initialize display with existing benefits
    updateBenefitsDisplay();

 
  
	
	
	//socia media
     function addSocialMediaField() {
 	    const container = document.getElementById('socialMediaContainer');
 	    const newFieldSet = document.createElement('div');
 	    newFieldSet.className = 'flex mt-2 block'; 
 	    newFieldSet.innerHTML = `
 	        <div class="flex">
 	            <input type="text" name="socialMediaUrls" placeholder="Paste your link" pattern="(https?:\/\/)?(www\.)?(facebook\.com\/.+|twitter\.com\/.+|instagram\.com\/.+|linkedin\.com\/.+|youtube\.com\/.+|youtu\.be\/.+)"
 	            		class="socialMediaUrls form-input w-full px-2" />
 	            <select name="socialMediaPlatform" class="form-input w-full ml-2">
 	               <option value="" disabled selected>Select Platform</option>
 	               <option value="Facebook">Facebook</option>
 	               <option value="Instagram">Instagram</option>
 	               <option value="LinkedIn">LinkedIn</option>
 	               <option value="Twitter">Twitter</option>
 	           </select>
 	          <button type="button" class="btn-primary text-white py-1 px-3 rounded ml-2" onclick="deleteSocialMediaField(this)">
				<i class="fa-solid fa-xmark" style="color: #ffffff;"></i>
			</button>	
 	        </div>
 	    `;
 	    container.appendChild(newFieldSet);
 	}
	
     
     function deleteSocialMediaField(button) {
         // Find the closest parent div of the button
         const fieldSet = button.closest('div.flex.mt-2.block');
         if (fieldSet) {
             fieldSet.remove(); 
         }
     }

	
	
    
     document.getElementById('socialMediaInput').addEventListener('input', function () {
       var input = this;
       var pattern = new RegExp(input.pattern); 
       var errorElement = document.getElementById('url_error');
       
       if (input.value === '' || pattern.test(input.value)) {
         errorElement.style.display = 'none'; 
       } else {
         errorElement.style.display = 'block'; 
       }
     });
     
    
     const validOptions = ["Facebook", "Instagram", "LinkedIn", "Twitter"];
     const inputField = document.getElementById("socialMediaInput");
     const errorMessage = document.getElementById("error-message");

     inputField.addEventListener("input", function() {
         if (!validOptions.includes(inputField.value)) {
             errorMessage.style.display = "block"; // Show error message
             inputField.setCustomValidity("Please select a valid option.");
         } else {
             errorMessage.style.display = "none"; // Hide error message
             inputField.setCustomValidity(""); // Reset custom validity
         }
     });
 
     function validateIndustryType(input) {
    	    var value = input.value.toLowerCase();
    	    var errorSpan = document.getElementById("industryError");

    	    if (value.includes("no")) {
    	        errorSpan.classList.remove("hidden");
    	    } else {
    	        errorSpan.classList.add("hidden");
    	    }
    	}

</script>
</body>

</html>