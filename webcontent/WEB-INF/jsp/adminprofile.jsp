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
        .border-active{
            
            border-color:#7905EE;
        }
      </style>
</head>
 <%
        String contextPath = ((HttpServletRequest) pageContext.getRequest()).getContextPath();
  %>
<body class="font-cabin bg-[#F6F3F3]" onload=display_ct();>
    <div class="container max-w-screen-xl mx-auto p-2 h-screen">
        <div class="w-full h-72 bg-[#9696E8] rounded relative"> 
            <div class="w-full h-fit px-6 pt-6 absolute flex gap-3">
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
                    
                    <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity rounded">
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
                       <div class="flex items-center justify-start p-2 mt-3 hover-bg-opacity active rounded">
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
                           <!--  <i class="fa-solid fa-user" style="color: #ffffff; font-size:20px;"></i> -->
                            &nbsp; <span class="text-xl font-bold text-white">Admin Profile</span>
                        </div>
                        <div class="flex justify-end justify-self-end gap-3">
    <span id='ct' class="rounded p-2 text-white"></span>
    <i class="fa-solid fa-bell" style="color: #ffffff; font-size:20px; margin-top:7px;"></i>
    <img src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}" class="w-10 h-10 rounded-full">
</div>                  
                    </div>


                   
            <div class="mt-5 w-full bg-white shadow-md h-fit p-7 rounded">
                <div class="flex flex-row flex-wrap justify-between">
                    <div class="flex flex-row flex-wrap gap-2 text-center">
                        <img src="<%= contextPath %>/resources/Upload_image/${admin.adminPhoto}" class="w-20 h-20 rounded-full" >
                        <div class="flex flex-col flex-wrap mt-4">
                            <h2 class="font-bold text-lg">Profile Picture</h2>
                            
                        </div>
                    </div>
                    <div class="mt-4 flex flex-row flex-wrap justify-between gap-3">
                    <form:form method="POST" action="/Final_JN/adminprofile/uploadPhoto" enctype="multipart/form-data" modelAttribute="admin">
					<form:hidden path="adminId" />
					<input type="file" name="file"  class="text-xs ml-8 mb-4 font-semibold py-1 px-3 rounded-xl"  required="required"/>
                        <button type="submit" class="w-fit h-fit px-4 py-2 bg-[#7905EE] text-white rounded">
                            Upload New Picture
                        </button>
                       </form:form>
                       <form:form method="POST" action="/Final_JN/adminprofile/deletePhoto" modelAttribute="admin">
    					<form:hidden path="adminId" />
                        <button type="submit" class="w-fit h-fit px-4 py-2 bg-white border-2 rounded">
                            Delete
                        </button>
                        </form:form>
                        
                    </div>
                </div>
			<form:form action="/Final_JN/updateAdminProfile" method="post" cssClass="w-full" onsubmit="return validateForm()">
    <div class="w-full flex flex-col flex-wrap justify-between mt-5">
        <div class="w-full flex flex-row flex-wrap gap-2 text-left">
            <h2 class="font-semibold text-base">Full Name</h2>
        </div>
        <div class="w-full flex flex-row flex-nowrap justify-between gap-3 text-left mt-3">
            <div class="w-1/2 flex flex-col gap-2">
                
                <input type="text" name="firstName" value="${admin.firstName}" class="rounded border-2 shadow-md h-8m px-2">
                <span id="firstNameError" class="text-red-500 text-sm"></span>
            </div>
            
        </div>
    </div>

    <div class="w-full flex flex-col flex-wrap justify-between mt-5">
        <div class="w-full flex flex-col flex-wrap gap-2 text-left">
            <h2 class="font-semibold text-base">Contact Email</h2>
        </div>
        <div class="mt-4 w-full flex flex-row flex-nowrap justify-between gap-3 text-left mt-3">
            <div class="w-1/2 flex flex-col gap-2">
                <p class="text-gray-700">Email</p>
                <input type="text" name="email" value="${admin.email}" class="rounded border-2 shadow-md h-8 px-2">
                <span id="emailError" class="text-red-500 text-sm"></span>
            </div>
        </div>
    </div>

    <div class="w-full flex flex-col flex-wrap justify-between mt-5">
        <div class="w-full flex flex-col flex-wrap gap-2 text-left">
            <h2 class="font-semibold text-base">Password</h2>
            <span class="text-sm text-gray-500">Modify your current password.</span>
        </div>
        <div class="mt-4 w-full flex flex-row flex-nowrap justify-between gap-3 text-left mt-3">
            <div class="w-1/2 flex flex-col gap-2 relative">
    <p class="text-gray-700">Current Password</p>
    <input type="password" id="currentPassword" name="currentPassword" class="rounded border-2 shadow-md h-8 px-2 pr-10">
    <i id="toggleCurrentPassword" class="fa-solid fa-eye absolute right-2 top-1/2 transform -translate-y-1/2 cursor-pointer mt-3"></i>
    
