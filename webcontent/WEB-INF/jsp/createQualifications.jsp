<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <style>
   	body{
    margin:0;
    padding: 0;
    overflow-x: hidden;
}
.bg-primary{
    background-color: #C1C1EB;
}

.bg-gray{
    background-color:#EDEDED;
}

.imgContainer{
    border-radius: 100%;
}
   </style>
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

 <c:if test="${not empty errorMessage }">
 	   <div id="toast-success" class="flex items-center w-full max-w-xs p-4 mb-4 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 absolute top-5 right-5 " role="alert">
    <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
        </svg>
        <span class="sr-only">Error icon</span>
    </div>
    <div class="ms-3 text-sm font-normal"> ${errorMessage}</div>
    <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
        <span class="sr-only">Close</span>
        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
        </svg>
    </button>
	</div>
 </c:if>
    <div class="w-full">
        <div class="md:w-1/2 sm:w-5/6 mx-auto bg-gray my-5 md:px-[50px] sm:px-[20px] py-[10px] shadow-sm shadow-black  rounded-xl">
            <div class="text-sm"><i class="fa-solid fa-arrow-left"></i>&nbsp;<a href="${pageContext.request.contextPath}/job_seeker/profile/${userId}">Profile</a></div>
            <div class="text-2xl mt-3 font-semibold">Qualifications</div>
            <div class="text-gray-500 text-sm">We use these details to show you jobs that match your skills and experience</div>

            <!-- Education -->
            <div id="accordion-collapse" data-accordion="collapse" class="rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-3" data-accordion-target="#accordion-collapse-body-3" aria-expanded="false" aria-controls="accordion-collapse-body-3" class="border-t border-t-black mt-5 py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div><i class="fa-solid fa-graduation-cap text-3xl"></i>&nbsp;&nbsp;&nbsp;Add Education</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-3" class="hidden " aria-labelledby="accordion-collapse-heading-3">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                        <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal" data-modal-toggle="default-modal" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add Education <i class="fa-solid fa-plus"></i>
                                </button>
						</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add Education to Your Profile
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/save/js/education" method="post">
                                            	<input type="hidden" name="userId" value="${userId}" />
                                                <div class="mb-3">
                                                    <label for="">University<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="university" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter university name" id="">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="">Major<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="major" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter university name" id="">
                                                </div>

                                                <div class="flex gap-2 w-full">
                                                    <div class="mb-3 w-1/2">
                                                        <label for="">From<span class="text-red-500 text-lg ms-1">*</span></label>
                                                        <input type="date" name="start" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter university name" id="">
                                                    </div>
    
                                                    <div class="mb-3 w-1/2">
                                                        <label for="">To<span class="text-red-500 text-lg ms-1">*</span></label>
                                                        <input type="date" name="end" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter university name" id="">
                                                    </div>
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
  
  <c:if test="${empty educationList}">
    <p>No education details have been set on job seeker profile</p>
</c:if>
<c:if test="${not empty educationList}">
  
        <c:forEach var="education" items="${educationList}">
             <div class="flex gap-5  my-2 group">
                    <div class="w-4 h-4 bg-[#9696E8] rounded-full mt-1"></div>
                    <div class="flex justify-between w-full hover-trigger"> 
                      <div>
                      	<div class="font-bold">${education.university}</div>
                      <div class="text-[#8035FB]">${education.major}</div>

							
							<fmt:formatDate value="${education.start}" pattern="yyyy-MMM-dd" /> <span class="text-blue-500 font-bold">&nbsp;-&nbsp;</span> 
                			<fmt:formatDate value="${education.end}" pattern="yyyy-MMM-dd" />
                      </div>
                      <c:if test="${sessionScope.trole=='js' }">
                      	<div class="opacity-0 target-element group-hover:opacity-100">
                      	<a href="${pageContext.request.contextPath}/delete/education/${education.id}" class="text-black hover:text-red-500 bg-gray-300 py-1 px-2 rounded-lg">
						<i class="fa-solid fa-xmark"></i></a>
                      </div>
                      </c:if>

                    </div>
                  </div>
                <hr>
        </c:forEach>
 
