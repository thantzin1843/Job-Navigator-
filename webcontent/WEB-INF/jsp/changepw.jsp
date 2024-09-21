<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Change Password</title>

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
      
    <!-- Fonts and Icons -->
    <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

    <style>
        .star {
            cursor: pointer;
            transition: color 0.2s;
        }
    </style>
</head>

<body class="font-cabin flex justify-center items-center min-h-screen">
    <div class="w-1/2 h-full bg-white shadow-md rounded p-10">
        <div class="w-full h-full flex flex-row justify-between">
            <h2 class="font-bold text-xl"><i class="fa-solid fa-lock"></i>&nbsp; Change Account Password</h2>
           <a href="/Final_JN/"> <button class="w-8 h-8" onclick="redirect()"><i class="fa-solid fa-xmark" style="color: #53616e; font-size:25px;"></i></button></a>
        </div>

        <div class="border-b border-gray-400 mt-5"></div>
		<c:if test="${not empty success}">
        <span class="text-green-500 text-sm">${success}</span>
    	</c:if>
    	<c:if test="${not empty error}">
        <span class="text-red-500 text-sm">${error}</span>
    	</c:if>
    	
        <!-- Form to change the password -->
        ${sessionScope.userId}
      <form:form method="post" action="/Final_JN/changePassword" class="w-full flex flex-col p-10 custom-md:p-2" onsubmit="return validateForm()">
    <label for="cpassword1" class="font-normal text-base">Current Password:</label>
    <div class="bg-gray-300 flex flex-row w-full h-10 justify-between rounded">
        <input type="password" class="w-full h-full bg-gray-300 rounded p-2" id="cpassword1" name="currentPassword" />
        <button class="mt-2 p-0" type="button" id="handle_btn1">
            <i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password1"></i>
            <i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password1"></i>
        </button>
     
            </div>
            <c:if test="${not empty error1}">
    <span class="text-red-500 text-sm">${error1}</span>
</c:if>
<span id="cPError" class="text-red-500 text-sm"></span>

            <label for="cpassword2" class="font-normal text-base mt-4">New Password:</label>
    <div class="bg-gray-300 flex flex-row w-full h-10 justify-between rounded">
        <input type="password" class="w-full h-full bg-gray-300 rounded p-2" id="cpassword2" name="newPassword" />
        <button class="mt-2 p-0" type="button" id="handle_btn2">
            <i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password2"></i>
            <i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password2"></i>
        </button>
        
      </div>
<span id="nPError" class="text-red-500 text-sm"></span>
            <label for="cpassword3" class="font-normal text-base mt-4">Confirm Password:</label>
    <div class="bg-gray-300 flex flex-row w-full h-10 justify-between rounded">
        <input type="password" class="w-full h-full bg-gray-300 rounded p-2" id="cpassword3" name="confirmPassword" />
        <button class="mt-2 p-0" type="button" id="handle_btn3">
            <i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password3"></i>
            <i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password3"></i>
        </button>
               
                
            </div>
 <span id="cfPError" class="text-red-500 text-sm"></span>
       
            <div>
                <button type="submit" value="Change Password" class="w-full py-2 bg-[#7905EE] text-white font-bold rounded mt-5" id="submit">
                Change Password</button>
            </div>
        </form:form>
    </div>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const handle_btn1 =document.getElementById('handle_btn1');
    const show_password1=document.getElementById('show_password1');
    const hide_password1=document.getElementById('hide_password1');
    var password1=document.getElementById("cpassword1") ;

    handle_btn1.addEventListener('click', function () {
        if (password1.type === "password") {
            hide_password1.classList.toggle('hidden');
            show_password1.classList.toggle('hidden');
            password1.type = "text";
        } else {
            password1.type = "password";
            hide_password1.classList.toggle('hidden');
            show_password1.classList.toggle('hidden');
        }
    });

    const handle_btn2 =document.getElementById('handle_btn2');
    const show_password2=document.getElementById('show_password2');
    const hide_password2=document.getElementById('hide_password2');
    var password2=document.getElementById("cpassword2") ;

    handle_btn2.addEventListener('click', function () {
        if (password2.type === "password") {
            hide_password2.classList.toggle('hidden');
            show_password2.classList.toggle('hidden');
            password2.type = "text";
        } else {
            password2.type = "password";
            hide_password2.classList.toggle('hidden');
            show_password2.classList.toggle('hidden');
        }
    });


    const handle_btn3 =document.getElementById('handle_btn3');
    const show_password3=document.getElementById('show_password3');
    const hide_password3=document.getElementById('hide_password3');
    var password3=document.getElementById("cpassword3") ;

    handle_btn3.addEventListener('click', function () {
        if (password3.type === "password") {
            hide_password3.classList.toggle('hidden');
            show_password3.classList.toggle('hidden');
            password3.type = "text";
        } else {
            password3.type = "password";
            hide_password3.classList.toggle('hidden');
            show_password3.classList.toggle('hidden');
        }
    });


}
);
   

function validateForm() {
    var isValid = true;

    // Get input values
    var cP = document.getElementsByName("currentPassword")[0].value;
    var nP = document.getElementsByName("newPassword")[0].value;
    var cfP = document.getElementsByName("confirmPassword")[0].value;

    // Get error message elements
    var cPError = document.getElementById("cPError");
    var nPError = document.getElementById("nPError");
    var cfPError = document.getElementById("cfPError");

    // Clear previous error messages
    cPError.textContent = "";
    nPError.textContent = "";
    cfPError.textContent = "";

    // Password strength pattern (e.g., 8+ chars, at least one uppercase, one lowercase, one number, and one special character)
    var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    // Validate current password
    if (cP.trim() === "") {
        cPError.textContent = "Please enter your current password.";
        isValid = false;
    }

    // Validate new password strength
    if (!nP.match(passwordPattern)) {
        nPError.textContent = "Password must be at least 8 characters long and contain one uppercase letter, one lowercase letter, one number, and one special character.";
        isValid = false;
    }

    // Validate confirm password matches new password
    if (nP !== cfP) {
        cfPError.textContent = "Confirm password does not match the new password.";
        isValid = false;
    }

    // Return false to prevent form submission if validation fails
    return isValid;
}

</script>
</body>
</html>
