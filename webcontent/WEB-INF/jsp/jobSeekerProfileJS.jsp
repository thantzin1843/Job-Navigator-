<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   <link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
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

  .thin-scrollbar::-webkit-scrollbar {
          width: 5px; /* Set the width of the scrollbar */
      }

      .thin-scrollbar::-webkit-scrollbar-thumb {
          background-color: #C1C1EB; /* Set the color of the scrollbar thumb */
          border-radius: 10px;    /* Round the corners of the scrollbar thumb */
      }
      
      
   </style>
</head>
<body>
    <div class="w-full p-5 bg-primary text-white">
    <a href="${pageContext.request.contextPath}/">
    	<i class="fa-solid fa-arrow-left"></i>&nbsp;Back
    </a>
        
    </div>
    
     

    <div class="w-full flex py-5 md:px-10 sm:px-3 flex-wrap">
        <div class="sm:w-full md:w-1/3 sm:mb-3 bg-gray md:p-5 sm:p-3 rounded-lg shadow-sm overflow-hidden">
          <div class="flex flex-col items-center">
            <div class="w-[120px] h-[120px] border-2 shadow-xl imgContainer overflow-hidden flex justify-center items-center" >
            <c:if test="${not empty command.image}">
                    <img src="${pageContext.request.contextPath}/uploads/${command.image}" class="w-full h-full">
             </c:if>
            </div>
            <div class="text-[26px] text-[#7905EE] mt-3 font-bold">${command.name}</div>
            <div class="text-[24px] text-[#858181] font-semibold">${command.position}</div>
            <div class='flex justify-center gap-5 mt-3'>
              
              <c:if test="${not empty medias}">
        <c:forEach var="media" items="${medias}">
                  
                      <a href="${media.link}" class="font-bold cursor-pointer"><i class="fa-brands fa-${fn:toLowerCase(media.name)} text-2xl text-purple-800"></i></a>
        </c:forEach>