</c:if>
                 

                
                  </div>
                </div>
            </div>
            
            <!-- Languages -->

            <div id="accordion-collapse1" data-accordion="collapse" class=" rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-4" data-accordion-target="#accordion-collapse-body-4" aria-expanded="false" aria-controls="accordion-collapse-body-4" class="border-t border-t-black  py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div><i class="fa-solid fa-language text-3xl"></i>&nbsp;&nbsp;&nbsp;Add Language</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-4" class="hidden " aria-labelledby="accordion-collapse-heading-4">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            	<button data-modal-target="default-modal1" data-modal-toggle="default-modal1" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add Languages <i class="fa-solid fa-plus"></i>
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
                                                  Add Languages to Your Profile
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
                                            <form action="${pageContext.request.contextPath}/saveLanguage" method="post">
                                            	 <input type="hidden" name="userId" value="${userId}" />
                                                <div class="mb-3">
                                                    <label for="">Language<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="name" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter language" id="">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="">Profiency</label>
                                                    <select name="proficiency" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2">
                                                    	<option value="Beginner">Beginner</option>
                                                    	<option value="Intermediate">Intermediate</option>
                                                    	<option value="Fluent">Fluent</option>
                                                    </select>
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
  
  <c:if test="${empty languages}">
    <p>No languages have been set on job seeker profile</p>
</c:if>
<c:if test="${not empty languages}">
        <c:forEach var="language" items="${languages}">
            <div class="flex gap-5  my-2 group">
                    <div class="w-4 h-4 bg-[#9696E8] rounded-full mt-1"></div>
                    <div class="flex justify-between w-full hover-trigger">
                    	<div>
	                      <div class="font-bold">${language.name}</div>
	                      <div class="text-[#8035FB]">${language.proficiency}</div>
	                  
	                    </div>
	                    <c:if test="${sessionScope.trole == 'js'}">
	                    	<div class="opacity-0 target-element group-hover:opacity-100">
	                    	<a href="${pageContext.request.contextPath}/delete/language/${language.id}" class="bg-gray-300 py-1 px-2 rounded-lg text-black hover:text-red-500">
	                    	<i class="fa-solid fa-xmark"></i></a>
	                    </div>
	                    </c:if>
                    
                    </div>
                  </div>
                  <hr>
        </c:forEach>

</c:if>
                  

                  <!-- <div class="flex gap-5  my-2">
                    <div class="w-4 h-4 bg-[#9696E8] rounded-full mt-1"></div>
                    <div>
                        <div class="font-bold">Japan</div>
                        <div class="text-[#8035FB]">Beginner</div>
                    </div>
                  </div>
                  <hr> -->
                  </div>
                </div>
            </div>
            <!-- Skills -->

            <div id="accordion-collapse2" data-accordion="collapse" class=" rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-5" data-accordion-target="#accordion-collapse-body-5" aria-expanded="false" aria-controls="accordion-collapse-body-5" class="border-t border-t-black  py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div><i class="fa-solid fa-award text-3xl"></i>&nbsp;&nbsp;&nbsp;Add Skills</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-5" class="hidden " aria-labelledby="accordion-collapse-heading-5">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal2" data-modal-toggle="default-modal2" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add skills <i class="fa-solid fa-plus"></i>
                                </button>
							</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal2" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add skills to Your Profile
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal2">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/saveSkill" method="post">
                                                <input type="hidden" name="userId" value="${userId}" />
                                                <div class="mb-3">
                                                    <label for="">Skills<span class="text-red-500 ms-2">*</span></label>
                                                    <input type="text" name="skill" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter skill " id="">
                                                	
                                                </div>
                                                 <!--<c:if test="${not empty skillError}">
											            <div class="text-red-500 mt-2">
											                <p>${skillError}</p>
											            </div>
											        </c:if>-->
                                                <button class="px-3 py-2 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Add Now</button>
                                            </form>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              
                                                <!-- end of modal -->
                        </div>
<!-- Modal toggle -->
  
                  <div  class="flex gap-3 flex-wrap  my-2">
	                <c:if test="${empty skills}">
					    <p>No skills have been set on your profile</p>
					</c:if>
					<c:if test="${not empty skills}">
					        <c:forEach var="skill" items="${skills}">
					            <div class="bg-primary py-1 px-5 rounded-full font-semibold text-sm">${skill.skill}
					            <c:if test="${sessionScope.trole=='js' }">
				            	<a href="${pageContext.request.contextPath}/delete/skill/quapage/${skill.id}" class="text-black hover:text-red-500">
				            	<i class="fa-solid fa-xmark"></i></a>
				            </c:if>
					            </div>
					            
					        </c:forEach>
					</c:if>
                      <!-- <div class="font-bold py-1 px-3 rounded-md bg-purple-500">HTML</div>
                    
                      <div class="font-bold py-1 px-3 rounded-md bg-purple-500">HTML</div>
                      <div class="font-bold py-1 px-3 rounded-md bg-purple-500">HTML</div>
                      <div class="font-bold py-1 px-3 rounded-md bg-purple-500">HTML</div> -->
                  </div>
                  <hr>

                  </div>
                </div>
            </div>

            <!-- Certificates -->
            
            <div id="accordion-collapse3" data-accordion="collapse" class=" rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-6" data-accordion-target="#accordion-collapse-body-6" aria-expanded="false" aria-controls="accordion-collapse-body-6" class="border-t border-t-black  py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div class="flex"><img src="<c:url value="/resources/img/certificate-removebg-preview.png" />" class="w-[30px]" alt="">&nbsp;&nbsp;&nbsp;Add Certificates</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-6" class="hidden " aria-labelledby="accordion-collapse-heading-6">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal3" data-modal-toggle="default-modal3" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add Certificates <i class="fa-solid fa-plus"></i>
                                </button>
							</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal3" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add Certificates to Your Profile
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal3">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/saveJSCertificate" method="post" enctype="multipart/form-data">
                                                 <input type="hidden" name="userId" value="${userId}" />
                                                <div class="mb-3">
                                                    <label for="">Certificate<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="certificate" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter certificate name" id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Certificate Image</label>
                                                    <input type="file" name="imageFile" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter university name" id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">About<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <textarea type="text" name="about" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required  id=""></textarea>
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
  
