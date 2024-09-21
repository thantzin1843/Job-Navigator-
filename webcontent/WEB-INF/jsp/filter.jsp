<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Job Navigator</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
               extend:{
                  width: {
                  'custom-xs': '3rem',
                  'custom-sm': '8rem', 
                  'custom-md': '12rem', 
                  'custom-lg': '16rem', 
                  'custom-xl': '20rem', 
                  },
                  height: {
                  'custom-xs': '3rem',
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
        .transition-slow {
          transition: #C1C1EB 0.3s ease, color 0.3s ease-in; 
        }
        .selected {
          background-color: #C1C1EB; 
        }

        .hide-scrollbar::-webkit-scrollbar {
            
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        
        .accent {
            accent-color: #7905EE;
        }
        
         .card {
		    
		    height: 500px;
		}

        .card {
		    max-width: 320px; 
		  
		}
      </style>
   
</head>
<body class="font-cabin h-screen"> 

 <div class="px-4 mt-5 ml-5 w-fit h-fit ">
		<a href="/Final_JN/">
            <h6 class="text-base font-medium"> 
            <i class="fa-solid fa-arrow-left"> </i>Back to Home</h6>
        </a>
 </div>
 
 <div class="container w-full h-full flex z-2 " >
   <div class="fileter-control min-w-1/3 px-10 mt-5">
   
	
	    <div class="w-full h-fit p-7 bg-[#ECECEC] rounded-xl mb-5">
	        <div class="w-full flex flex-row flex-nowrap justify-between">
	            <div class="flex flex-row gap-2">
	                <i class="fa-solid fa-filter mt-1"></i>
	                <h2 class="font-bold text-base w-fit">Filters</h2>
	            </div>
	            <form:form role="form" action="alljobs" method="get">  <!-- change -->
	            <span class="text-sm text-[#7905EE] underline cursor-pointer" id="clearAll">Clear All</span>
	            </form:form>
	        </div>
	
	        <!-- Button Container -->
	        <div class="w-full flex space-x-0 mt-5">           
	            
		            <button id="jobButton" name="job" class="selected w-full px-11 py-2 text-white rounded-tl-lg rounded-bl-lg focus:outline-none transition-slow font-semibold text-sm">
		            Job
		            </button>            
		          
		            <button id="companyButton" name="company" class="w-full px-11 py-2 bg-white text-black rounded-tr-lg rounded-br-lg focus:outline-none transition-slow font-semibold text-sm">
		            Company
		            </button>
	            
	        </div>
			<form:form action="showfilter" method="post" modelAttribute="jobFilter">
		        <div class="w-full mt-5 flex flex-row bg-white p-2 rounded-lg justify-between" id="jtitle">
		            <form:input type="text" placeholder="Job Category (or) Title" cssClass="bg-white font-normal ml-2" id="searchInput"  path="categoryName"/>
		            <button class="border-0 mr-2"><i class="fa-solid fa-magnifying-glass bg-white mt-1" disabled></i></button>
		        </div>
		
		        <div class="w-full mt-5 flex flex-row bg-white p-2 rounded-lg justify-between hidden" id="jcomp">
		            <form:input type="text" placeholder="Company Name" class="bg-white font-normal ml-2" id="searchInput1" path="companyName" />
		            <button class="border-0 mr-2"><i class="fa-solid fa-magnifying-glass bg-white mt-1" disabled></i></button>
		        </div>
		
		        <div class="w-full mt-5">
		        	
		            <label class="font-semibold text-black text-base">Locations</label> <br/>        
		               <form:select path="location" id="location" cssClass="w-full p-2 border-b-2 border-black justify-between bg-[#ECECEC] font-regular text-sm">
						    <form:option value="" label="Select Location"  />
						    <c:forEach var="joblocation" items="${compLocation}">
						    	<form:option value="${joblocation}" label="${joblocation}" />
						    </c:forEach>
						    <!--<form:option value="Austin, TX" label="Austin, TX" />
						    <form:option value="San Francisco, CA" label="San Francisco, CA" />
						    <form:option value="New York, NY" label="New York, NY" />
						    <form:option value="Canada" label="Canada" /> -->
						</form:select>					 
		        </div>
		
		        <div class="w-full mt-5">
		            <label class="font-semibold text-black text-base">Job Types</label> <br/> 
		            
		            <div class="mt-3">
		                <form:checkbox path="jobTypes" id="full-time" value="Full-time" cssClass="form-checkbox h-4 w-4" />
						<label for="full-time" class="ml-2 text-gray-700 text-sm">Full-Time</label>
						<br/>
						
						<form:checkbox path="jobTypes" id="part-time" value="Part-time" cssClass="form-checkbox h-4 w-4" />
						<label for="part-time" class="ml-2 text-gray-700 text-sm">Part-Time</label>
						<br/>
						
						<form:checkbox path="jobTypes" id="internship" value="Internship" cssClass="form-checkbox h-4 w-4" />
						<label for="internship" class="ml-2 text-gray-700 text-sm">Internship</label>
						<br/>
		            </div>
		        </div>
		
		        <div class="w-full mt-5">
		            <label class="font-semibold text-black text-base">Work Types</label> <br/> 
		            
		            <div class="mt-3">
		                <form:checkbox path="workTypes" id="on-site" value="Onsite" cssClass="form-checkbox h-4 w-4" />
							<label for="on-site" class="ml-2 text-gray-700 text-sm">On-site</label>
							<br/>
							
							<form:checkbox path="workTypes" id="remote" value="Remote" cssClass="form-checkbox h-4 w-4" />
							<label for="remote" class="ml-2 text-gray-700 text-sm">Remote</label>
							<br/>
							
							<form:checkbox path="workTypes" id="both" value="Hybrid" cssClass="form-checkbox h-4 w-4" />
							<label for="both" class="ml-2 text-gray-700 text-sm">Hybrid</label>
							<br/>
		            </div>
		        </div>
		
		        <div class="w-full mt-5">
		            <label class="font-semibold text-black text-base">Salary</label> <br/> 
		            <form:input type="range" path="salary" id="salaryRange" min="0" max="1000000" value="" cssClass="w-full accent" />
		            <span class="text-[#7905EE] text-xs font-bold">1</span>
		            <span class="text-[#7905EE] text-xs float-right font-bold">1,000,000</span>
		        </div>
		
		        <div class="w-full mt-5 flex flex-row justify-center">
		           <input type="submit" class="bg-[#7905EE] text-center text-base font-bold text-white rounded px-4 py-2 cursor-pointer" value="Apply" />
		        </div>
	        </form:form>
	    </div>
	

   </div>

   <div class="show_job min-w-2/3 w-fit h-full p-5 mt-17 mb-20">
        <div class="flex flex-row gap-2">
            <h1 class="font-bold text-lg">Recommended jobs</h1>
            <p class="bg-[#E6E6FA] py-1 pl-3 pr-3 rounded " id="card-count"></p>        
        </div>
        <div class="card-wrap w-300 h-full overflow-y-scroll hide-scrollbar mt-10 flex flex-wrap flex-row gap-8 justify-start px-8 ">
            

       
	            <!--start-->
		        <c:forEach var="job" items="${filteredJobs}">
		        <c:choose>
                    <c:when test="${job.employmentType == 'Full-time'}">
                        <c:set var="bgc" value="#C1DCEB" />
                    </c:when>
                    <c:when test="${job.employmentType == 'Part-time'}">
                        <c:set var="bgc" value="#EAC1EB" />
                    </c:when>
                    <c:when test="${job.employmentType == 'Internship'}">
                        <c:set var="bgc" value="#F9F0C2" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="bgc" value="#FFFFFF" /> <!-- Default background color -->
                    </c:otherwise>
                </c:choose>
	            
	            <div class="card border-2 border-[#858181] p-3 rounded-lg w-80 h-fit flex flex-col">
	                <div class="upper bg-[#E6E6FA] w-full h-auto px-7 py-4 rounded-lg ">
	                    <div class="flex flex-row justify-between">
	                        <p class="bg-[${bgc}] px-5 py-2 rounded-xl text-center"> ${job.employmentType}</p>
	                        <p class="text-[#858181] text-sm mt-2">${job.postedAt}</p>
	                    </div>
	                    <h3 class="font-extrabold text-xl mt-3"> ${job.jobTitle} </h3>
	
	                    <div class="mt-5">
	                        <i class="fa-solid fa-location-dot"></i> <label class="font-semibold"> &nbsp; ${job.location} <span class="font-normal" >- ${job.workingSetting} </span> </label> <br/>
	                        <i class="fa-solid fa-briefcase"></i> <label class="font-semibold"> &nbsp; ${job.companyName} </label> <br/><br/>
	                        <p class="jsummary font-sm flex flex-wrap">${job.jobSummary}</p>
	                    </div>
	
	                </div>
	                <div class="lower p-3 flex flex-row justify-between items-center flex-wrap">
	                    <div class="flex flex-row gap-2 items-center">
	                        <img src="${pageContext.request.contextPath}/resources/images/noback/dollar.png" alt = "image"  class="w-8 h-8" >
	                        <div class="flex flex-row flex-wrap">
	                            <div class="w-32 flex flex-row flex-wrap">
	                            	<label class="font-semibold text-center text-sm"> ${job.salary} 
	                            <c:choose>
							        <c:when test="${job.salaryType == 'Per month'}">
							            / month
							        </c:when>
							        <c:when test="${job.salaryType == 'Per day'}">
							            / day
							        </c:when>
							        <c:when test="${job.salaryType == 'Per hour'}">
							            / hr
							        </c:when>
							        <c:when test="${job.salaryType == 'Per year'}">
							            / year
							        </c:when>
							        <c:otherwise>							            
							            ${job.salaryType}
							        </c:otherwise>
							    </c:choose>
							    
						        </label>
						        <!--<label>
							    	<c:choose>
								        <c:when test="${job.negotiable}">
								            <span class="text-[#858181] text-sm">[Negotiate]</span>
								        </c:when>
								        <c:otherwise>
								            <span class="text-[#858181] text-sm text-white"> </span>
								        </c:otherwise>
								   </c:choose>    
							    </label> -->
	                            </div>
	                           	
	                        </div>
	                    </div>
	                   
	   
	    				 <a href="jobdetail/${job.jobId}" modelAttribute="jobDetail"> 					
						    <button type="submit" class="bg-[#7905EE] rounded-3xl px-5 py-2 text-white font-bold text-base cursor-pointer">
						        Detail
						    </button>
						 </a>
						
	                </div>
	
	            </div>
	
				</c:forEach>
				<!-- Show a message if no jobs are available -->
				<c:if test="${empty filteredJobs}">
				    <p>No jobs found matching your criteria.</p>
				</c:if>

            <!--end-->
 
        
        </div>
    
   </div>
 </div>


    <script type="text/javascript"> 
    	
    window.onload = function() {
       
        const cards = document.querySelectorAll('.card');
        
       
        const cardCount = cards.length;
        
        
        console.log("Number of .card elements: " + cardCount);
        
      
        document.getElementById('card-count').innerText = cardCount;
    };

        document.getElementById('jobButton').addEventListener('click', function() {
            // handleButtonSelection('jobButton');
            document.getElementById('jobButton').classList.remove('bg-white');
            document.getElementById('jobButton').classList.add('selected');
            document.getElementById('jobButton').classList.add('text-white');


            document.getElementById('companyButton').classList.remove('selected');
            document.getElementById('companyButton').classList.remove('text-white');
            document.getElementById('companyButton').classList.add('bg-white');
            document.getElementById('companyButton').classList.add('text-balck');
            
            document.getElementById('jcomp').classList.add('hidden');
            document.getElementById('jtitle').classList.remove('hidden');
        });
    
        document.getElementById('companyButton').addEventListener('click', function() {
            // handleButtonSelection('companyButton');
            document.getElementById('companyButton').classList.remove('bg-white');
            document.getElementById('companyButton').classList.add('selected');
            document.getElementById('companyButton').classList.add('text-white');

            document.getElementById('jobButton').classList.remove('selected');
            document.getElementById('jobButton').classList.remove('text-white');
            document.getElementById('jobButton').classList.add('bg-white');
            document.getElementById('jobButton').classList.add('text-balck');
            
            document.getElementById('jcomp').classList.remove('hidden');
            document.getElementById('jtitle').classList.add('hidden');
        });


        //Clear button
        document.getElementById('clearAll').addEventListener('click', function() {
            // Reset search input
            document.getElementById('searchInput').value = '';
            document.getElementById('searchInput1').value = '';

            // Reset select input
            document.getElementById('location').selectedIndex = 0;

            // Reset checkboxes
            document.getElementById('full-time').checked = false;
            document.getElementById('part-time').checked = false;
            document.getElementById('internship').checked = false;
            document.getElementById('on-site').checked = false;
            document.getElementById('remote').checked = false;
            document.getElementById('both').checked = false;

            // Reset range input
            document.getElementById('salaryRange').value = 0;
        });
    
      </script>
</body>
</html>