</c:if>
            </div>
            <p class="text-center mt-3">${command.bio}</p>
          </div>

           
          <div>
            <div class="text-[20px] mt-7 mb-5 font-bold flex justify-between ">
				<div>Skills</div>
				<c:if test="${sessionScope.trole == 'js' }">
				    <button data-modal-target="default-modal2" data-modal-toggle="default-modal2" class="text-white shadow-lg bg-[#9696E8] py-1 px-3 rounded-lg text-sm" type="button">
	                     Add skill  <i class="fa-solid fa-plus"></i>
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
                                            <form action="${pageContext.request.contextPath}/profile/saveSkill" method="post">
                                                <input type="hidden" name="userId" value="${sessionScope.tuserId }" />
                                                <div class="mb-3">
                                                    <label for="">Skills<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="skill" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required placeholder="Enter skill name" id="">
                                                </div>
                                                <button class="px-3 py-2 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Add Now</button>
                                            </form>
                                          </div>
                                      </div>
                                  </div>
                              </div>
			</div>
            <div class="flex flex-wrap gap-3">
            <c:if test="${not empty skillerrorMessage }">
			 	   <div id="toast-success" class="flex items-center w-full max-w-xs p-2 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 " role="alert">
			    <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
			        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
			            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
			        </svg>
			        <span class="sr-only">Error icon</span>
			    </div>
			    <div class="ms-3 text-sm font-normal"> ${skillerrorMessage}</div>
			    <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
			        <span class="sr-only">Close</span>
			        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
			            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
			        </svg>
			    </button>
				</div>
			 </c:if>
            	<c:if test="${empty skills}">
				    <p>No skills have been set on your profile</p>
				</c:if>
				<c:if test="${not empty skills}">
				        <c:forEach var="skill" items="${skills}">
				            <div class="bg-primary py-1 px-5 rounded-full font-semibold text-center text-sm">${skill.skill}&nbsp;&nbsp;
				            <c:if test="${sessionScope.trole=='js' }">
				            	<a href="${pageContext.request.contextPath}/delete/skill/${skill.id}" class="text-black hover:text-red-500">
				            	<i class="fa-solid fa-xmark"></i></a>
				            </c:if>
				            </div>
				        </c:forEach>
				</c:if>
             
            </div>
             
             
                              
                                                <!-- end of modal -->
                       
          </div>

				<div class="font-bold text-xl mt-5 mb-2">Notes</div>
				<ul class="max-w-md space-y-1 text-gray-500 list-disc list-inside dark:text-gray-400">
				<c:if test="${not empty noteerrorMessage }">
			 	   <div id="toast-success" class="flex items-center w-full max-w-xs p-2 text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800 " role="alert">
			    <div class="inline-flex items-center justify-center flex-shrink-0 w-8 h-8 text-red-500 bg-red-100 rounded-lg dark:bg-red-800 dark:text-red-200">
			        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
			            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 11.793a1 1 0 1 1-1.414 1.414L10 11.414l-2.293 2.293a1 1 0 0 1-1.414-1.414L8.586 10 6.293 7.707a1 1 0 0 1 1.414-1.414L10 8.586l2.293-2.293a1 1 0 0 1 1.414 1.414L11.414 10l2.293 2.293Z"/>
			        </svg>
			        <span class="sr-only">Error icon</span>
			    </div>
			    <div class="ms-3 text-sm font-normal"> ${noteerrorMessage}</div>
			    <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex items-center justify-center h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
			        <span class="sr-only">Close</span>
			        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
			            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
			        </svg>
			    </button>
				</div>
			 </c:if>
				    <c:if test="${empty notes}">
								    <li>No note have been set on your profile</li>
								</c:if>
								<c:if test="${not empty notes}">
								        <c:forEach var="note" items="${notes}">
								            <div class="flex justify-between group">
								            	<li class="hover-trigger">
								            ${note.note}
								            
								            </li>
								            <c:if test="${sessionScope.trole=='js' }">
								            	<div class="opacity-0 target-element group-hover:opacity-100"><a href="${pageContext.request.contextPath}/delete/note/${note.id}" class="px-2 py-1 bg-gray-300 rounded-md text-black hover:text-red-500">
								            	<i class="fa-solid fa-xmark"></i></a></div>
								            </c:if>
								            </div>
								        </c:forEach>
								</c:if>
				</ul>
				
				
			<c:if test="${sessionScope.trole == 'js' }">
				   <div>
		            <div class="text-[20px] mt-5 mb-1 font-bold">Add Note</div>
			            <form action="${pageContext.request.contextPath}/save/note" method="post">
			            <input type="hidden" name="userId" value="${command.user_id}"/>
			                <textarea name="note" id="" class="w-full bg-gray-100 rounded-md p-3" rows="5" required></textarea>
			                <button type="submit" class="w-full p-3 text-center rounded-sm bg-[#7905EE] text-white">Add Note</button>
			            </form>
			          </div>
			</c:if>
			
          

        </div>
        <div class="sm:w-full md:w-2/3 md:ps-5">
          <div class="bg-[#9696E8] md:p-5 sm:p-3 rounded-lg text-white flex flex-wrap">
            <div class="md:w-1/2 sm:w-full ">
                <div class="text-xl font-semibold">Personal Informations</div>
                <table class="w-full text-md mt-5">
                  <c:if test="${not empty command.dob}">
                  	<tr>
                    <td class="text-[18px] py-1 font-semibold">Date of Birth</td>
                    <td class="text-[18px] py-1">:&nbsp;${command.dob}</td>

                  </tr>
                  </c:if>
                  <tr>
                    <td class="text-[18px] py-1 font-semibold">Email</td>
                    <td class="text-[18px] py-1">:&nbsp;${command.email}</td>
                    
                  </tr>
                  <tr>
                    <td class="text-[18px] py-1 font-semibold">Address</td>
                    <td class="text-[18px] py-1">:&nbsp;${command.address}</td>
                    
                  </tr>
                  <tr>
                    <td class="text-[18px] py-1 font-semibold">Phone</td>
                    <td class="text-[18px] py-1">:&nbsp;${command.phone}</td>
                    
                  </tr>
                </table>
            </div>
            <div class="md:w-1/2 sm:w-full ">
             <img src="<c:url value="/resources/img/folder.png"/>" class="w-2/3 md:block sm:hidden h-3/4" alt="">
              <div class="sm:mt-3 md:mt-0">
              <c:if test="${sessionScope.trole=='js' }">
				<button  data-modal-target="default-modal3" data-modal-toggle="default-modal3" class="px-5 py-2 border-2 rounded-sm bg-[#7905EE] border-[#7905EE]"><i class="fa-solid fa-download"></i>&nbsp;&nbsp;Upload Resume</button>
				
                              <!-- Main modal -->
                              <div id="default-modal3" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                                  <div class="relative p-4 w-full max-w-2xl max-h-full">
                                      <!-- Modal content -->
                                      <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                          <!-- Modal header -->
                                          <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                              <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                                  Add CV resume to Your Profile
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
                                            <form action="${pageContext.request.contextPath}/saveCV" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="userId" value="${sessionScope.tuserId}" />
                                                <div class="mb-3">
                                                    <label for="">CV resume</label>
                                                    <input type="file" name="cv" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2"  id=""/>
                                                </div>
                                                <button type="submit" class="px-3 py-2 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Add Now</button>
                                            </form>
                                          </div>
                                      </div>
                                  </div>
                              </div>
				
                <a href="${pageContext.request.contextPath}/js/editProfile/page" class="px-5 py-2 border-2 rounded-sm border-[#7905EE] bg-white text-[#7905EE]"><i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;Edit Profile</a>
			</c:if>
			
                <c:if test="${sessionScope.trole=='company'}">
                	<div class="w-full flex justify-center">
                		<a href="${pageContext.request.contextPath}/preview?filename=${command.cv}" class="px-5 py-2 border-2 rounded-sm bg-[#7905EE] border-[#7905EE]"><i class="fa-solid fa-download"></i>&nbsp;&nbsp;Download Resume</a>
                	</div>
                </c:if>
              
              </div>
            </div>
          </div>

          <div class="bg-gray
          rounded-lg
          mt-3  p-5">
          <div class="text-xl font-semibold mb-5 ">Work experiences</div>
            <div class="flex overflow-scroll ps-[10px] pt-[5px] thin-scrollbar relative">
              <div class="w-2/3 h-[180px]">
                <!-- Start of time line -->
                
  <c:if test="${empty workExperiences}">
    <p>No work experience has been set on your profile</p>