<div>
<c:if test="${empty certificates}">
    <p>No certificates have been set on job seeker profile</p>
</c:if>
<c:if test="${not empty certificates}">
        <c:forEach var="certificate" items="${certificates}"> 
            <div class="flex justify-between group">
            	 <div class="flex gap-5 items-center my-2  hover-trigger">
        <div class="w-[100px] h-[100px] bg-[#9696E8]  mt-1">
            <img src="${pageContext.request.contextPath}/uploads/${certificate.image}" class="w-full h-full " alt="">
        </div>
        <div>
          <div class="font-bold">${certificate.certificate}</div>
          <div class="text-gray-500">${certificate.about}</div>
        </div>
      </div>
        <c:if test="${sessionScope.trole=='js' }">
			<div class="opacity-0 target-element group-hover:opacity-100 pt-3">
			<a href="${pageContext.request.contextPath}/delete/certificate/${certificate.id}" class="px-2 py-1 bg-gray-300 rounded-md text-black hover:text-red-500 ">
				            	<i class="fa-solid fa-xmark"></i></a>
			</div>	            	
		</c:if>
            </div>
      <hr>
     </c:forEach>
</c:if>
   
</div>

                  </div>
                </div>
            </div>

            <!-- Work experience -->
            <div id="accordion-collapse4" data-accordion="collapse" class="rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-9" data-accordion-target="#accordion-collapse-body-9" aria-expanded="false" aria-controls="accordion-collapse-body-9" class="border-t border-t-black py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div><i class="fa-solid fa-briefcase text-3xl"></i>&nbsp;&nbsp;&nbsp;Add Work Experience</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-9" class="hidden " aria-labelledby="accordion-collapse-heading-9">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal9" data-modal-toggle="default-modal9" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add Work Experience <i class="fa-solid fa-plus"></i>
                                </button>
							</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal9" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add Work Experience to Your Profile
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal9">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/js/saveExp" method="post">
                                            <input type="hidden" name="userId" value="${userId}" />
                                                <div class="mb-3">
                                                    <label for="">Company Name<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="company" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter company name" id="">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="">Position<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="position" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter position" id="">
                                                </div>

                                                <div class="flex gap-2 w-full">
                                                    <div class="mb-3 w-1/2">
                                                        <label for="">From<span class="text-red-500 text-lg ms-1">*</span></label>
                                                        <input type="date" name="start" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2"  required id="">
                                                    </div>
    
                                                    <div class="mb-3 w-1/2">
                                                        <label for="">To<span class="text-red-500 text-lg ms-1">*</span></label>
                                                        <input type="date" name="end" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required id="">
                                                    </div>
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
  <c:if test="${empty workExperiences}">
    <p>No work experience has been set on job seeker profile</p>
</c:if>
<c:if test="${not empty workExperiences}">
        <c:forEach var="workExp" items="${workExperiences}">
            <div class="my-2 group flex justify-between">
            	<div class="flex gap-5 hover-trigger ">
                    <div class="w-4 h-4 bg-[#9696E8] rounded-full mt-1"></div>
                    <div>
                      <div class="font-bold">${workExp.company}</div>
                      <div class="text-[#8035FB]">${workExp.position}</div>
                      <div class="text-gray-500">
<fmt:formatDate value="${workExp.start}" pattern="yyyy-MMM-dd" /> <span class="text-blue-500 font-bold">&nbsp;-&nbsp;</span> 
                <fmt:formatDate value="${workExp.end}" pattern="yyyy-MMM-dd" />
