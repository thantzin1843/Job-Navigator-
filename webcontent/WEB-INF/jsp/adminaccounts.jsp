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
    
      
      
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
      <style>
        @media (max-width: 850px){
            .container{
                min-width:800px;
            }
        }
        .hover-bg-opacity:hover {
            background-color: rgba(193, 193, 235, 0.74); 
            cursor:pointer;
        }
        .active {
            background-color: rgba(193, 193, 235, 0.74); 
            cursor:pointer;
        }
        .hide-scrollbar::-webkit-scrollbar {
            
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        .slider {
            transition: transform 0.3s ease;
            background-color: rgba(193, 193, 235, 0.74); 
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
                <!-- nav panel -->              
                <div class=" bg-[#FFFFFF] opacity-90 w-56 h-auto p-3 rounded-lg flex-col justify-center gap-2 shadow-md">
                    <div  class="flex items-center justify-center">
                      <img src="<%= contextPath %>/resources/images/logo.png" class="w-32 h-20"> 
                    </div>
                    
                    <div class="flex items-center justify-start p-2 mt-3  hover-bg-opacity rounded">
                     <a href="admin_dashboard">
                      <i class="fa-solid fa-house" style="color: #000000; font-size:15px;"></i>
                      &nbsp; <span class="text-base font-normal">Dashboard</span>
                     </a>
                    </div>  
                    
                    <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity active rounded">
                      <a href="adminaccounts">
                      <i class="fa-solid fa-users" style="color: #000000; font-size:15px;"></i>
                      &nbsp; <span class="text-base font-normal">User Accounts</span>
                      </a>
                    </div>  

                    <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
                      <a href="adminReviews">
                      <i class="fa-solid fa-comment" style="color: #000000; font-size:15px;"></i>
                      &nbsp; <span class="text-base font-normal">View Reviews</span>
                      </a>
                    </div>  

                    <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
                      <a href="adminPayment">
                          <i class="fa-solid fa-money-check-dollar " style="color: #000000; font-size:15px;"></i>
                      &nbsp; <span class="text-base font-normal">Check Payment</span>
                      </a>
                    </div>  

                    <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
                      <a href="adminPackages">
                      <i class="fa-solid fa-star" style="color: #000000; font-size:15px;"></i>
                      &nbsp; <span class="text-base font-normal">Manage Points</span>
                      </a>
                    </div>  

                    <div class="mt-12 mb-3">
                       <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
                          <a href="adminprofile">
                              <i class="fa-solid fa-user " style="color: #000000; font-size:15px;"></i>
                          &nbsp; <span class="text-base font-normal">Profile</span>
                          </a>
                        </div> 

                        <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
                          <a href="#"  onclick="confirmLogout(event)">
                              <i class="fa-solid fa-arrow-right-from-bracket" style="color: #000000; font-size:15px;"></i>
                          &nbsp; <span class="text-base font-normal">Logout</span>
                          </a>
                        </div> 
                    </div>
                </div>

                <!-- content -->
                <div class="w-11/12 mt-5 mx-3">
                    <div class="flex flex-row justify-between flex-wrap"> 
                        <div class="justify-self-start">
                            <i class="fa-solid fa-users" style="color: #ffffff; font-size:20px;"></i>
                            &nbsp; <span class="text-xl font-bold text-white">User Accounts</span>
                        </div>
                        <div class="flex justify-end justify-self-end gap-3">
     						<span id='ct' class="rounded p-2 text-white"></span>
                            <!-- <i class="fa-solid fa-bell" style="color: #ffffff; font-size:20px; margin-top:7px;" ></i> -->
                            <img src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}" class="w-10 h-10 rounded-full">
                        </div>                    
                    </div>

                    <div class="w-fit">
                        <div class="flex justify-between relative bg-white mt-5 rounded w-fit gap-2 px-2">
                            <button id="jbtn" class="w-full py-2 text-center text-gray-700 font-semibold">
                                Job-Seeker
                            </button>
                            <div class="bg-gray-900 w-3 h-fit"></div>
                            <button id="cbtn" class="w-full py-2 text-center text-gray-700 font-semibold ">
                                Commpany
                            </button>
                            <div id="slider" class="absolute bottom-0 left-0 h-1 bg-[#7905EE] rounded w-1/2 slider"></div>                            
                        </div>
                    </div>

                    <!-- job seeker -->
                    <div id="jobseeker" class=" w-full h-58 flex flex-row justify-start mt-5 bg-white shadow-md rounded p-5">
                        <table cellspacing="10px" class="w-full border-2 mx-3 text-center">
                            <tr >
                                <td>Id</td>
                                <td>User Name</td>
                                <td>Email</td>
                                <td>Password</td>
                                
                                
                            </tr>
                           
                           <c:forEach var="jobseeker" items="${accounts}">
                           
                <tr class="border-2 custom-bg2">
                <c:if test="${jobseeker.userrole == 'JobSeeker'}">
                    <td class="py-2">${jobseeker.jobSeekerId}</td>
                    <td class="py-2">${jobseeker.firstName}</td>
                    <td class="py-2">${jobseeker.email}</td>
                    <td class="py-2">${jobseeker.passwordHash}</td>
                    
                    </c:if>
                </tr>
                
            </c:forEach>
                            
                        </table>

                    </div>


                    <!-- company -->
                    <div id="company" class="w-full flex flex-row justify-start mt-5 bg-white shadow-md rounded p-5 hidden">
                        <table cellspacing="10px"class="w-full border-2 mx-3 text-center">
                            <tr >
                                <td>Id</td>
                                <td>Company Name</td>
                                <td>Email</td>
                                <td>Password</td>
                                <td>Country</td>
                                
                            </tr>
                            <c:forEach var="company" items="${accounts}">
                <tr class="border-2 custom-bg2">
                <c:if test="${company.userrole == 'Company'}">
                    <td class="py-2">${company.companyId}</td>
                    <td class="py-2">${company.companyName}</td>
                    <td class="py-2">${company.email}</td>
                    <td class="py-2">${company.passwordHash}</td>
                    <td class="py-2">${company.location}</td>
                    </c:if>
                    
                    
                </tr>
            </c:forEach>
                            
                            
                        </table>

                    </div>

                    

                    

                </div>
            </div>

             
        </div>
        
    </div>



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const jobseeker = document.getElementById('jobseeker');
            const company = document.getElementById('company');
            const slider = document.getElementById('slider');
            const jbtn = document.getElementById('jbtn');
            const cbtn = document.getElementById('cbtn');
            
            cbtn.addEventListener('click', function () {
                slider.style.transform = 'translateX(100%)';
                company.classList.toggle('hidden');              
                jobseeker.classList.toggle('hidden');
            });

            jbtn.addEventListener('click', function () {
                slider.style.transform = 'translateX(0%)';
                jobseeker.classList.toggle('hidden');                
                company.classList.toggle('hidden');
            });

            
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