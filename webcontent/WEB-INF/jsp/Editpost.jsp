<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Post</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
.custom-bg {
	background-color: #C1C1EB;
}

.custom-bg1 {
	background-color: #C1C1EB;
}

.form-input, .form-select {
	border: 1px solid #000000;
	border-radius: 0.375rem;
}
</style>
 
<script>
	


function toggleEducationDetail(show) {
    const detailDiv = document.getElementById('educationDetailDiv');
    detailDiv.style.display = show ? 'flex' : 'none';

    const inputField = detailDiv.querySelector('input');
    if (inputField) {
        inputField.value = show ? '' : 'Undergraduate'; // Set default value if not shown
        console.log(inputField.value);
    }
}
	

</script>



</head>
<body class="bg-gray-100 p-10">
	<div
		class="max-w-2xl mx-auto bg-white p-6 rounded-lg border-2 border-purple-400">
		<h1 class="text-xl font-semibold mb-4 border-b pb-5 border-gray-800">Create
			Post</h1>
			<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>
		<form:form action="/Final_JN/updatePost" method="post"
			modelAttribute="post" id="editPostForm">
			<form:hidden path="companyId" />
			<input type="hidden" name="jobId" value="${post.jobId}" />

			<div class="flex flex-col space-y-4 mb-4 items-center">
				<div class="flex items-center">
					<label for="position" class="text-sm font-medium mr-7">Position</label>
					<form:input path="jobTitle" id="position" class="form-input w-full p-2" />
				</div>
				<div class="flex items-center">
					<label for="categories" class="text-sm font-medium mr-3">Job
						Categories</label>
					<form:select path="jobCategory" id="categories"
						class="form-select w-full text-sm p-2">
						<form:option value="Software Development" label="Software Development" />
						    <form:option value="Engineering" label="Engineering" />
						    <form:option value="Marketing" label="Marketing" />
						    <form:option value="Business Management" label="Business Management" />
						    <form:option value="Healthcare" label="Healthcare" />
						    <form:option value="Education" label="Education" />
						    <form:option value="Finance" label="Finance" />
						    <form:option value="Human Resources" label="Human Resources" />
						    <form:option value="Sales" label="Sales" />
						    <form:option value="Data Science" label="Data Science" />
						    <form:option value="Operations Management" label="Operations Management" />
						    <form:option value="Creative & Design" label="Creative & Design" />
						    <form:option value="Customer Service" label="Customer Service" />
						    <form:option value="Legal" label="Legal" />
						    <form:option value="Information Technology" label="Information Technology" />
						    <form:option value="Manufacturing" label="Manufacturing" />
						    <form:option value="Construction" label="Construction" />
						    <form:option value="UI UX Software Design" label="UI UX Software Design" />
						    <form:option value="Public Relation" label="Public Relations" />
						    <form:option value="Project Management" label="Project Management" />
					</form:select>
				</div>
			</div>

			<h2
				class="text-lg mb-4 font-semibold mb-2 relative after:content-[''] after:block after:w-40 after:h-[3px] after:bg-gray-300 after:mt-2">Job
				Detail</h2>
			<div
				class="p-4 custom-bg rounded-lg mb-4 items-center border-2 border-purple-400">
				<div class="mb-4 flex items-center">
					<label class="px-10 block text-sm font-medium text-gray-700">Job
						Type</label>
					<div class="ml-7 items-center justify-center">
						<form:radiobutton path="employmentType" value="Full-time"
							class="form-radio" />
						<span class="ml-2 text-sm">Full-time</span>
						<form:radiobutton path="employmentType" value="Part-time"
							class="form-radio" />
						<span class="ml-2 text-sm">Part-Time</span>
						<form:radiobutton path="employmentType" value="Internship"
							class="form-radio" />
						<span class="ml-2 text-sm">Internship</span>
					</div>
				</div>

				<div class="mb-4 flex items-center">
					<label class="px-10 block text-sm font-medium text-gray-700">Work
						Setting</label>
					<div class="items-center justify-center">
						<form:radiobutton path="workSetting" value="Remote"
							class="form-radio" />
						<span class="ml-2 text-sm">Remote</span>
						<form:radiobutton path="workSetting" value="Onsite"
							class="form-radio" />
						<span class="ml-2 text-sm">On-Site</span>
						<form:radiobutton path="workSetting" value="Hybrid"
							class="form-radio" />
						<span class="ml-2 text-sm">Hybrid</span>
					</div>
				</div>

				<div class="mb-4 flex items-center">
					<label for="salary" class="px-10 text-sm font-medium text-gray-700">Salary</label>
					<div class="flex items-center mt-1">
						<form:input path="salary" id="salary"
							class="ml-12 w-full p-0.4 border border-gray-300 rounded mr-2 px-2" pattern="^[0-9]+$"
							/>
						<form:select path="salaryType"
							class="p-0.4 form-select border border-gray-300 rounded">
							<form:option value="Per day" label="Per day" />
							<form:option value="Per month" label="Per month" />
							<form:option value="Per year" label="Per year" />
						</form:select>
					</div>
				</div>
				<div class="mb-4 flex items-center">
    <form:label path="isNegotiable" cssClass="px-10 block text-sm font-medium text-gray-700 mr-3">
        Negotiable
    </form:label>
    <div class="items-center justify-center">
        <!-- Checkbox input -->
        <form:checkbox path="isNegotiable" id="isNegotiableCheckbox" cssClass="form-checkbox" />
        <span class="ml-2 text-sm">Negotiable</span>
    </div>
