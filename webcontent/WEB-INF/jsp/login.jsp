<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Navigator</title>
    
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
    <style type="text/tailwindcss">
        @layer utilities {
          .content-auto {
            content-visibility: auto;
          }
        }
		.hideForm{
    		height: 0;
    		overflow: hidden;
		}

		.btnActive{
    		color:white;
    		background-color:#8035FB
		}
      </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="w-full flex">
        <div class="md:w-1/2 sm:w-full flex justify-center items-center my-[50px]">
            <div class="w-2/3 ">
                <div class="flex justify-center">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" class="w-1/2" alt="">
                </div>
                <div class="border mt-10 mb-7  border-[#9696E8] w-full rounded-xl p-[1px] overflow-hidden mx-auto flex">
                    <button class="w-1/2 px-10 rounded-xl py-3 sm:text-sm md:text-md font-bold  btnActive" id="seekerbtn"><i class="fa-regular fa-user"></i>&nbsp;&nbsp;Job Seeker</button>
                    <button class="w-1/2 px-10 rounded-xl py-3  sm:text-sm md:text-md font-bold " id="employerbtn"><i class="fa-regular fa-building"></i>&nbsp;&nbsp;Employer</button>
                </div>
                
                <span class="">
                	<c:if test="${not empty error}">
					    <div class="text-red-500 text-sm"  id="error_show">
					        ${error}
					    </div>
					</c:if>
                </span>
                <div class="relative">
                    <form:form action="/Final_JN/login/js_login" mehtod="post" id="seekerForm" class="sForm" onsubmit="return validateForm()">
                       
        				<input type="hidden" name="role" value="JobSeeker">
                        <div class="mt-3 w-full">
                            <div class="text-sm">Email<span class="font-bold text-red-500">*</span></div>
                            <input type="email" name="email" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                        </div>
                        
                        <div class="mt-3 w-full">
                            <div class="text-sm">Password<span class="font-bold text-red-500">*</span></div>
                            <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
	                            <input type="password" name="password" class="w-full py-1 px-2 rounded-md" id="cpassword1" placeholder="" required/>
	                            <button class="mt-2 p-0" type="button" id="handle_btn1">
						            <i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password1"></i>
						            <i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password1"></i>
						        </button>
					        </div>
                        </div>
        
                        <div class="mt-5 w-full">
                            <input type="submit" class="w-full bg-[#8035FB] hover:bg-purple-900 cursor-pointer text-white py-2 px-2 rounded-md" value="Login"/>
                        </div>
                        
                        <div class="mt-2 w-full flex justify-center">
                               <span class="text-sm ">Doesn't have an account?</span> <a href="signup" class="font-bold text-sm text-[#8035FB]">Sign up</a>
                        </div>
                        
                    </form:form>
    
                    <form:form action="/Final_JN/login/comp_login" id="employerForm"  mehtod="post"  class="cForm hideForm">                       
                            
            				<input type="hidden" name="role" value="Company">
                            <div class="mt-3 w-full">
                                <div class="text-sm">Email<span class="font-bold text-red-500">*</span></div>
                                <input type="email" name="email" class="w-full border border-[#9696E8] outline-[#9696E8] py-1 px-2 rounded-md" placeholder="" required/>
                            </div>
                            <div class="mt-3 w-full ">
                                <div class="text-sm">Password<span class="font-bold text-red-500">*</span></div>
                                <div class="flex flex-row w-full h-10 justify-between rounded border border-[#9696E8] outline-[#9696E8]">
	                                <input type="password" name="password" class="w-full py-1 px-2 rounded-md" id="cpassword2" placeholder="" required/>
	                                <button class="mt-2 p-0" type="button" id="handle_btn2">
	            					<i class="fa-solid fa-eye w-8 h-8 pointer" id="show_password2"></i>
	            					<i class="fa-solid fa-eye-slash hidden w-8 h-8 pointer" id="hide_password2"></i>
	            					</button>
            					</div>        					
                            </div>

                            <div class="mt-5 w-full">
                                <button type="submit" id="continue" class="w-full bg-[#8035FB] hover:bg-purple-900 cursor-pointer text-white py-2 px-2 rounded-md">Login</button>
                            </div>
                            
                            <div class="mt-2 w-full flex justify-center">
                               <span class="text-sm ">Doesn't have an account?</span> <a href="signup" class="font-bold text-sm text-[#8035FB]">Sign up</a>
                            </div>
                    </form:form>
                </div>


            </div>
        </div>
        <div class="md:w-1/2 sm:hidden bg-[#9696E8] md:flex justify-center items-center h-lvh sticky top-0" >
            <div class="w-3/4 shadow-lg bg-[#ffffff99] rounded-xl flex flex-col items-center py-10  ">
                <img src="${pageContext.request.contextPath}/resources/images/viber_image_2024-07-16_21-47-36-505.png" class="w-3/4"/>
                <div class="w-full text-left ps-5 text-[#9606e8] font-bold text-2xl">Seamless Work Experience</div>
                <div class="text-center ps-2 w-full text-[#9606e8]">Everything you need is an easily customizable dashboard</div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        const seekerbtn = document.getElementById('seekerbtn');
        const employerbtn = document.getElementById('employerbtn');
        const jsValue = "${js}";

        employerbtn.addEventListener('click',function(e){
            document.getElementById('seekerForm').classList.add("hideForm");
            document.getElementById('employerForm').classList.remove("hideForm");
            seekerbtn.classList.remove('btnActive');
            employerbtn.classList.add('btnActive');

        })

        seekerbtn.addEventListener('click',function(e){
            document.getElementById('seekerForm').classList.remove("hideForm");
            document.getElementById('employerForm').classList.add("hideForm");
            employerbtn.classList.remove('btnActive');
            seekerbtn.classList.add('btnActive');
        })

   		console.log("Value of 'js':", jsValue);

       
        if (jsValue === "false") {
        	document.getElementById('seekerForm').classList.add("hideForm");
            document.getElementById('employerForm').classList.remove("hideForm");
            seekerbtn.classList.remove('btnActive');
            employerbtn.classList.add('btnActive');
        } else {
            console.log("The value is not false.");
        }

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


            
        }
        );

    
    </script>
</body>
</html>