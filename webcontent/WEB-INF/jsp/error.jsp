<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" %>

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
    
      </style>
      <link href="./payment1.css" rel="stylesheet"/>
      <!--cabin font-->
      <link href='https://fonts.googleapis.com/css?family=Cabin' rel='stylesheet'>
      <!--icons-->      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
     
      <style>
        .titile_top{ color:7905EE;}
      </style>
   
   
</head>
<body class="font-cabin"> 
    <div class="container max-w-screen-xl mx-auto bg-">
        <div id="alertBox" class="fixed inset-0 flex justify-center items-center bg-[#E6E6FA]">
            <div class="glass-effect p-6 rounded-xl shadow-lg max-w-sm w-full text-center">
                <h2 class="text-xl font-bold text-black">🚫 Oops! Page Not Found</h2>
                <img src="proj pic/error.png" alt="Error Image" class="my-4 w-32 h-32 mx-auto">
                <p class="text-black mt-4">
                    We could not find the page you were looking for.
                </p>
                
                <button onclick="window.history.back();" class="px-4 py-2 mt-3  bg-[#7905EE] text-white rounded-lg">Go Back</button>
                
            </div>
        </div>
        
   
        
    </div>
        
    

</body>
</html>