</c:if>
<c:if test="${not empty workExperiences}">
        <c:forEach var="workExp" items="${workExperiences}">
            <ol class="relative border-s border-purple-500  ps-[20px]">                  
			  <li class=" ms-6">
			    <span class="absolute flex items-center justify-center w-3 h-3 bg-blue-100 bg-purple-400 rounded-full -start-1.5  ring ring-purple-400 dark:ring-gray-900 dark:bg-blue-900">
			       
			    </span>
			    <h3 class="mb-1  font-semibold text-gray-900 dark:text-white">${workExp.position }</h3>
			    <div><i class="fa-solid fa-building text-purple-400"></i> ${workExp.company}</div>
			    <time class="block mb-2 text-sm font-normal leading-none text-gray-400 dark:text-gray-500  pb-2">
<fmt:formatDate value="${workExp.start}" pattern="yyyy-MMM-dd" /> <span class="text-blue-500 font-bold">&nbsp;-&nbsp;</span> 
                <fmt:formatDate value="${workExp.end}" pattern="yyyy-MMM-dd" /> </time>
			    
			</li>
			</ol>
         
        </c:forEach>
</c:if>              
                
                         
<!--  <ol class="relative border-s border-purple-500 ps-[20px]">                  
  <li class="ms-6">
    <span class="absolute flex items-center justify-center w-3 h-3 bg-blue-100 bg-purple-400 rounded-full -start-1.5  ring ring-purple-400 dark:ring-gray-900 dark:bg-blue-900">
       
    </span>
    <h3 class="mb-1  font-semibold text-gray-900 dark:text-white">Lead UIUX Designer</h3>
    <div><i class="fa-solid fa-building text-purple-400"></i> Pixel Studio</div>
    <time class="block mb-2 text-sm font-normal leading-none text-gray-400 dark:text-gray-500  pb-2">April 2021 - Present | Germany</time>
    
</li>
</ol>-->




                <!-- end of time tline -->
              </div>
              <div class="w-1/3 flex flex-col items-center justify-center">
                <img src="<c:url value="/resources/img/laptop.png" />" class="w-full h-full" alt="">
              </div>
              
          </div>
         <!--   <div class="w-full text-center text-gray-500 cursor-pointer border-t-2">Scroll</div>-->
          </div>
          <div>
            
  <div id="accordion-collapse-heading-3" class="bg-gray hover:bg-gray-200 mt-3 rounded-md overflow-hidden">
    <a href="${pageContext.request.contextPath}/create/qualifications/page" type="button" class="flex items-center  justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 gap-3" data-accordion-target="#accordion-collapse-body-3" aria-expanded="false" aria-controls="accordion-collapse-body-3">
      <div class="text-black">Qualifications</div>
      <i class="fa-solid fa-angle-right"></i>
    </a>
  </div>

  <div id="accordion-collapse-heading-3" class="bg-gray hover:bg-gray-200 mt-3 rounded-md overflow-hidden">
    <a href="${pageContext.request.contextPath}/create/preference/page" type="button" class="flex items-center  justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 gap-3" data-accordion-target="#accordion-collapse-body-3" aria-expanded="false" aria-controls="accordion-collapse-body-3">
      <div class="text-black">Job Preferences</div>
      <i class="fa-solid fa-angle-right"></i>
    </a>
  </div>

  <div id="accordion-collapse-heading-3" class="bg-gray hover:bg-gray-200 mt-3 rounded-md overflow-hidden">
    <a href="${pageContext.request.contextPath}/create/jsother/page" type="button" class="flex items-center  justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-gray-200 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-800 dark:border-gray-700 dark:text-gray-400 gap-3" data-accordion-target="#accordion-collapse-body-3" aria-expanded="false" aria-controls="accordion-collapse-body-3">
      <div class="text-black">Others</div>
      <i class="fa-solid fa-angle-right"></i>
    </a>
  </div>


          </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
   
</body>
</html>