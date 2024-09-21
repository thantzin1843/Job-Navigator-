<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>

<%@ page import="java.lang.Integer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .custom-bg{
            background-color: #C1C1EB;
        }
        .custom-bg1
        {
            background-color: #7905EE;
        }
    </style>
</head>
<body>
    <div class="container mx-auto px-4 py-8">
        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex justify-between items-center mb-4 border-b border-gray-200">
                <h2 class="text-2xl font-bold">Job Applications</h2>
               
            </div>
            <div class="flex justify-between mb-3">
            	<a href="${pageContext.request.contextPath}/approve/application/page">Pending Applications</a>
            	<a href="${pageContext.request.contextPath}/accepted/application/page" class=" bg-purple-100 p-2 rounded-md shadow-md">Accepted Applications</a>
            	<a href="${pageContext.request.contextPath}/rejected/application/page">Rejected Applications</a>
            </div>
           
            <div class="grid grid-cols-1 gap-4">
            <c:forEach var="application" items="${applications}">
                 <div class="custom-bg rounded-lg p-4 border border-purple-900">
                    <div class="flex justify-between items-center mb-2">
                        <div class="flex items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" viewBox="0 0 576 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l448 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zm80 256l64 0c44.2 0 80 35.8 80 80c0 8.8-7.2 16-16 16L80 384c-8.8 0-16-7.2-16-16c0-44.2 35.8-80 80-80zm-32-96a64 64 0 1 1 128 0 64 64 0 1 1 -128 0zm256-32l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/></svg>
                            
                            <span class="ml-2 text-xs">An application for the ${application.jobTitle} position received from ${application.username} was accepted. Please review the application details.</span>
                        </div>
                        <div class="flex space-x-2">
                          <!--    <a href="${pageContext.request.contextPath}/application/reject/${application.applicationId}"  class="bg-gray-300 hover:bg-gray-400 py-2 px-4 rounded-md text-xs">Decline${application.applicationId}</a>
                            <a href="${pageContext.request.contextPath}/application/approve/${application.applicationId}" class="custom-bg1 hover:bg-blue-700  py-2 px-4 rounded-md text-xs text-white">Approve</a>-->
                        </div>
                    </div>
                    <div class="ml-5">
                    <ul class="list-disc pl-2 ml-5">
                        <li><a href="${pageContext.request.contextPath}/job_seeker/profile/${application.userId}" class="text-xs ml-2 underline" style="color: blue;">View Profile</a></li>

                        <li><a href="${pageContext.request.contextPath}/preview?filename=${application.cv}" class="text-xs ml-2 underline" style="color: blue;">Download CV/Resume</a></li>
                    </ul>
                    </div>

                </div>
            </c:forEach>
              
              
               
            </div>
        </div>
    </div>
</body>
</html>