</div>
				



				




			</div>

			<h2
				class="text-lg mb-4 font-semibold mb-2 relative after:content-[''] after:block after:w-40 after:h-[3px] after:bg-gray-300 after:mt-2">Requirements</h2>
			<div class="p-4 border-2 border-purple-400 rounded-lg mb-4">
				<div class="mb-4 flex items-center">
					<label class="px-10 text-sm font-medium text-gray-700">Skills</label>
					<div class="ml-14 items-center justify-center flex">
						<input type="text" id="skillInput"
							class="w-full p-2 border border-gray-300 rounded mr-2 p-2"
							placeholder="Add a skill" />
						<button type="button" class="p-2 ml-6" onclick="addSkill()">
							<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
								class="w-4 h-4" viewBox="0 0 512 512">
                        <path
									d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
                    </svg>
						</button>
					</div>
				</div>
				<form:hidden path="skills" id="skillshidden" />
    <div id="skillsContainer" class="mt-2 flex  justify-start gap-2 px-10 mb-5"></div>
	
	
   <c:set var="trimmedEducationbyJob" value="${fn:replace(fn:replace(educationbyJob, '[', ''), ']', '')}" />
    <div class="mb-4 flex items-center">
    <label class="px-10 block text-sm font-medium text-gray-700">Education</label>
    <div class="ml-7 items-center justify-center">
        <input type="radio" name="edu" value="Undergraduate" class="form-radio" 
            <c:if test="${trimmedEducationbyJob == 'Undergraduate'}">checked</c:if>
            onclick="toggleEducationDetail(false)" />
        <span class="ml-2 text-sm">Undergraduate</span>

        <input type="radio" name="edu" value="Graduate" class="form-radio" 
            <c:if test="${trimmedEducationbyJob != 'Undergraduate'}">checked</c:if>
            onclick="toggleEducationDetail(true)" />
        <span class="ml-2 text-sm">Graduate</span>
    </div>
	</div>

	<!-- Initially hidden input field for Graduate -->
	<c:if test="${trimmedEducationbyJob == 'Undergraduate'}">
	    <div id="educationDetailDiv" class="mb-4 flex items-center hidden">
	    <label for="educationLevel" class="px-10 block text-sm font-medium text-gray-700">Education Level</label>
	    <input name="educationLevel" id="educationLevel" class="mt-1 p-2 border-2 border-gray-100"
	       value="${fn:replace(fn:replace(educationbyJob, '[', ''), ']', '')}" />
		</div>
	</c:if>
	
	 <c:if test="${trimmedEducationbyJob != 'Undergraduate'}">
	 	<div id="educationDetailDiv" class="mb-4 flex items-center">
	    <label for="educationLevel" class="px-10 block text-sm font-medium text-gray-700">Education Level</label>
	    <input name="educationLevel" id="educationLevel" class="mt-1 p-2 border-2 border-gray-300"
	       value="${fn:replace(fn:replace(educationbyJob, '[', ''), ']', '')}" />
		</div>
	  </c:if>


			</div>

			<h2
				class="text-lg mb-4 font-semibold mb-2 relative after:content-[''] after:block after:w-40 after:h-[3px] after:bg-gray-300 after:mt-2">Full
				Job Description</h2>
			<div class="mb-4 flex items-center">
				<label for="jobSummary"
					class="px-10 block text-sm font-medium text-gray-700">Job
					Summary</label>
				<form:input path="jobSummary" id="jobSummary"
					class="w-full mt-1 p-2 border border-gray-300 rounded" />
			</div>

			<div class="mb-4">
				<label for="qualification"
					class="px-10 block text-sm font-medium text-gray-700">Required
					Qualification</label>
				<div class="ml-10">
					<form:textarea path="requiredQualification" id="qualification"
						class="w-full mt-3 p-2 border border-gray-300 rounded" rows="4" />
				</div>
			</div>
			<div class="mt-3 w-full">
				<span class="text-sm font-bold text-red-500">Editing a post will reduce 5 points. Please be aware before saving the post.</span>
			</div>
			<div class="flex justify-between mt-3">
				<a href="/Final_JN/companyProfile"><button type="button" class="p-2 bg-gray-300 rounded">Back</button></a>
				<button type="submit" class="p-2 bg-purple-600 text-white rounded">Save</button>
			</div>
		</form:form>
	</div>
	<script>
	
