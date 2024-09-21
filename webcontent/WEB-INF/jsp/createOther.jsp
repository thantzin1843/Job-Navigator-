<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Navigator</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.css"  rel="stylesheet" />
    <script>
        tailwind.config = {
            theme: {
            
               extend:{
                screens: {
                'sm': '390px',   
                'md': '876px' 
                },
               }
            
          }
            
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
          .content-auto {
            content-visibility: auto;
          }
        }
      </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./profile.css">
</head>
<body>
    <!-- <div class="w-full p-5 bg-primary text-white">
        <i class="fa-solid fa-arrow-left"></i>&nbsp;Back
    </div> -->
     <c:if test="${not empty saveMessage }">
 	   <div id="toast-success" class="flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 absolute top-5 right-5 " role="alert">
    <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-green-500 bg-green-100 rounded-lg dark:bg-green-800 dark:text-green-200">
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z"/>
        </svg>
        <span class="sr-only">Check icon</span>
    </div>
    <div class="ms-3 text-sm font-normal"> ${saveMessage}</div>
    <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
        <span class="sr-only">Close</span>
        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
        </svg>
    </button>
	</div>
 </c:if>
 
 <c:if test="${not empty deleteMessage }">
 	   <div id="toast-success" class="flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 absolute top-5 right-5 " role="alert">
    <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
        </svg>
        <span class="sr-only">Error icon</span>
    </div>
    <div class="ms-3 text-sm font-normal"> ${deleteMessage}</div>
    <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
        <span class="sr-only">Close</span>
        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
        </svg>
    </button>
	</div>
 </c:if>

    <div class="w-full">
        <div class="md:w-1/2 sm:w-5/6  mx-auto bg-gray my-5 md:px-[50px] sm:px-5 py-[10px] shadow-sm shadow-black  rounded-xl min-h-[400px]">
            <div class="text-sm"><i class="fa-solid fa-arrow-left"></i>&nbsp;<a href="${pageContext.request.contextPath}/job_seeker/profile/${userId}">Profile</a></div>
            <div class="text-2xl mt-3 font-semibold">Others</div>
            <div class="text-gray-500 text-sm">Sharing social media accounts and other informations to know more about you.</div>

            <!-- Education -->
          
            <!-- Languages -->

            <div id="accordion-collapse1" data-accordion="collapse" class=" rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-4" data-accordion-target="#accordion-collapse-body-4" aria-expanded="false" aria-controls="accordion-collapse-body-4" class="border-t border-t-black border-b border-b-black  md:py-6 sm:py-3 md:px-10 sm:px-3 md:mt-10 sm:mt-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div class="flex items-center"><img src="<c:url value="/resources/img/4187236.png" />" class="md:w-[40px] sm:w-[30px]" alt="">&nbsp;&nbsp;&nbsp;Add Social Media Accounts</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-4" class="hidden " aria-labelledby="accordion-collapse-heading-4">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal1" data-modal-toggle="default-modal1" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                <i class="fa-solid fa-plus"></i>
                                </button>
							</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal1" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add accounts
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal1">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/js/create/socialMedia" method="post">
                                            <input type="hidden" name="userId" value="${userId}"/>
                                                <div class="mb-3">
                                                    <label for="">Accounts</label>
                                                    <select name="name" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" placeholder="Enter account" id="">
                                                    	<option value="Facebook">Facebook</option>
                                                    	<option value="Instagram">Instagram</option>
                                                    	<option value="Twitter">Twitter</option>
                                                    	<option value="Tiktok">Tiktok</option>
                                                    	<option value="Viber">Viber</option>
                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="">Link</label>
                                                    <input type="text" name="link" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" placeholder="Enter account link" required id="">
                                                </div>

                                                <button class="px-3 py-2 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Add Now</button>
                                            </form>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              
                                                <!-- end of modal -->
 
                        </div>
<!-- Modal toggle -->
   
  
                                              <c:if test="${empty medias}">
    <p>No social media have been set on your profile</p>
</c:if>
<c:if test="${not empty medias}">
        <c:forEach var="media" items="${medias}">
            <div class="flex gap-5  my-2 group hover-trigger">
                    <i class="fa-brands fa-${fn:toLowerCase(media.name)} text-2xl text-purple-800"></i>
                    <div class="">
                      <a href="${media.link}" class="font-bold cursor-pointer">${media.link}</a>
                  		<a href="${pageContext.request.contextPath}/delete/media/${media.id}" class="opacity-0 target-element group-hover:opacity-100 text-black hover:text-red-500 bg-gray-300 py-1 px-2 rounded-lg">
						<i class="fa-solid fa-xmark"></i></a>
                    </div>
                  </div>
                  <hr>
        </c:forEach>

</c:if>
                  </div>
                  
                </div>
            </div>
<!-- start of read to work -->
           
             <c:if test="${sessionScope.trole == 'js' }">
             <div class="flex md:py-6 sm:py-3 md:px-10 sm:px-3 justify-between items-center">
                <div class="md:text-xl sm:text-md font-semibold flex items-center"> 
                    <i class="fa-solid fa-briefcase md:text-4xl sm:text-2xl"></i>&nbsp;&nbsp;&nbsp;Ready to work
                </div>
		                <form action="${pageContext.request.contextPath}/updateOpenStatus" method="post">
		                	<input type="hidden" name="userId" value="${userId}"/>
		                	<input type="hidden" name="openStatus" value="${!openStatus}"/>
			                	<div>
			                    <label class="inline-flex items-center cursor-pointer ">
			                        <input type="checkbox" value="${!openStatus}" class="sr-only peer" 
			                        ${openStatus ? "checked" : '' }
			                        onchange="this.form.submit()"
			                        >
			                        <div class="relative w-11 h-6 bg-gray-200 border border-black rounded-full peer dark:bg-gray-700 peer-focus:ring-4 peer-focus:ring-purple-300 dark:peer-focus:ring-purple-800 peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-0.5 after:start-[2px] after:bg-black after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-purple-600"></div>
			                      </label>
			                </div>
		                </form>
					
            </div>
					</c:if>
					<c:if test="${sessionScope.trole=='company'}">
						
						<div class="md:text-xl sm:text-md font-semibold mt-5"> 
		                    <i class="fa-solid fa-briefcase md:text-4xl sm:text-2xl"></i>&nbsp;&nbsp;&nbsp;
		                    ${openStatus ? "This user is currently finding a job." : "This user is not finding a job."}
		                </div>
		                
					</c:if>
           
            <!-- end of projects -->
           
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>