</div>
                    </div>
                  </div>
                  <c:if test="${sessionScope.trole=='js' }">
					<div class="opacity-0 target-element group-hover:opacity-100 pt-3">
					<a href="${pageContext.request.contextPath}/delete/exp/${workExp.id}" class="text-black hover:text-red-500 bg-gray-300 py-1 px-2 rounded-lg">
						            	<i class="fa-solid fa-xmark"></i></a>
					</div>	            	
				</c:if>
            </div>
                  <hr>
        </c:forEach>
</c:if>
                  
                  <hr>
                  </div>
                </div>
            </div>

            <!-- Addd projects / accomplishment -->
         
            <div id="accordion-collapse5" data-accordion="collapse" class=" rounded-lg overflow-hidden">
                <div id="accordion-collapse-heading-11" data-accordion-target="#accordion-collapse-body-11" aria-expanded="false" aria-controls="accordion-collapse-body-11" class="border-t border-t-black  py-6 md:px-10 sm:px-5 md:text-xl sm:text-md font-semibold flex justify-between items-center">
                    <div><i class="fa-regular fa-clipboard text-3xl"></i>&nbsp;&nbsp;&nbsp;Add Projects</div><i class="fa-solid fa-angle-down"></i>
                </div>
                <div id="accordion-collapse-body-11" class="hidden " aria-labelledby="accordion-collapse-heading-11">
                  <div class="p-5 border border-t-0  dark:border-gray-700">
                    <!-- modal  -->
                        
                        <div class="w-full flex justify-end">
                             <c:if test="${sessionScope.trole == 'js' }">
				   
                            <button data-modal-target="default-modal11" data-modal-toggle="default-modal11" class="text-white shadow-lg bg-[#9696E8] p-2 rounded-md text-sm" type="button">
                                Add Projects <i class="fa-solid fa-plus"></i>
                                </button>
							</c:if>
                              
                              <!-- Main modal -->
                              <div id="default-modal11" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add Projects to Your Profile
                                              </h3>
                                              <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal11">
                                                  <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                                                  </svg>
                                                  <span class="sr-only">Close modal</span>
                                              </button>
                                          </div>
                                          <!-- Modal body -->
                                          <div class="p-5">
                                            <form action="${pageContext.request.contextPath}/js/saveProject" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="userId" value="${userId}"/>
                                                <div class="mb-3">
                                                    <label for="">Project Name<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="name" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" placeholder="Enter project name" required  id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Project Link<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="link" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required  placeholder="Enter project link or github link" id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Project Image<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="file" name="imageFile" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required   id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Description<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <textarea type="text" name="description" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required  id=""></textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Contributors<span class="text-red-500 text-lg ms-1">*</span></label>  
                                                    <input type="text" name="contributor" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2"  required placeholder="Enter Contributors' name" id="">
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
  <c:if test="${empty projects}">
    <p>No projects have been set on job seeker profile</p>
</c:if>
<c:if test="${not empty projects}">

        <c:forEach var="project" items="${projects}">
            <div>
                        <div class="flex flex-wrap items-center my-2 group">
                            <div class="md:w-1/2 sm:w-full flex flex-wrap hover-trigger">
                                    <img src="${pageContext.request.contextPath}/uploads/${project.image}" class="w-full h-full  shadow-lg" alt="">
              
                            </div>
                            <div class="md:w-1/2 sm:w-full ps-3">
                            <div class="font-bold">${project.name}</div>
                            <div class="text-blue-400 ">
                            	<a href="">${project.link}</a>
                            </div>
                            <div class="text-gray-500">${project.description}</div>
                            <div>
                                <h3 class="font-bold mt-2 text-lg">Contributors</h3>
                                <div>${project.contributor}</div>
                            </div>
                            <div>
                            	<c:if test="${sessionScope.trole=='js' }">
									<div class="opacity-0 target-element group-hover:opacity-100 pt-3">
									<a href="${pageContext.request.contextPath}/delete/project/${project.id}" class="text-black hover:text-red-500 bg-gray-300 py-1 px-2 me-1 rounded-lg">
										            	<i class="fa-solid fa-xmark"></i></a>
									<a href="${pageContext.request.contextPath}/delete/project/editPage/${project.id}" class="text-black hover:text-red-500 bg-gray-300 py-1 px-2 rounded-lg">
										            	<i class="fa-solid fa-edit"></i></a>
									</div>	            	
								</c:if>
                            	
                            </div>
                        
                        </div>
                        </div>
                        <hr class="h-[1px] bg-black">
                    </div>
        </c:forEach>
</c:if>
                  </div>
                </div>
            </div>

            <!-- end of projects -->
           
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>