const skillOutputs = '<c:out value="${skillsbyJob}"/>';
	

console.log(skillOutputs);
const skillss = skillOutputs
  .replace(/[\[\]]/g, '')  // Remove square brackets
  .split(',')  // Split by comma
  .map(skill => skill.trim())  // Trim each value
  .filter(skill => skill.length > 0);  // Remove empty values

console.log(skillss);

	function addSkill() {
		const skillInput = document.getElementById('skillInput');
		console.log(skillInput);
		const skillValue = skillInput.value.trim();

		if (skillValue && !skillss.includes(skillValue)) { // Prevent duplicate
			// Add skill to the array
			skillss.push(skillValue);
			console.log(skillss);
			
			updateSkillsDisplay();
			
			// Clear the input field
			skillInput.value = '';

			// Update the hidden input field with comma-separated skills
			updateSkillsInput();
		}
	}
	function deleteSkill(index) {
        // Remove the benefit from the array
        skillss.splice(index, 1);

        // Update the display
        updateSkillsDisplay();

        // Update the hidden input field with comma-separated benefits
       updateSkillsInput();
    }
	
	

	function updateSkillsInput() {
		const skillsInput = document.getElementById('skillshidden');
		skillsInput.value = skillss.join(', ');
		console.log(skillsInput);// Update hidden input field with comma-separated list
	}
	const skillsInput = document.getElementById('skillshidden');	
	skillsInput.value = skillss;
	console.log(skillsInput);
	
	function updateSkillsDisplay() {
        const skillsContainer = document.getElementById('skillsContainer');
        skillsContainer.innerHTML = ''; // Clear current display
        skillss.forEach((skill, index) => {
            const newSpan = document.createElement('span');
            newSpan.className = 'w-fit h-fit bg-[#E6E6FA] benefit_card px-2 py-1 rounded-lg';
            newSpan.textContent = skill;
            
         // Create and append the delete button
            const deleteButton = document.createElement('button');
            deleteButton.className = 'text-white text-xs font-bold bg-white-500 hover:bg-white-700 rounded-full pl-2 ';
            deleteButton.textContent = '✖';  // Unicode for 'X' or 'cross'
            deleteButton.onclick = () => deleteSkill(index);
           
            
            newSpan.appendChild(deleteButton);
            skillsContainer.appendChild(newSpan);
        });
    }
	updateSkillsDisplay();
    
	</script>
</body>
</html>
