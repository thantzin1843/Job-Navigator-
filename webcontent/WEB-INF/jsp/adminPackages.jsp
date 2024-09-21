<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<!-- Cabin font -->
<link href='https://fonts.googleapis.com/css?family=Cabin'
	rel='stylesheet'>
<!-- Icons -->
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
	display: none;
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

.custom-bg {
	background-color: #7905EE;
}

.custom-bg1 {
	background-color: #7905EE;
}

.disabled-background {
	pointer-events: none;
	filter: blur(5px);
}

.custom-bg2 {
	background-color: #D9D9D9;
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
<body class="font-cabin bg-[#F6F3F3]" onload=display_ct();>


	<div class="container max-w-screen-xl mx-auto p-2 h-screen"
		id="container">
		<div class="w-full h-72 bg-[#9696E8] rounded relative">
			<div class="w-full px-6 pt-6 absolute flex gap-3">
				<!-- Nav Panel -->
				<div
					class="bg-[#FFFFFF] opacity-90 w-56 h-auto p-3 rounded-lg flex-col justify-center gap-2 shadow-md">
					<div class="flex items-center justify-center">
						<img src="<%=contextPath%>/resources/images/logo.png"
							class="w-32 h-20">
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
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
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity  rounded">
						<a href="adminPayment"> <i class="fa-solid fa-money-check-dollar"
							style="color: #000000; font-size: 15px;"></i> &nbsp; <span
							class="text-base font-normal">Check Payment</span>
						</a>
					</div>

					<div
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity active rounded">
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
							<a href="#"  onclick="confirmLogout(event)"> <i class="fa-solid fa-arrow-right-from-bracket"
								style="color: #000000; font-size: 15px;"></i> &nbsp; <span
								class="text-base font-normal">Logout</span>
							</a>
						</div>
					</div>
				</div>

				<!-- Content -->
				<div class="w-11/12 mt-5 mx-3">
					<div class="flex flex-row justify-between flex-wrap">
						<div class="justify-self-start">
							&nbsp; <span class="text-xl font-bold text-white">Manage
								Points Packages</span>
						</div>
						<div class="flex justify-end justify-self-end gap-3">
							<span id='ct' class="rounded p-2 text-white"></span> 
							<!-- <i
								class="fa-solid fa-bell"
								style="color: #ffffff; font-size: 20px; margin-top: 7px;"></i>-->
								 <img
								src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}"
								class="w-10 h-10 rounded-full">

						</div>
					</div>

					<!-- Point Change Section -->
					<div class=" w-full mt-8 p-6 bg-white shadow-md rounded">


						<div class="flex justify-between items-center mb-6">
							<span>Total: ${packages.size()} packages</span>
							<button class="custom-bg text-white px-4 py-2 rounded"
								id="addbtn">+ Add Points</button>
						</div>
						<form:form action="/Final_JN/adminPackages/update"
							method="POST" modelAttribute="adminPackage">
							<input type="hidden" name="packageId" id="packageIdInput"
								value="">
							<div
								class=" flex items-center mb-6 custom-bg2 px-4 py-3 rounded-lg justify-center">
								<label for="points" class="mr-2">Points:</label> <input
									type="text" id="points" value="" name="points"
									class="border border-gray-300 rounded p-2 mr-4" /> <label
									for="cost" class="mr-2">Cost:</label> <input type="text"
									id="cost" value="" name="cost"
									class="border border-gray-300 rounded p-2 mr-4" />
								<button class="custom-bg text-white px-4 py-2 rounded">Save</button>
							</div>
							<c:if test="${not empty message}">
								<p style="color: red;">${message}</p>
							</c:if>
							<c:if test="${not empty message1}">
								<p style="color: blue;">${message1}</p>
							</c:if>
						</form:form>
						<div class="grid grid-cols-2 gap-4">
							<c:forEach items="${packages}" var="pkg">
							<div>
    <div class="packages cursor-pointer border-2 rounded-lg">
        <input type="hidden" name="packageId" value="${pkg.packageId}">
        <script>
            console.log('${pkg.packageId}');
        </script>

        <div class="p1 flex justify-between items-center border-2 border-gray-300 rounded-lg p-4">
            <span><i class="fa-solid fa-star text-red-500"></i> 
                <span id="${pkg.packageId}points">${pkg.points}</span> Points
            </span> 
            <span>
                <span id="${pkg.packageId}cost">${pkg.cost}</span> kyats
            </span>
            <button class="deletepackagebtn">
                <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 mr-2" viewBox="0 0 448 512">
                    <path d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z" />
                </svg>
            </button>
        </div>

        <!-- Display the error message only if it matches the current packageId -->
        

        <div class="fixed inset-0 flex items-center justify-center w-full h-full hidden bg-black bg-opacity-50" id="DeletePackageBox">
            <div class="bg-white w-1/3 p-6 rounded-lg shadow-lg">
                <h2 class="text-lg font-semibold mb-4">Are You sure to delete this package?</h2>
                <form action="/Final_JN/adminPackages/delete" method="post" style="display: inline;" id="deleteForm">
                    <input type="hidden" name="packageId" value="${pkg.packageId}">
                    <script>
                        console.log(${pkg.packageId});
                    </script>
                    <div class="flex justify-end">
                        <button type="button" class="bg-gray-300 text-black px-4 py-2 rounded mr-2" onclick="hideBox()">Cancel</button>
                        <button type="submit" class="custom-bg1 text-white px-4 py-2 rounded">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <c:if test="${errorPackageId == pkg.packageId}">
            <p style="color: red;">${message2}</p>
        </c:if>
        </div>
