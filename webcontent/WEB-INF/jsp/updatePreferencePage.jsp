<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
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

    <div class="w-full">
        <div class="md:w-1/2 sm:w-5/6 mx-auto bg-gray my-10 md:px-[50px] sm:px-[20px] pt-[10px] pb-[50px] shadow-sm shadow-black  rounded-xl">
            <div class="text-sm"><i class="fa-solid fa-arrow-left"></i>&nbsp;<a href="${pageContext.request.contextPath}/job_seeker/profile/${userId}">Profile</a></div>
            <div class="text-2xl mt-3 font-semibold">Job Preference</div>
            <div class="text-gray-500 text-sm">Sharing Preference helps connect you with relevant jobs and employees.</div>

            <form action="${pageContext.request.contextPath}/js/updateJobPreference" method="post" class="mt-5">
                <input type="hidden" name="userId" value="${js.userId}" />
                <div class="mb-3">
                    <label for="">Job Title</label>
                    <input type="text" name="title" value="${js.title}" <c:if test="${sessionScope.trole == 'company' }" >disabled</c:if> class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" placeholder="Enter job title" id="">
                </div>

                <div class="mb-3">
                    <label for="">Job Type</label>
                    <select name="type" value="${js.type}" <c:if test="${sessionScope.trole == 'company' }" >disabled</c:if> class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" id="">
                        <option value="Remote" <c:if test="${js.type == 'Remote'}">selected</c:if>>Remote</option>
                        <option value="Onsite"  <c:if test="${js.type == 'Onsite'}">selected</c:if> >Onsite</option>
                    </select>
                </div>

                <div class="flex gap-2 w-full">
                    <div class="mb-3 w-1/2">
                        <label for="">Work Schedule</label>
                        <select name="schedule" id="" <c:if test="${sessionScope.trole == 'company' }" >disabled</c:if> class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2">
                            <option value="Full time" <c:if test="${js.schedule == 'Full time'}">selected</c:if>>Full time</option>
                            <option value="Part time" <c:if test="${js.schedule == 'Part time'}">selected</c:if>>Part time</option>
                        </select>
                    </div>

                    <div class="mb-3 w-1/2">
                        <label for="">Salary</label>
                        <input type="number" name="salary" <c:if test="${sessionScope.trole == 'company' }" >disabled</c:if> class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" value="${js.salary }" placeholder="salary" id="">
                    </div>
                </div>
                <c:if test="${sessionScope.trole == 'js' }" >
					<button class="px-3 py-2 mt-5 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Update Preference Now</button>
				</c:if>
                
            </form>
           
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>