</div>

    	
   


            <div class="w-1/2 flex flex-col gap-2 relative">
    <p class="text-gray-700">New Password</p>
    <input type="password" id="newPassword" name="newPassword" class="rounded border-2 shadow-md h-8 px-2 pr-10">
    <i id="toggleNewPassword" class="fa-solid fa-eye absolute right-2 top-1/2 transform -translate-y-1/2 cursor-pointer mt-3"></i>
    
</div>

        </div>
        <span id="newPasswordError" class="text-red-500 text-sm"></span>
        <span id="currentPasswordError" class="text-red-500 text-sm"></span>
        <c:if test="${not empty currentPasswordError}">
								<span class="text-red-500 text-sm">${currentPasswordError}</span>
	    </c:if>
        
    </div>
    <div class="w-full flex flex-row flex-wrap justify-end mt-5">
    	<button type="submit" class="bg-[#7905EE]  w-fit text-white py-2 px-4 rounded">Save Changes</button>
    </div>
</form:form>

                
                </div>
            </div>

             
        </div>
        
    </div>
</div>
<script>
function validateForm() {
    var isValid = true;

    // out"">

    // Get input values
    var firstName = document.getElementsByName("firstName")[0].value;
    
    var email = document.getElementsByName("email")[0].value;
    var currentPassword = document.getElementsByName("currentPassword")[0].value;
    var newPassword = document.getElementsByName("newPassword")[0].value;

    // Get error message elements
    var firstNameError = document.getElementById("firstNameError");
  
    var emailError = document.getElementById("emailError");
    var currentPasswordError = document.getElementById("currentPasswordError");
    var newPasswordError = document.getElementById("newPasswordError");

    // Clear previous error messages
    firstNameError.textContent = "";
  
    emailError.textContent = "";
    currentPasswordError.textContent = "";
    newPasswordError.textContent = "";

    // Validate full name
    if (firstName.trim() === "") {
        firstNameError.textContent = "Please enter your first name.";
        isValid = false;
    }
  

    // Validate email
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        emailError.textContent = "Please enter a valid email address.";
        isValid = false;
    }

    // Passwords are optional; validate only if one is provided
    var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (currentPassword.trim() !== "" || newPassword.trim() !== "") {
        if (currentPassword.trim() === "") {
            currentPasswordError.textContent = "Please enter your current password.";
            isValid = false;
        }
        if (newPassword.trim() === "") {
            newPasswordError.textContent = "Please enter a new password.";
            isValid = false;
        } else if (!passwordPattern.test(newPassword)) {
            newPasswordError.textContent = "New password must be at least 8 characters long, include both uppercase and lowercase letters, a number, and a special character.";
            isValid = false;
        }
    }

    // Return false to prevent form submission if validation fails
    return isValid;
}


function confirmLogout(event) {
    event.preventDefault();  // Prevent the default anchor behavior
    if (confirm("Are you sure you want to log out?")) {
        window.location.href = '/Final_JN/logout';  // Redirect to logout if confirmed
    }
}


document.getElementById('toggleCurrentPassword').addEventListener('click', function() {
    var passwordField = document.getElementById('currentPassword');
    var eyeIcon = this;
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        eyeIcon.classList.remove('fa-eye');
        eyeIcon.classList.add('fa-eye-slash');
    } else {
        passwordField.type = 'password';
        eyeIcon.classList.remove('fa-eye-slash');
        eyeIcon.classList.add('fa-eye');
    }
});

document.getElementById('toggleNewPassword').addEventListener('click', function() {
    var passwordField = document.getElementById('newPassword');
    var eyeIcon = this;
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        eyeIcon.classList.remove('fa-eye');
        eyeIcon.classList.add('fa-eye-slash');
    } else {
        passwordField.type = 'password';
        eyeIcon.classList.remove('fa-eye-slash');
        eyeIcon.classList.add('fa-eye');
    }
});


</script>


   

</body>
</html>