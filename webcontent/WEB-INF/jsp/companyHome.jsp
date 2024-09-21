<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String companyName = (String) session.getAttribute("compName");
	String companyImage = (String) session.getAttribute("compImage");
	Integer points = (Integer) session.getAttribute("points");
	
	if(companyImage == null){
		companyImage ="default.jpg";
	}
					                
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:wght@200;300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
    
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
               extend:{
                  width: {
                  'custom-xsm': '3rem',
                  'custom-sm': '8rem', 
                  'custom-md': '12rem', 
                  'custom-lg': '16rem', 
                  'custom-xl': '20rem', 
                  },
                  height: {
                  'custom-xsm': '3rem',
                  'custom-sm': '8rem', 
                  'custom-md': '12rem', 
                  'custom-lg': '16rem', 
                  'custom-xl': '20rem', 
                  },
                  screens: {
                  'sm': '640px',
                  'md': '768px',
                  'lg': '1024px',
                  'xl': '1280px',
                  '2xl': '1536px',
                  },
                },
               fontFamily: {
                cabin: ['Cabin', 'sans-serif'],
               },
          }
            
        }
    </script>
    
      
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      
      <style>
         .slider {
            transition: transform 0.3s ease;
        }
        .content_text{
            font-size:8px;
            color:black;
        }
        .hide-scrollbar::-webkit-scrollbar {
            
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        @media (max-width: 800px){
           .noti{
            min-width:300px;
           }
        }
        .custom-rounded {
            border-radius: 0.5rem; 
        }
        .custom-bg{
            background-color: #E6E6FA;
        }
        .custom-bg1{
            background-color: #9696E8;
        }
        body.dark-mode {
            background-color: #1a202c; /* Dark background */
            color: #f7fafc; /* Light text color */
        }
        .dark-mode .custom-bg {
            background-color: #4a5568; /* Darker notification background */
        }
        .dark-mode .custom-bg1 {
            background-color: #718096; /* Darker header background */
        }
        .dark-mode .text-black {
            color: #f7fafc; /* Light text color */
        }
        .dark-mode .bg-white {
            background-color: #2d3748; /* Darker background for points */
        }
        .toggle-dot {
            transition: transform 0.3s ease;
        }
        input[type="checkbox"]:checked + label .toggle-dot {
            transform: translateX(1rem); /* Move the dot */
        }

        .notification-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 2px 5px;
            font-size: 10px;
            line-height: 1;
            }
		.w-full.h-auto.py-3.mt-6.mb-3 ul li:hover {
    background-color: #9696E8;
    transition: background-color 0.3s ease;
}

      </style>
