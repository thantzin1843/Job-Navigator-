<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
       
    	response.sendRedirect(request.getContextPath() + "/login");
    }
%>

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
    </script>
    
     
      <link href="./payment1.css" rel="stylesheet"/>
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
      <style>
        .titile_top{ color:7905EE;}
      </style>
   
   
</head>
<body class="font-cabin"> 
    <div class="container max-w-screen-xl mx-auto p-8">
      <div class="px-4 ml-5 mt-3 w-fit h-fit ">
        <button onclick="window.history.back();" >
            <h6 class="text-base font-medium"> 
            <i class="fa-solid fa-arrow-left"> </i>Back</h6>
        </button>
      </div>
      <div class="wrapper w-full h-full p-10">
          
            <div class="grid grid-cols-2 gap-20">

              <div class="content-start">
                  <h1 class="text-xl font-bold">${jobDetail.jobTitle}</h1>                  
                    <h5 class="text-base mt-2">
                      <i class="fa-solid fa-briefcase"></i>&nbsp; ${jobDetail.companyName}
	                      <a href="/Final_JN/companyProfilejs/${jobDetail.compId}">
	                      	<span id="company_pf" class="ml-2 text-xs bg-[#9696E8] rounded-xl py-0.5 px-4 underline font-semibold cursor-pointer w-fit"> View Profile</span>       
	                      </a>           
                    </h5>                 
              </div>

              <div class="grid justify-self-end ">
                  <p class="text-gray-600 text-base text-right">Posted at ${jobDetail.postedAt}</p>
                  <div class="flex flex-row justify-end gap-4 mt-2">
                  	<a href="application/${jobDetail.jobId}/${jobDetail.compId}">
                    	<button class="bg-[#7905EE] rounded-lg py-1.5 px-5 text-white font-semibold">Apply Job</button>
                    </a>
                    
                    	<!-- <button class="border-2 border-black rounded-lg py-1.5 px-3"><i class="fa-solid fa-heart"></i></button> -->
                    
                  </div>
              </div>

            </div>
            <div class="border-b border-gray-400 mt-5"></div>

            <div class="mt-4">
              <h3 class="text-lg font-semibold">Job Details</h3>
              <div class="w-full flex flex-cols flex-wrap gap-24 mt-5 " >
                <div class="w-fit content-start">                 
                  <div class="flex flex-row flew-nowrap">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/job_type.png" class="w-7 h-7"> <h6 class="font-semibold">&nbsp;Job Type : </h6>&nbsp;<p class="bg-[#C1DCEB] p-0.5 rounded-sm text-center"> ${jobDetail.employmentType}</p>
                  </div><br/>
                  <div class="flex flex-row flew-nowrap">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/work_type.png" class="w-7 h-7"> <h6 class="font-semibold">&nbsp;Work Type : </h6>&nbsp;<p class="bg-[#C1DCEB] p-0.5 rounded-sm text-center">${jobDetail.workingSetting}</p>
                  </div>
                </div>
                
                <div class="w-fit content-end mt-2">
                	<div class="flex flex-row flew-nowrap">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/salary.png" class="w-7 h-7"> <h6 class="font-semibold">&nbsp;Salary : </h6>&nbsp;<p class="bg-[#C1DCEB] p-0.5 rounded-sm text-center">${jobDetail.salaryAmount} 
                     <c:choose>
							        <c:when test="${jobDetail.salaryType == 'Per month'}">
							            per month
							        </c:when>
							        <c:when test="${jobDetail.salaryType == 'Per day'}">
							            per day
							        </c:when>
							        <c:when test="${jobDetail.salaryType == 'Per hour'}">
							            per hour
							        </c:when>
							        <c:when test="${jobDetail.salaryType == 'Per year'}">
							            per year
							        </c:when>
							        <c:otherwise>							            
							            ${job.salaryType}
							        </c:otherwise>
							    </c:choose>
                     <c:choose>
						<c:when test="${jobDetail.negotiable}">
							<span class="text-[#858181] text-sm">[Negotiate]</span>
						</c:when>
						<c:otherwise>
						    <span class="text-[#858181]"> </span>
						</c:otherwise>
					</c:choose>        
                      </p>
                  </div> <br/>

                  <div class="flex flex-row flew-nowrap">
                    <img src="${pageContext.request.contextPath}/resources/images/icons/encourage.png" class="w-7 h-7"> <h6 class="font-semibold">&nbsp;Encourage to Apply : </h6>&nbsp;<p class="bg-[#C1DCEB] p-0.5 rounded-sm text-center">${jobDetail.benefit}</p>
                  </div> 
                	
                
                </div>
              </div>
            </div>

            <div class="border-b border-gray-400 mt-5"></div>

            <div class="mt-4">
              <h3 class="text-lg font-semibold">Requirements</h3>
              <div class="flex flex-row flew-nowrap mt-5">
                <img src="${pageContext.request.contextPath}/resources/images/icons/skills.png" class="w-7 h-7"> <h6 class="font-semibold">&nbsp;Skills : </h6>                
              </div>
              <div class="flex flex-row flex-wrap mt-1 gap-3 mt-2">
              	 <c:if test="${not empty jobDetail.skills}">
				    <c:forEach items="${jobDetail.skills}" var="skill">
				        <p class="bg-[#C1C1EB] px-3 py-0.5 rounded-lg text-center">${skill}</p>
				    </c:forEach>
				</c:if>
	           </div>

              <div class="flex flex-row flew-nowrap mt-5">
                <img src="${pageContext.request.contextPath}/resources/images/icons/education.png" class="w-8 h-7"> <h6 class="font-semibold">&nbsp;Education : </h6>                
              </div>
              <div class="flex flex-row flex-wrap mt-1 gap-3 mt-2">
              <c:if test="${not empty jobDetail.educationLevels}">
              <c:forEach var="education" items="${jobDetail.educationLevels}">
                <p class="bg-[#DAD6D6] px-3 py-1.5 rounded-lg text-center">${education}</p>
               </c:forEach>
               </c:if>
                            
              </div>
            </div>

            <div class="border-b border-gray-400 mt-5"></div>

            <div class="mt-4">
              <h3 class="text-lg font-semibold">Location</h3>
              <p>${jobDetail.location} </p>
            </div>


            <div class="border-b border-gray-400 mt-5"></div>

          
            <div class="mt-4">
              <h3 class="text-lg font-semibold">Full Job Description</h3>
              <div class="flex flex-wrap mt-5 p-3">
                    <h6>Job Summary: </h6>
                    <p>${jobDetail.jobSummary}</p>

                    <h6>About the Job:</h6>
                    <p>${jobDetail.jobDescription}</p>

                    
              </div>
            </div>

            <div class="border-b border-gray-400 mt-5"></div>


            <div class="buttons flex flex-row justify-end flex-end mt-4 gap-4">
                
                <button type="button" class="bg-[#D9D9D9] px-5 py-2 rounded text-black font-semibold" onclick="window.history.back();">Back</button>
                <a href="application/${jobDetail.jobId}/${jobDetail.compId}">
				    <button type="button" class="bg-[#7905EE] px-5 py-2 rounded text-white font-semibold">Apply</button>
				</a>


            </div>
            
            
            
         
      </div>
   
        
    </div>
        
    

</body>
</html>