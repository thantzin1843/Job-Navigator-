<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.lang.Integer" %>
<%
	String jsName = (String) session.getAttribute("jsName");
	String jsImage = (String) session.getAttribute("jsImage");
	Integer user_Id = (Integer) session.getAttribute("user_Id");	
	
	if(jsImage == null){
		jsImage ="default_pic.jpg";
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
                                    <span class="notification-count absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1">${notiCount}</span>
                        </button> 
                       <button class="w-9 h-9 rounded-full" onclick="showSetting()">  <img src="${pageContext.request.contextPath}/uploads/<%= jsImage %>" class="w-full h-full rounded-full"></button>

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
    
    
     <div class="w-full h-auto noti_setting  absolute">
     <!-- Noti part -->
            <div class="noti float-right mr-20 bg-[#E6E6FA] z-2 w-1/4 h-auto mt-3 rounded hidden" id="noti">
                <div class="flex flex-nowrap bg-[#9696E8] px-5 py-0 rounded">
                    <h2 class="font-semibold text-white text-lg rounded">Notifications</h2>
                </div>

                <div class="w-full h-1/2 px-4 py-3">                    

                    <!-- Inbox -->
                    <div id="inboxContent" class="inbox_wrapper w-full max-h-80 overflow-y-scroll hide-scrollbar">

                       <c:forEach var="notification" items="${notifications}">
	 				
                            <div class="w-full px-3 bg-white mt-3 shadow-md rounded-lg flex flex-row flex-nowrap justify-between ">
                            <c:choose>
					                <c:when test="${notification.status == 'Accepted'}">
					                           <img src="${pageContext.request.contextPath}/resources/images/icons/approve.png" class="w-10 h-10 mt-2">
					                        </c:when>
					                 <c:otherwise>
					                           <img src="${pageContext.request.contextPath}/resources/images/icons/deny.png" class="w-10 h-10 mt-2">
					                 </c:otherwise>
					           </c:choose>
                               
                                <div class="px-3 py-2">
                                    <h6 class="font-bold text-xs">Job Application ${notification.status }</h6>
                                    
                                    <p class="content_text mt-3">
                                    	<c:choose>
					                        <c:when test="${notification.status == 'Accepted'}">
					                            Congratulations, <%= jsName %>, Your application for the Developer position has been approved. Please check your email for further instructions.
					                        </c:when>
					                        <c:otherwise>
					                            Your application is ${notification.status}. Please check your email for further instructions.
					                        </c:otherwise>
					                    </c:choose>
					                    
                                    </p>
                                </div>
                                <div><a class="w-3 h-3 " href="${pageContext.request.contextPath}/delete/noti/${notification.application_id}"> <i class="fa-solid fa-xmark" style="color: #53616e;"></i> </a></div>
                            </div>
					</c:forEach>
                        

                    </div>

                    
                </div>
            </div>

            <!-- Setting part -->
            <div class="noti float-right mr-10 custom-bg z-4 w-1/4 h-auto mt-3 rounded hidden" id="setting">
                 <div class="flex flex-col items-center custom-bg1 p-6 rounded-t-lg">
                    <div class="profile">
              
                    <img src="${pageContext.request.contextPath}/uploads/<%= jsImage %>" alt="Company Image" class="w-12 h-12 rounded-full">                    
                    <span class="text-black text-lg font-semibold"><%= jsName %></span> 
                    </div>                   
                 </div>
                
                    
                       <div class="w-full h-auto px-4 py-3 mt-6 mb-3 text-sm">
                            <ul class="w-full h-auto p-0">
                                <li class="flex items-center justify-between px-2 py-2 border-b border-gray-200 cursor-pointer rounded"  onclick="Profile(event)">
                                    <span class="flex items-center"><i class="fa fa-user mr-2"></i> Profile</span>
                                    <i class="fa fa-chevron-right"></i>
                                </li>  
                                <li class="flex items-center justify-between px-2 py-2 border-b border-gray-200 cursor-pointer rounded" onclick="Password(event)">
                                    <span class="flex items-center"><i class="fa fa-lock mr-2"></i> Change Password</span>
                                    <i class="fa fa-chevron-right"></i>
                                </li> 
                                <li class="flex items-center justify-between px-2 py-2 border-b border-gray-200 cursor-pointer rounded" onclick="Review(event)">
                                    <span class="flex items-center"><i class="fa fa-comment-dots mr-2"></i> Review Website</span>
                                    <i class="fa fa-chevron-right"></i>
                                </li>
                                
                                <li class="flex items-center justify-between px-2 py-2 cursor-pointer rounded" onclick="confirmLogout(event)">
                                	
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
        
        function Password(event) {
        	event.preventDefault();
                window.location.href = '/Final_JN/changepw';  
            
        }
        
        function Review(event) {
        	event.preventDefault();
                window.location.href = '/Final_JN/websiteReview';  
            
        }
        
      
        function Profile(event) {
        	event.preventDefault();
        	 const jobSeekerId = '${user_Id}';
        	const contextPath = '${pageContext.request.contextPath}';
            window.location.href = contextPath + '/job_seeker/profile/' + jobSeekerId; 
            
        }

        
        
    </script>

