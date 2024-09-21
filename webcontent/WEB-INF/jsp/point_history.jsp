<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Navigator - Point History</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
<style>
.custom-bg {
	background-color: #C1C1EB;
}

.custom-bg1 {
	background-color: #9696E8;
	;
}

.custom-tab-active {
	border-bottom: 2px solid #C1C1EB;
	padding-bottom: 4px;
}
 .hide-scrollbar::-webkit-scrollbar {
            
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        
</style>
 <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
     
</head>
<body class="bg-gray-100 px-6 pb-6">
<div class="px-4  ml-5 w-fit h-fit ">
		<a href="/Final_JN/">
            <h6 class="text-base font-medium"> 
            <i class="fa-solid fa-arrow-left"> </i>Back</h6>
        </a>
 </div>
	<div
		class="max-w-2xl mx-auto bg-white shadow-md rounded-lg p-6 border-2 border-purple-400">

		<div class="custom-bg rounded-lg py-4">
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
					<span class="ml-10">Latest Update</span> <span class="mr-10">
						<fmt:formatDate value="${cp.lastUpdated}" pattern="dd MMMM, yyyy HH:mm:ss" var="formattedDate" />
        				<p>${formattedDate}</p>
					</span>
				</div>
			</c:forEach>
		</div>

		<div class="mt-6">
			<div class="flex justify-between items-center border-b pb-2 mb-4">
				<div class="text-lg font-semibold">Point History</div>
				<div class="text-sm text-white custom-bg1 py-1 px-2 rounded-lg">*
					${phistory.size()} results *</div>
			</div>


			<div class="container flex items-center justify-center">
				<div
					class="flex justify-center space-x-8 mb-4 border p-2 border-gray-300">
					<button id="purchase-tab"
						class="font-semibold custom-tab text-purple-600 focus:outline-none"
						onclick="switchTab('purchase-tab'), view_pur()">Points Purchased
						History</button>
					<button id="use-tab"
						class="font-semibold text-black focus:outline-none"
						onclick="switchTab('use-tab'), view_use()">Points Used History</button>
				</div>
			</div>

			<div id="purchase" class="h-96 overflow-y-scroll p-3 hide-scrollbar">  <!--  -->
				<c:forEach var="transaction" items="${phistory}">
					<c:if test="${transaction.transactionType == 'purchase'}">
						<div class="border border-gray-800 rounded-lg p-4 mb-4">
							<div class="flex justify-between items-center">
								<div class="flex justify-between items-center ml-5">
									  ${transaction.dateOnly},
										<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-red-500 mr-1" viewBox="0 0 512 512">
		                                  <path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120l0 136c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2 280 120c0-13.3-10.7-24-24-24s-24 10.7-24 24z" />
		                                </svg>
										${transaction.timeOnly}	
										
									  <c:choose>
						                    <c:when test="${transaction.paymentStatus == 'Pending'}">
						                       <span class="text-sm text-blue-800" > &nbsp; (Pending)</span>
						                    </c:when>
						                    <c:when test="${transaction.paymentStatus == 'Approved'}">
						                        <span class="text-sm text-green-800" > &nbsp; (Approved)</span>
						                    </c:when>
						                    <c:when test="${transaction.paymentStatus == 'Cancelled'}">
						                        <span class="text-sm text-red-800" > &nbsp; (Cancelled)</span>
						                    </c:when>						                    
						                </c:choose>		 			 
								</div>
	
								<div class="text-green-500 flex justify-center items-center mr-5">
									<svg class="w-4 h-4 text-red-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
	                                <path d="M10 15l-5.5 3 1.5-5.8L1 7.3l5.9-.5L10 2l2.1 4.8 5.9.5-5 4.9 1.5 5.8z" />
	                                </svg>
									+ ${transaction.pointsAmount}
								</div>
							</div>
							<div class="text-gray-500 text-sm ml-5">Purchase ${transaction.cost} MMK</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			
			<div id="use" class="hidden h-96 overflow-y-scroll p-3 hide-scrollbar">   <!-- h-96 overflow-y-scroll p-3 hide-scrollbar -->
				<c:forEach var="transaction" items="${phistory}">
					<c:if test="${transaction.transactionType == 'used'}">
						<div class="border border-gray-800 rounded-lg p-4 mb-4">
                			<div class="flex justify-between items-center mb-2">
                    			<div class="flex justify-between items-center ml-5">${transaction.dateOnly},
                        			<svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4 text-red-500 mr-1" viewBox="0 0 512 512">
                            			<path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM232 120l0 136c0 8 4 15.5 10.7 20l96 64c11 7.4 25.9 4.4 33.3-6.7s4.4-25.9-6.7-33.3L280 243.2 280 120c0-13.3-10.7-24-24-24s-24 10.7-24 24z"/>
                        			</svg>${transaction.timeOnly}
                        		</div>
                    			<div class="text-red-500 flex justify-center items-center mr-5">
	                    			<svg class="w-4 h-4 text-red-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
	                        			<path d="M10 15l-5.5 3 1.5-5.8L1 7.3l5.9-.5L10 2l2.1 4.8 5.9.5-5 4.9 1.5 5.8z"/>
	                        		</svg>- ${transaction.pointsAmount}
                        		</div>
                			</div>
                			
            			</div>
					 </c:if>					 
				</c:forEach>
			
			
			</div>



		</div>
	</div>

	<script type="text/javascript">
		function switchTab(tabId) {

			document.getElementById('purchase-tab').classList
					.remove('custom-tab-active');
			document.getElementById('use-tab').classList
					.remove('custom-tab-active');
			document.getElementById('purchase-tab').classList
					.remove('text-purple-600');
			document.getElementById('use-tab').classList
					.remove('text-purple-600');

			document.getElementById(tabId).classList.add('custom-tab-active');
			document.getElementById(tabId).classList.add('text-purple-600');
			
			
		}

		switchTab('purchase-tab');
		
		function view_use(){
			document.getElementById('use').classList.remove('hidden');
			document.getElementById('purchase').classList.add('hidden');
		}
		
		function view_pur(){
			document.getElementById('use').classList.add('hidden');
			document.getElementById('purchase').classList.remove('hidden');
		}
		
		
		
	</script>

</body>
</html>
