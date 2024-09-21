<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Sign Up</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
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
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
	        const seekerbtn = document.getElementById('seekerbtn');
	        const employerbtn = document.getElementById('employerbtn');
	        const roleInput = document.getElementById('roleInput');
	        const continuebtn = document.getElementById('continue');
	        const back = document.getElementById('back');
	
	        employerbtn.addEventListener('click', function(e) {
	            document.getElementById('seekerForm').classList.add("hideForm");
	            document.getElementById('employerForm').classList.remove("hideForm");
	            seekerbtn.classList.remove('btnActive');
	            employerbtn.classList.add('btnActive');
	            roleInput.value = "company"; 
	        })
	
	        seekerbtn.addEventListener('click', function(e) {
	            document.getElementById('seekerForm').classList.remove("hideForm");
	            document.getElementById('employerForm').classList.add("hideForm");
	
	            document.getElementById('secondInfo').classList.add("hideForm");
	            document.getElementById('firstInfo').classList.remove("hideForm");
	            employerbtn.classList.remove('btnActive');
	            seekerbtn.classList.add('btnActive');
	            roleInput.value = "job_seeker"; 
	        })
	
	        continuebtn.addEventListener('click', function(e) {
	            e.preventDefault()
	            
	            document.getElementById('secondInfo').classList.remove("hideForm");
	            document.getElementById('firstInfo').classList.add("hideForm");
	            
	        })
	
	        back.addEventListener('click', function(e) {
	            e.preventDefault()
	            document.getElementById('secondInfo').classList.add("hideForm");
	            document.getElementById('firstInfo').classList.remove("hideForm");
	        })
	    });
 	</script>
    <style type="text/tailwindcss">
        @layer utilities {
          .content-auto {
            content-visibility: auto;
          }
        }
      </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css" />
