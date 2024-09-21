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
            <div class="text-2xl mt-3 font-semibold">Edit Project</div>

            <form action="${pageContext.request.contextPath}/project/update" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="id" value="${project.id}"/>
                                                <div class="mb-3">
                                                    <label for="">Project Name<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="name" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" value="${project.name}" placeholder="Enter project name" required  id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Project Link<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="text" name="link" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" value="${project.link}" required  placeholder="Enter project link or github link" id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Project Image<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <input type="file" name="imageFile" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2"   id="">
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Description<span class="text-red-500 text-lg ms-1">*</span></label>
                                                    <textarea type="text" name="description" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" required  id="">${project.description}</textarea>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="">Contributors<span class="text-red-500 text-lg ms-1">*</span></label>  
                                                    <input type="text" name="contributor" class="px-3 py-2 border-2 border-[#9696E8] rounded-md block w-full mt-2" value="${project.contributor}"  required placeholder="Enter Contributors' name" id="">
                                                </div>
                                                <button class="px-3 py-2 bg-purple-600 w-full text-center text-white rounded-md shadow-lg">Add Now</button>
                                            </form>
           
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
</body>
</html>