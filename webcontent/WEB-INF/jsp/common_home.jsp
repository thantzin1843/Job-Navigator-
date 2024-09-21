<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:wght@200;300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header class="header custom-navbar" id="header">
        <nav class="nav container">
            <a href="#" class="nav-logo">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" width="150" height="auto">
            </a>

            <div class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Home</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/alljobs" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Find Jobs</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/search_company" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Find Companies</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/Final_JN/companyProfile" class="nav-link">
                            <i class="ri-arrow-right-up-line"></i>
                            <span>Post Job</span>
                        </a>
                    </li>
                    <li class="nav-item d-flex">
                        <a class="btn btn custom-btn" href="login">Login</a>
                        <a class="btn btn-light transparent border custom-btn reg" href="signup">Sign Up</a>
                    </li>
                </ul>
                <div class="nav-close" id="nav-close">
                    <i class="ri-close-line"></i>
                </div>
            </div>
            <div class="nav-toggle" id="nav-toggle">
                <i class="ri-menu-line"></i>
            </div>
        </nav>
    </header>
    	
    
    
    
    