<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Integer jsId = (Integer) session.getAttribute("jobSeekerId");
	Integer companyId = (Integer) session.getAttribute("companyId");	
		                
%>
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
                extend: {
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
    
    <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
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
            <h2 class="font-bold text-xl"><i class="fa-solid fa-comment"></i>&nbsp; Review for Website</h2>
            <a href="/Final_JN/"><button class="w-8 h-8"><i class="fa-solid fa-xmark" style="color: #53616e; font-size:25px;"></i> </button></a>
        </div>
        

        <div class="border-b border-gray-400 mt-5"></div>
		
        <div class="w-full flex flex-wrap flex-col justify-center p-10 custom-md:p-2">
            <h3 class="w-full font-semibold text-lg text-center text-[#7905EE]">How do you think about this website?</h3>
            <p class="w-full text-[12px] text-center mt-2">Please give us suggestions and ratings for helping us better understand your needs and tailor our services accordingly.</p>

            <form action="/Final_JN/submitReview" method="post" class="w-full">
    <!-- <input type="hidden" name="companyId" value="8"/>
    <input type="hidden" name="companyId" value="${companyId != null ? companyId : ''}">
    <input type="hidden" name="jobSeekerId" value="${jobSeekerId != null ? jobSeekerId : ''}">-->
    <input type="hidden" name="companyId" value="<%= companyId != null ? companyId : "" %>">
	<input type="hidden" name="jobSeekerId" value="<%= jsId != null ? jsId : "" %>">
    
    <!-- Hidden input for the rating -->
    <input type="hidden" name="rating" id="rating-input" value="">
    
    <div id="rating" class="flex space-x-2 text-gray-400 mt-6 w-full justify-center">
        <i class="star fa fa-star fa-2x" data-value="1"></i>
        <i class="star fa fa-star fa-2x" data-value="2"></i>
        <i class="star fa fa-star fa-2x" data-value="3"></i>
        <i class="star fa fa-star fa-2x" data-value="4"></i>
        <i class="star fa fa-star fa-2x" data-value="5"></i>
    </div>

    <textarea name="reviewText" rows="13" id="input-textarea" maxlength="250" onkeyup="success()" class="w-full h-20 mt-10 bg-gray-300 p-3 rounded" placeholder="Write a comment here."></textarea>
   
    <!-- Word count -->
    <div class="flex flex-row flex-nowrap justify-end">
        <h5 id="charCount">0</h5>  
        <p> &nbsp;/ 250</p>
    </div>
    
    <div class="">
        <input type="submit" value="Submit Now" class="w-full py-2 bg-[#7905EE] text-white font-bold rounded mt-5 cursor-pointer" id="submit" disabled/>
    </div>
    <c:if test="${not empty success}">
        <span class="text-green-500 text-sm">${success}</span>
    	</c:if>
    	<c:if test="${not empty error}">
        <span class="text-red-500 text-sm">${error}</span>
    </c:if>
</form>
		
        </div>
    </div>

    <script>
        function redirect() {
            window.location.href = "jobSeeker_noti.html";
        }

        let max_length = 250;
        let input_textarea = document.getElementById("input-textarea");
        let char_no = document.getElementById("charCount");

        input_textarea.addEventListener("input", () => {
            let writing = input_textarea.value.length;
            char_no.textContent = writing;
        });

  
        document.addEventListener('DOMContentLoaded', () => {
            const stars = document.querySelectorAll('.star');
            const ratingInput = document.getElementById('rating-input');
            let currentRating = 0;

            const setRating = (rating) => {
                stars.forEach((star, index) => {
                    if (index < rating) {
                        star.classList.add('text-yellow-500');
                        star.classList.remove('text-gray-400');
                    } else {
                        star.classList.add('text-gray-400');
                        star.classList.remove('text-yellow-500');
                    }
                });
                currentRating = rating;
                ratingInput.value = rating; // Set the hidden input value
            };

            stars.forEach(star => {
                star.addEventListener('click', () => {
                    setRating(star.getAttribute('data-value'));
                });
            });
        });
   

        function success() {
            if (document.getElementById("input-textarea").value === "") { 
                document.getElementById("submit").disabled = true; 
            } else { 
                document.getElementById("submit").disabled = false;
            }
        }
    </script>
</body>
</html>