</c:forEach>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- add points -->
	<div
		class="fixed inset-0 flex items-center justify-center w-full h-full hidden bg-black bg-opacity-50"
		id="AddBox">
		<div class="bg-white w-1/3 p-6 rounded-lg shadow-lg">
			<h2 class="text-lg font-semibold mb-4">Add Points</h2>
			<form action="/Final_JN/adminPackages/add" method="POST"
				id="addPackageForm">
				<input type="text" name="points" placeholder="Enter points"
					class="p-2 border border-gray-300 rounded w-full mb-4" /> <input
					type="text" name="cost" placeholder="Enter cost"
					class="p-2 border border-gray-300 rounded w-full mb-4" />
				<div class="flex justify-end">
					<button type="button"
						class="bg-gray-300 text-black px-4 py-2 rounded mr-2"
						onclick="hideBox1()">Cancel</button>
					<button type="submit"
						class="custom-bg text-white px-4 py-2 rounded">Save</button>
				</div>
			</form>
		</div>
	</div>


<script>
	

	document.addEventListener('DOMContentLoaded', function() {
	    const packages = document.querySelectorAll('.packages');
	    
	    packages.forEach(package => {
	        package.addEventListener('click', function() {
	            // Remove 'border-active' class from any currently active package
	            const activePackage = document.querySelector('.packages.border-active');
	            if (activePackage && activePackage !== this) {
	                activePackage.classList.remove('border-active');
	            }

	            // Add 'border-active' class to the currently selected package
	            this.classList.add('border-active');

	            // Update selected package ID
	            const selectedPackageId = this.querySelector('input[name="packageId"]');
	            if (selectedPackageId) {
	                const id = selectedPackageId.value;

	                // Set the packageIdInput value
	                document.getElementById('packageIdInput').value = id;

	                // Access the points element using a dynamic ID and set its value
	                const pointsElement = document.getElementById(id + 'points');
	                const costElement = document.getElementById(id + 'cost');
	                
	                document.getElementById('points').value = pointsElement ? pointsElement.innerHTML : '';
	                document.getElementById('cost').value = costElement ? costElement.innerHTML : '';
	            } else {
	                alert('No package selected');
	            }
	        });
	    });

	    const addbtn = document.getElementById('addbtn');
	    addbtn.addEventListener("click", function() {
	        document.getElementById('AddBox').classList.toggle('hidden');
	        document.getElementById('container').classList.toggle('blurred');
	    });

	    function hideBox() {
	        document.getElementById('DeletePackageBox').classList.add('hidden');
	    }

	    function hideBox1() {
	        document.getElementById('AddBox').classList.add('hidden');
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
