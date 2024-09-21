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
.table-row-gap {
        margin-bottom: 10px; /* Adjust this value for more/less space */
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
.custom-bg1{
	background-color: #f4122e;
	
}
.custom-bg2{
background-color: #E6E6FA;
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
				<!-- Nav Panel -->
				<div
					class="bg-[#FFFFFF] opacity-90 w-56 h-auto p-3 rounded-lg flex-col justify-center gap-2 shadow-md">
					<div class="flex items-center justify-center">
						<img src="<%= contextPath %>/resources/images/logo.png" class="w-32 h-20">
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
						class="flex items-center justify-start p-2 mt-3 hover-bg-opacity active rounded">
						<a href="adminPayment"> <i class="fa-solid fa-money-check-dollar"
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

							&nbsp; <span class="text-xl font-bold text-white">Check
								Payment</span>
						</div>
						<div class="flex justify-end justify-self-end gap-3">
    <span id='ct' class="rounded p-2 text-white"></span>
    <!-- <i class="fa-solid fa-bell" style="color: #ffffff; font-size:20px; margin-top:7px;"></i> -->
    <img src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}" class="w-10 h-10 rounded-full">
</div>                  
					</div>
					<!-- Payment -->
					<div
						class="w-full h-58 flex flex-col justify-start mt-5 bg-white shadow-md rounded p-5">
						<div class="w-full flex flex-row flex-nowrap gap-2">

							<div
								class="w-3/4 flex-col flex-wrap justify-between overflow-y-scroll hide-scrollbar"
								style="height: 350px;">
								<table class="w-full border-2">
									<thead>
										<tr>
											<th class="px-4 py-2 text-sm">Id</th>
											<th class="px-4 py-2 text-sm">Purchased Points</th>
											<th class="px-4 py-2 text-sm">Cost</th>
											<th class="px-4 py-2 text-sm">Date/Time</th>
											<th class="px-4 py-2 text-sm">Approve</th>
											<th class="px-4 py-2 text-sm">Actions</th>
									</thead>
									<tbody class="border-2">
										<c:forEach var="payment" items="${payments}">
											<tr class="border-2 custom-bg2 table-row-gap">
												<td class="px-4 py-2 text-xs">${payment.companyId}</td>
												<td class="px-4 py-2 text-xs">${payment.purchasedPoints}</td>
												<td class="px-4 py-2 text-xs">${payment.cost}</td>
												<td class="px-4 py-2 text-xs">${payment.paymentDate}</td>
												<td class="px-4 py-2 text-xs">
													<!-- Approve/Cancel Forms -->
													<div class="button-container" style="display: flex; flex-direction: column; align-items: stretch; gap: 10px;">
    <form action="/Final_JN/approvePayment" method="post">
        <input type="hidden" name="paymentId" value="${payment.paymentId}">
        <input type="hidden" name="companyId" value="${payment.companyId}">  
         <input type="hidden" name="pointAmount" value="${payment.purchasedPoints}">        
        <a href="" class="custom-bg text-white px-4 py-1 rounded" style="width: 100%;">Approve</a>
    </form>
    <form action="/Final_JN/cancelPayment" method="post">
        <input type="hidden" name="paymentId" value="${payment.paymentId}">
        <a href="" class="custom-bg1 text-white px-4 py-1 rounded" style="width: 100%;">Cancel</a>
    </form>
</div>
													
												</td>
												<td class="px-4 py-2 flex justify-center">

													<form method="post" action="/Final_JN/adminPayment"
														class="inline-block">
														<input type="hidden" name="paymentId"
															value="${payment.paymentId}">
														<button type="submit" class="mx-1 ">
															<i class="fa-solid fa-file-export"></i>
														</button>
													</form>

													<!--<form method="POST" action="/Final_JN/deletePayment" >-->
    <input type="hidden" name="paymentId" value="${payment.paymentId}"><!-- Hidden input to pass the item ID -->
    <button class="deletebtn">
        <i class="fa-solid fa-trash"></i>
    </button>

												</td>
											</tr>
											<div class="fixed inset-0 flex items-center justify-center w-full h-full hidden bg-black bg-opacity-50" id="DeleteBox">
            <div class="bg-white w-1/3 p-6 rounded-lg shadow-lg">
                <h2 class="text-lg font-semibold mb-4">Are You sure to delete this payment record?</h2>
                <form action="/Final_JN/deletePayment" method="post" style="display: inline;" id="deleteForm">
          <input type="hidden" name="paymentId" value="${payment.paymentId}"><!-- Hidden input to pass the item ID -->
                   
                    <div class="flex justify-end">
                        <button type="button" class="bg-gray-300 text-black px-4 py-2 rounded mr-2" onclick="hideBox()">Cancel</button>
                        <button type="submit" class="custom-bg1 text-white px-4 py-2 rounded">Delete</button>
                    </div>
                </form>
            </div>
        </div>
										</c:forEach>
									</tbody>

								</table>
							</div>

							<!-- Screenshot Column -->
							<div
								class="w-1/4 border-l-2 border-gray-300 flex flex-col flex-nowrap gap-3 px-8">
								<div>
									<span class="text-lg font-bold">Payment Screenshot</span>
									<div id="screenshotContainer">
										<c:choose>
											<c:when test="${not empty screenshotUrl}">
												<img
													src="<%= contextPath %>/resources/upload_img/${screenshotUrl}"
													alt="Payment Screenshot" class="payment-screenshot">
											</c:when>
											<c:otherwise>
												<p class="error-message"></p>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>


						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
<script>
const deleteButtons = document.querySelectorAll('.deletebtn');

// Add event listener to each delete button
deleteButtons.forEach(function(btn, index) {
	btn.addEventListener("click", function() {
		const deleteBox = document.querySelectorAll('#DeleteBox')[index];
		deleteBox.classList.toggle('hidden');
		
	});
});

function hideBox() {
	// Ensure the correct delete box is hidden
	document.querySelectorAll('#DeleteBox').forEach(box => box.classList.add('hidden'));
	
}

function confirmLogout(event) {
    event.preventDefault();  // Prevent the default anchor behavior
    if (confirm("Are you sure you want to log out?")) {
        window.location.href = '/Final_JN/logout';  // Redirect to logout if confirmed
    }
}
</script>

</body>
</html>
