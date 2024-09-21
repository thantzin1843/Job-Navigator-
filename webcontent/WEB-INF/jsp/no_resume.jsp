<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.lang.Integer" %>
<%
    // Retrieve the session attribute
    Integer jobSeekerId = (Integer) session.getAttribute("jobseeker_id");

    if (jobSeekerId != null) {
       
    	session.setAttribute("jobSeekerId", jobSeekerId);
       
    } else {
       
    	response.sendRedirect("login");
    }
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
    
      
      <link href="./payment1.css" rel="stylesheet"/>
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
      <style>
       .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
          }
      </style>
   
   
</head>
<body class="font-cabin"> 
    <div class="container max-w-screen-xl mx-auto ">
      
        <div id="alertBox" class="fixed inset-0 flex justify-center items-center bg-[#E6E6FA]">
            <div class="glass-effect p-6 rounded-xl shadow-lg max-w-sm w-full text-center">
                <h2 class="text-xl font-bold text-black">🚨 Resume/CV Required! 🚨</h2>
                <p class="text-black mt-4">
                    It looks like your resume or CV is not updated in your profile. Please upload your resume or CV to complete your application process.
                    <br><br>
                    Thank you!
                </p>
                <form:form method="POST" action="/Final_JN/jobdetail/application/uploadResume" enctype="multipart/form-data" modelAttribute="fileUploadForm" class="mt-4" >
                   <input name="resumeFile" type="file" accept=".pdf" class="mb-4" />
                    <div class="button-group flex justify-between">
                        <button type="submit" onclick="submitResume()" class="px-4 py-2 bg-[#7905EE] text-white rounded-lg">Upload and OK</button>
                        <button type="button" onclick="window.history.back();" class="px-4 py-2 bg-gray-300 text-black rounded-lg">Cancel</button>
                    </div>
                </form:form>
            </div>
        </div>
        
        
    </div>
        
    <script type="text/javascript">
       
function submitResume() {
    const fileInput = document.getElementById('resumeFile');
    const file = fileInput.files[0];

    if (!file) {
        alert('Please select a file to upload.');
        
    }

 /*  
    const formData = new FormData();
    formData.append('resumeFile', file);

    
    fetch('uploadResumeUrl', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert('Resume uploaded successfully!');
            hideAlert();
            // Optionally redirect or update the page
        } else {
            alert('Error uploading resume. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });  */
}

    </script>

</body>
</html>