</head>
<body>
    <header class="header custom-navbar" id="header">
        <nav class="nav container">
            <a href="#" class="nav-logo">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" width="150" height="auto">
            </a>

            <div class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/alljobs" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Find Jobs</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/search_company" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Find Companies</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/companyProfile" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Post Job</span>
                        </a>
                    </li>
                    <li class="nav-item flex gap-5 align-items-center">
                        <button class="w-8 h-8 rounded-full relative" onclick="showNoti()">
                                    <i class="fa-solid fa-bell" style="color: #ffffff; font-size: 20px;"></i>
                                    <c:if test="${notiCount != 0 }">
                                    	<span class="notification-count absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1">${notiCount }</span>
                                    </c:if>
                        </button> 
                       <button class="w-9 h-9 rounded-full" onclick="showSetting()">  <img src="${pageContext.request.contextPath}/resources/Upload_image/<%= companyImage %>" class="w-full h-full rounded-full"></button>
                    </li>
                </ul>
                <div class="nav-close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </div>
            <div class="nav-toggle" id="nav-toggle">
                <i class="ri-menu-line"></i>
            </div>
        </nav>
    </header>
    
    

     <div class="w-full h-auto noti_setting absolute">
     		     <!-- Noti part -->
            <div class="noti float-right mr-20 bg-[#E6E6FA] z-2 w-1/4 h-auto mt-3 rounded hidden" id="noti">
                <div class="flex flex-nowrap bg-[#9696E8] px-5 py-1 rounded">
                    <h2 class="font-semibold text-white text-lg rounded">Notifications</h2>
                </div>

                <div class="w-full h-1/2 px-3 py-3">
                    <div class="flex justify-between relative border-b-2  border-gray-200  w-2/3">
                        <button id="inboxButton" class="w-full py-2 text-center text-black font-semibold text-xs">
                            Inbox
                        </button>
                        <button id="confirmButton" class="w-full py-2 text-center text-black font-semibold text-xs">
                            Confirm Payment
                        </button>                       
                        <div id="slider" class="absolute bottom-0 left-0 h-1 bg-[#7905EE] rounded w-1/2 slider"></div>
                    </div>

                    <!-- Inbox -->
                    <div id="inboxContent" class="inbox_wrapper w-full max-h-80 overflow-y-scroll hide-scrollbar mt-3">
				 <c:forEach var="notification" items="${gnotifications}">
	 				<div  class="w-full px-3 py-2 bg-white mt-4 shadow-md rounded-lg">
                            <div class="w-full flex flex-row flex-nowrap justify-between ">
                                <img src="${pageContext.request.contextPath}/resources/images/icons/noti_resume.png" class="w-10 h-10 mt-2">
                                <div class="px-2 pt-2">
                                    <h6 class="font-bold text-xs">New Job Application Received</h6>
                                    <p class="text-gray-500 content_text "> ${notification.created_at}</p>
                                     
                                    <!-- <p class="content_text ">A new application for the ${notification.job_title} position has been received. Please review the application details.</p> -->
                                </div>
                                <div> 
                                <a href="${pageContext.request.contextPath}/approve/application/page" class="detail bg-[#7905EE] py-1 px-2 mt-2 text-xs rounded text-white mr-3" >Detail</a>
                                <!-- <a  href="/Final_JN/delete/cmp/noti/${notification.notification_id}" class="w-3 h-3 "> <i class="fa-solid fa-xmark" style="color: #53616e;"></i> </a>-->
                                </div>
                            </div>
                            
                        </div>
				 </c:forEach>

                    </div>

                    <!-- Confirm Payment -->
                    <div id="confirmContent" class="inbox_wrapper w-full max-h-80 overflow-y-scroll hide-scrollbar hidden mt-3">
                        <c:forEach var="notification" items="${pnotifications}">
			 				<div class="w-full p-3 bg-white mt-4 shadow-md rounded-lg flex flex-row flex-nowrap justify-between">
		                            <img src="${pageContext.request.contextPath}/resources/images/icons/pointsIcon.png" class="w-10 h-10 mt-2">
		                            <div class="px-3 py-2">
		                                <h6 class="font-semibold text-xs">Points Purchase Confirmation</h6>
		                                <p class="text-gray-500 content_text ">since ${notification.created_at}</p>
		                                <p class="content_text mt-3">Your point purchase has been successfully completed.</p>
		                            </div>
		                            <div> <button class="w-3 h-3 "> <i class="fa-solid fa-xmark" style="color: #53616e;"></i> </button></div>
		                        </div>
	 					</c:forEach>
                        
                    </div>

                </div>
            </div>

            <!-- Setting part -->
            <div class="noti float-right mr-10 custom-bg z-4 w-1/4 h-auto mt-3 rounded hidden" id="setting">
                <div class="flex flex-cols items-center custom-bg1 p-6 rounded-t-lg">
                    <div class="profile justify-center">
                        <img src="${pageContext.request.contextPath}/resources/Upload_image/<%= companyImage %>" alt="Company Image" class="w-20 h-13 custom-rounded mb-0">                    
                        <span class="text-black text-lg font-semibold"><%= companyName %></span>
                        <div class="bg-white text-purple-600 rounded-full px-3 py-1 text-xs flex items-center">
                            <svg class="w-4 h-4 text-red-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 15l-5.5 3 1.5-5.8L1 7.3l5.9-.5L10 2l2.1 4.8 5.9.5-5 4.9 1.5 5.8z"/>
                            </svg>
                            <span><%= points %>points</span>
                            <a href="/Final_JN/point_history" class="text-xs text-black ml-2">View History</a>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="w-2 h-2 ml-1" viewBox="0 0 512 512">
                                <path d="M464 256A208 208 0 1 1 48 256a208 208 0 1 1 416 0zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM294.6 151.2c-4.2-4.6-10.1-7.2-16.4-7.2C266 144 256 154 256 166.3l0 41.7-96 0c-17.7 0-32 14.3-32 32l0 32c0 17.7 14.3 32 32 32l96 0 0 41.7c0 12.3 10 22.3 22.3 22.3c6.2 0 12.1-2.6 16.4-7.2l84-91c3.5-3.8 5.4-8.7 5.4-13.9s-1.9-10.1-5.4-13.9l-84-91z"/>
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="flex w-full h-auto px-4 py-3 mt-6 mb-3 ">
                    <ul class="w-full h-auto p-0 ">
                        <li class="flex items-center justify-between py-2 px-2 border-b border-gray-200 cursor-pointer rounded" onclick="Profile(event)">
                            <span class="flex items-center"><i class="fa fa-user mr-2"></i> Profile</span>
                            <i class="fa fa-chevron-right"></i>
                        </li>
                        <li class="flex items-center justify-between py-2 px-2  border-b border-gray-200 cursor-pointer rounded" onclick="Points(event)">
                            <span class="flex items-center"><i class="fa fa-star mr-2"></i> Points Collection</span>
                            <i class="fa fa-chevron-right"></i>
                        </li>
                        
                        <li class="flex items-center justify-between py-2 px-2  border-b border-gray-200 cursor-pointer rounded" onclick="Password(event)">
                            <span class="flex items-center"><i class="fa fa-lock mr-2"></i> Change Password</span>
                            <i class="fa fa-chevron-right"></i>
                        </li>
                        <li class="flex items-center justify-between py-2 px-2  border-b border-gray-200 cursor-pointer rounded" onclick="Review(event)">
                            <span class="flex items-center"><i class="fa fa-comment-dots mr-2"></i> Review Website</span>
                            <i class="fa fa-chevron-right"></i>
                        </li>
                        <li class="flex flex-row items-center justify-between py-2 px-2  cursor-pointer rounded" onclick="confirmLogout(event)" >                            
                                    <span class="flex items-center"><i class="fa fa-sign-out-alt mr-2"></i> Logout</span>
                                    <i class="fa fa-chevron-right"></i>                            
                        </li>
                        
                    </ul>
                </div>
            </div>

  </div> 
    	
       
        
    
    
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const inboxButton = document.getElementById('inboxButton');
            const confirmButton = document.getElementById('confirmButton');
            const slider = document.getElementById('slider');
            const inboxContent = document.getElementById('inboxContent');
            const confirmContent = document.getElementById('confirmContent');

            inboxButton.addEventListener('click', function () {
                slider.style.transform = 'translateX(0%)';
                inboxContent.classList.remove('hidden');
                confirmContent.classList.add('hidden');
            });

            confirmButton.addEventListener('click', function () {
                slider.style.transform = 'translateX(100%)';
                confirmContent.classList.remove('hidden');
                inboxContent.classList.add('hidden');
            });
        });


        function showNoti(){
            document.getElementById('noti').classList.toggle('hidden');
            document.getElementById('setting').classList.add('hidden');
           
        }

        function showSetting(){
            document.getElementById('setting').classList.toggle('hidden');
            document.getElementById('noti').classList.add('hidden');
           
        }

        function updateNotificationCount(count) {
            const notiCountElement = document.querySelector('.notification-count');
            notiCountElement.textContent = count;
        }
        
        
        function confirmLogout(event) {
            event.preventDefault();  // Prevent the default anchor behavior
            if (confirm("Are you sure you want to log out?")) {
                window.location.href = '/Final_JN/logout';  // Redirect to logout if confirmed
            }
        }
        
        function Points(event) {
            event.preventDefault();  // Prevent the default anchor behavior
           
                window.location.href = '/Final_JN/point_purchase';  
            
        }
        
        function Profile(event) {
            event.preventDefault();  // Prevent the default anchor behavior
           
                window.location.href = '/Final_JN/companyProfile';  
        }
        
        function Password(event) {
        	event.preventDefault();
                window.location.href = '/Final_JN/changepw';  
            
        }
        
        function Review(event) {
        	event.preventDefault();
                window.location.href = '/Final_JN/websiteReview';  
            
        }

    </script>

