<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
    
      
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
      <style>
          .hide-scrollbar::-webkit-scrollbar {
            
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
      </style>
   
   
</head>
<body class="font-cabin w-full min-h-screen"> 
    <div class="flex flex-row justify-center px-4 w-fit h-full mt-3">
        <a href="/Final_JN/">
            <h6 class="text-base font-medium"> 
            <i class="fa-solid fa-arrow-left"> </i>Back to Home</h6>
        </a >
    </div>

    <div class="w-full flex flex-col justify-center">
        <div class="w-full h-fit p-10">
            <div class="flex justify-center w-full">
                <h2 class="text-3xl">Find <span class="underline underline-offset-2 text-[#9696E8]">Company</span></h2>
            </div>
            <div class="flex justify-center w-full">
               
                <div class="w-1/2 mt-5 flex flex-row bg-white p-2 rounded-lg justify-between" id="jtitle">
                	<form:form action="searchComp" method="post" modelAttribute="company" cssClass="w-full flex flex-row bg-white p-2 rounded-lg justify-between">
                    	<form:input type="text" path="companyName" cssClass="w-full bg-white font-semibold ml-2 border-2 border-[#858181] p-2  rounded" placeholder="Search with Company Name"  id="searchInput" />
                    	<button class="border-0 rounded bg-[#8035FB] w-12 ml-2 "><i class="fa-solid fa-magnifying-glass text-white mt-1"></i></button>
                     </form:form> 
                </div>  
                  
            </div>  
        </div>
        <div class="mt-8">
                <div class="flex flex-row gap-2 px-14">
                    <h1 class="font-bold text-lg">Total Companies</h1>
                    <p class="bg-[#E6E6FA] py-1 pl-3 pr-3 rounded ">${allCompany.size()}</p>        
                </div>

                <div class="flex flex-col justify-center w-full">
                    <div class="w-full h-full pl-14 overflow-y-scroll hide-scrollbar mt-10 flex flex-wrap justify-start gap-8 "> 

                         <c:forEach var="allCompany" items="${allCompany}">
	                        <div class="card border-2 border-[#858181] p-3 rounded-lg w-82 h-fit ">
	                            <div class="upper bg-[#E6E6FA] w-full h-40 px-7 py-4 rounded-lg flex flex-row justify-between gap-2">                    
	                                
	                                <c:if test="${empty allCompany.companyPhoto}">
										<img src="${pageContext.request.contextPath}/resources/Upload_image/default.jpg"
											alt="Company Photo" class="w-24 h-24 custom-rounded mb-4" />
									</c:if>
									<c:if test="${not empty allCompany.companyPhoto}">
										 <img src="${pageContext.request.contextPath}/resources/Upload_image/${allCompany.companyPhoto}" class="max-w-24 max-h-24 object-cover" />
	                               
									</c:if>
	                                <div class="">
	                                    <h3 class="font-extrabold text-base mt-3 w-40">${allCompany.companyName}</h3>
	                                    <i class="fa-solid fa-location-dot"></i> <label class="font-normal text-sm"> &nbsp; ${allCompany.location}</label> <br/>
	                                    <i class="fa-solid fa-briefcase"></i> <label class="font-normal text-sm"> &nbsp; ${allCompany.workingPolicy} </label> <br/>
	                                    <a href="/Final_JN/companyProfilejs/${allCompany.companyId}" class="font-bold text-base text-[#7905EE] cursor-pointer float-right" > View </a>  <!-- ${allCompany.companyId} -->
	                                </div>                   
	                            </div>
	                        </div>
                        </c:forEach>
                        <c:if test="${empty allCompany}">
						    <p>No company found matching your criteria.</p>
						</c:if>                           
        
                
                    </div>
                </div>



        </div>
        
        
    </div>

    
  
</body>
</html>