</head>
<body>
    <div class="w-full flex">
        <div class="md:w-1/2 sm:w-full flex justify-center items-center my-[50px]">
            <div class="w-2/3 ">
                <div class="flex justify-center">
                	<img src="${pageContext.request.contextPath}/resources/img/logo1.png" alt="Logo">
                </div>
                
                <div class="text-center text-xl mb-3">Welcome New User</div>
                
                <div class="border mt-10 mb-7  border-[#9696E8] w-full rounded-xl p-[1px] overflow-hidden mx-auto flex">
                    <button class="w-1/2 px-10 rounded-xl py-3 sm:text-sm md:text-md font-bold  btnActive" id="seekerbtn"><i class="fa-regular fa-user"></i>&nbsp;&nbsp;Job Seeker</button>
                    <button class="w-1/2 px-10 rounded-xl py-3  sm:text-sm md:text-md font-bold " id="employerbtn"><i class="fa-regular fa-building"></i>&nbsp;&nbsp;Company</button>
                </div>
                <c:if test="${not empty errorMessage}">
				            <div style="color: red; " class="w-full mb-3 text-center">${errorMessage}</div>
			 	</c:if>
                
                <div class="relative">
                    <form action="signup" method="post" id="seekerForm" class="sForm "  onsubmit="return validateForm1()">
                     	<input type="hidden" name="role" id="roleInput" value="JobSeeker"/>
                     	
                        <div class="flex gap-3">
                            <div class="flex-1">
                                <div class="text-sm">Name<span class="font-bold text-red-500">*</span></div>
                                <input type="text" name="name" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                            </div>
        
                            <div class="flex-1">
                                <div class="text-sm">Username<span class="font-bold text-red-500">*</span></div>
                                <input type="text" name="username" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                            </div>
                        
                        </div>
        
                        <div class="mt-3 w-full">
                            <div class="text-sm">Email<span class="font-bold text-red-500">*</span></div>
                            <input type="email" name="email" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                        </div>
        
                        <div class=" mt-3 flex gap-3">
                            <div class="flex-1">
                                <div class="text-sm">Phone</div>
                                <input type="text" name="phone" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="09765432456" pattern="^09([0-9]{7}|[0-9]{8}|[0-9]{9})$" />
                            </div>
        
                            <div class="flex-1">
                                <div class="text-sm">Country<span class="font-bold text-red-500">*</span></div>
                                <select name="country" id="" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" required>
                                        <option value="Myanmar">Myanmar</option>
                                        <option value="Thailand">Thailand</option>
                                </select>
                            </div>
                        
                        </div>
                        
                        <div class="mt-3 w-full">
                            <div class="text-sm">Password<span class="font-bold text-red-500">*</span></div>
                            <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
                            <input type="password"  name="password" class="w-full py-1 px-2 rounded-md" id="cpassword1" placeholder="" required/>
                            <button class="mt-2 p-0" type="button" id="handle_btn1">
	            					<i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password1"></i>
	            					<i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password1"></i>
	            			</button>
                            </div>
                        </div>
        
                        <div class="mt-3 w-full">
                            <div class="text-sm">Confirm Password<span class="font-bold text-red-500">*</span></div>
                            <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
                            <input type="password" name="confirmpassword" class="w-full py-1 px-2 rounded-md" id="cpassword2" placeholder="" required/>
                            	<button class="mt-2 p-0" type="button" id="handle_btn2">
	            					<i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password2"></i>
	            					<i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password2"></i>
	            				</button>
            				</div> 
                        </div>
                        
       					<!-- Display error message if present -->
				        
				        
				        <span id="nPError" class="text-red-500 text-sm"></span>
				        
                        <div class="mt-5 w-full">
                            <input type="submit" class="w-full bg-[#8035FB] hover:bg-purple-900 cursor-pointer text-white py-2 px-2 rounded-md" value="Create Account"/>
                        </div>
                        
                        <div class="mt-2 w-full flex justify-center">
                               <span class="text-sm ">Already have an account?</span> <a href="login" class="font-bold text-sm text-[#8035FB]">Login</a>
                            </div>
                    </form>
    
                   <form action="signup" method="post" id="employerForm" class="cForm hideForm" >
                   <input type="hidden" name="role" id="roleInput" value="Company"/>
                        <div class="" id="firstInfo">
                            <div class="flex gap-3">
                                <div class="flex-1">
                                    <div class="text-sm">Company Name<span class="font-bold text-red-500">*</span></div>
                                    <input type="text" name="name" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                                </div>
            
                                <div class="flex-1">
                                    <div class="text-sm">Username<span class="font-bold text-red-500">*</span></div>
                                    <input type="text" name="username" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                                </div>
                            
                            </div>
            
                            <div class="mt-3 w-full">
                                <div class="text-sm">Email<span class="font-bold text-red-500">*</span></div>
                                <input type="email" name="email" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                            </div>
            
                            <div class=" mt-3 flex gap-3">
                                <div class="flex-1">
                                    <div class="text-sm">Phone</div>
                                    <input type="text" name="phone" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="09765432456" pattern="^09([0-9]{7}|[0-9]{8}|[0-9]{9})$"/>
                                </div>
            
                                <div class="flex-1">
                                    <div class="text-sm">Country<span class="font-bold text-red-500">*</span></div>
                                    <select name="country" id="" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" required>
                                            <option value="Myanmar" selected>Myanmar</option>
                                            <option value="Thailand">Thailand</option>
                                    </select>
                                </div>
                            
                            </div>
                            
                            <div class="mt-3 w-full">
                                <div class="text-sm">Password<span class="font-bold text-red-500">*</span></div>
                                <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
                                	<input type="password" name="password" class="w-full py-1 px-2 rounded-md" placeholder="" id="cpassword3" required/>
                                	<button class="mt-2 p-0" type="button" id="handle_btn3">
	            					<i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password3"></i>
	            					<i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password3"></i>
	            					</button>
            					</div>
                            </div>
            
                            <div class="mt-3 w-full">
                                <div class="text-sm">Confirm Password<span class="font-bold text-red-500">*</span></div>
                                <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
                                <input type="password" name="confirmpassword" class="w-full py-1 px-2 rounded-md" placeholder="" id="cpassword4" required/>
                                <button class="mt-2 p-0" type="button" id="handle_btn4">
	            					<i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password4"></i>
	            					<i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password4"></i>
	            					</button>
            					</div>
                            </div>
                            
							
                            <div class="mt-5 w-full">
                                <button id="continue" class="w-full bg-[#8035FB] hover:bg-purple-900 cursor-pointer text-white py-2 px-2 rounded-md">Continue&nbsp;<i class="fa-solid fa-arrow-right"></i></button>
                            </div>
    						<div class="mt-2 w-full flex justify-center">
                               <span class="text-sm ">Already have an account?</span> <a href="login" class="font-bold text-sm text-[#8035FB]">Login</a>
                            </div>
                        </div>

                        <div class=" hideForm" id="secondInfo">
                            <button id="back" class="p-1 shadow-md text-[#8035FB] mb-3 rounded-md"><i class="fa-solid fa-arrow-left"></i>&nbsp;back</button>
                            <div class="flex gap-3">
                                <div class="flex-1">
                                    <div class="text-sm">Industry type<span class="font-bold text-red-500">*</span></div>
                                    <input type="text" name="industryType" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="Technology"/>
                                </div>
            
                                <div class="flex-1">
                                    <div class="text-sm">Company size<span class="font-bold text-red-500">*</span></div>
                                    	<select name="companySize" id="companySize" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md">
    										<option value="small">Small</option>
    										<option value="medium">Medium</option>
    										<option value="large">Large</option>
										</select>
                                </div>
                            
                            </div>
                            <div class="mt-3 w-full">
                                <div class="text-sm">Company Location (City)<span class="font-bold text-red-500">*</span></div>
                                <input type="text" name="location" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="Yangon, Myanmar"/>
                            </div>

					        
				        	<span id="nPError1" class="text-red-500 text-sm"></span>
                            <div class="mt-5 w-full">
                                <button type="submit" class="w-full bg-[#8035FB] hover:bg-purple-900 cursor-pointer text-white py-2 px-2 rounded-md">Create Company Account</button>
                            </div>
            
                        </div>  
                    </form>
                </div>
            </div>
        </div>
        <div class="md:w-1/2 sm:hidden bg-[#9696E8] md:flex justify-center items-center h-lvh sticky top-0" >
            <div class="w-3/4 shadow-lg bg-[#ffffff99] rounded-xl flex flex-col items-center py-10  ">
                    <img src="${pageContext.request.contextPath}/resources/img/viber_image_2024-07-16_21-47-34-445.png" alt="">
                <div class="w-full text-left ps-5 text-[#9606e8] font-bold text-2xl">Seamless Work Experience</div>
                <div class="text-center ps-2 w-full text-[#9606e8]">Everything you need is an easily customizable dashboard</div>
            </div>
        </div>
    </div>
    
    
    <script type="text/javascript">
    
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
        
        const handle_btn4 =document.getElementById('handle_btn4');
        const show_password4=document.getElementById('show_password4');
        const hide_password4=document.getElementById('hide_password4');
        var password4=document.getElementById("cpassword4") ;

        handle_btn4.addEventListener('click', function () {
            if (password4.type === "password") {
                hide_password4.classList.toggle('hidden');
                show_password4.classList.toggle('hidden');
                password4.type = "text";
            } else {
                password4.type = "password";
                hide_password4.classList.toggle('hidden');
                show_password4.classList.toggle('hidden');
            }
        });


        
    }
    );
    
    function validateForm1() {
        var isValid = true;

        // Get input values
        var cP = document.getElementsByName("password")[0].value;
        var nP = document.getElementsByName("confirmpassword")[0].value;
       

        // Get error message elements       
        var nPError = document.getElementById("nPError");
        

        // Clear previous error messages        
        nPError.textContent = "";
        

        // Password strength pattern (e.g., 8+ chars, at least one uppercase, one lowercase, one number, and one special character)
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

       

        // Validate new password strength
        if (!nP.match(passwordPattern)) {
            nPError.textContent = "Password must be at least 8 characters long and contain one uppercase letter, one lowercase letter, one number, and one special character.";
            isValid = false;
        }

        // Validate confirm password matches new password
        if (nP !== cP) {
            nPError.textContent = "Confirm password does not match .";
            isValid = false;
        }

        // Return false to prevent form submission if validation fails
        return isValid;
    }
    
   

    document.getElementById('employerForm').addEventListener('submit', function(e) {
        e.preventDefault();
	
        // Get password and confirm password values
        var password = document.getElementById('cpassword3').value;
        var confirmPassword = document.getElementById('cpassword4').value;

        var nPError1 = document.getElementById("nPError1");
        
        // Regular expression for password validation (at least 8 characters, one uppercase, one number, one special character)
        var passwordPattern = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        // Check if password matches the pattern
        var passwordValid = passwordPattern.test(password);
        if (!passwordValid) {
        	nPError1.textContent = "Password must be at least 8 characters long and contain one uppercase letter, one lowercase letter, one number, and one special character.";
            
        } 

        // Check if passwords match
        if (password !== confirmPassword) {
        	nPError1.textContent = "Confirm password does not match .";
        } 

        // If both are valid, submit the form
        if (passwordValid && password === confirmPassword) {
            this.submit();  // Submit the form if validation passes
        }
    });
    </script>
</body>
</html>