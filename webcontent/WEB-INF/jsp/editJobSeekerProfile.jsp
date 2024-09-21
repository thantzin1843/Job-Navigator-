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
		
		.hideImg{
			opacity:0;
			width:0;
			height:0;
		}
    </style>
</head>
<body>
    <!-- <div class="w-full p-5 bg-primary text-white">
        <i class="fa-solid fa-arrow-left"></i>&nbsp;Back
    </div> -->

    <div class="w-full">
        <div class="md:w-1/2 sm:w-5/6 mx-auto bg-[#E6E6FA] my-10 md:px-[50px] sm:px-[20px] pt-[10px] pb-[50px] shadow-sm shadow-black  rounded-xl">
            <div class="text-sm"><i class="fa-solid fa-arrow-left"></i>&nbsp;<a href="${pageContext.request.contextPath}/job_seeker/profile/${js.user_id}">Profile</a></div>
            <div class="text-2xl mt-3 font-semibold">Edit Profile</div>

            

            <form action="${pageContext.request.contextPath}/js/save/editedProfile" method="post" enctype="multipart/form-data" class="mt-[50px]">
            <div class=" flex items-center flex-wrap md:justify-between sm:justify-center md:my-5 sm:my-3">
                <div class="w-[150px] h-[150px] rounded-full overflow-hidden mb-5">
                <c:if test="${not empty js.image}">
                    <img src="${pageContext.request.contextPath}/uploads/${js.image}" class="w-full h-full">
                </c:if>
                </div>
                <div class="sm:mt-3">
                    <label class="border-2 border-[#7905EE] bg-[#7905EE] px-5 py-2 rounded-sm text-white" for="img">Change Profile</label>
                    <input type="file" name="img" id="img" class="hideImg"/>
                    <!--  <button class="border-2 border-red-500 bg-gray-200 text-red-500 px-5 py-2 rounded-sm text-black">Delete Picture</button>-->
                </div>
            </div>
            
                <input type="hidden" name="user_id" value="${js.user_id}"/>
                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Name:</label>
                    <input type="text" value="${js.name}" name="name" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>
                
                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Username:</label>
                    <input type="text" value="${js.username}" name="username" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>
                
                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Position:</label>
                    <input type="text" value="${js.position}" name="position" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>

                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Date of Birth:</label>
                    <input type="date" value="${js.dob}" name="dob" id="dob" class="w-4/5 px-3 py-1 rounded-md">
                </div>

                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Email:</label>
                    <input type="email" value="${js.email}" name="email" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>

                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Address:</label>
                    <input type="text" value="${js.address}" name="address" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>

                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Phone:</label>
                    <input type="text" value="${js.phone}" name="phone" id="" class="w-4/5 px-3 py-1 rounded-md">
                </div>

                <div class="flex gap-3 items-center mb-3">
                    <label for="" class="text-md font-bold w-1/5">Bio:</label>
                    <textarea name="bio" class="w-4/5 px-3 py-1 rounded-md" id="">
						${js.bio}
                    </textarea>
                </div>

                <div class="mt-10 flex justify-end gap-3">
                    
                    <button type="submit"  class="shadow-lg  bg-[#9696E8] px-5 py-2 rounded-sm text-white">Cancel</button>
                    <button type="submit"    class="shadow-lg  bg-[#9696E8] px-5 py-2 rounded-sm text-white">Save Changes</button>
                </div>
            </form>
           
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>