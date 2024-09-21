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
    
<% 
    if (session.getAttribute("company_id") != null) { 
%>
    <%@ include file="companyHome.jsp" %>
    <%@ include file="home_under.jsp" %>
<% 
    } else if (session.getAttribute("jobseeker_id") != null) { 
%>
    <%@ include file="jsHome.jsp" %>
    <%@ include file="home_under.jsp" %>
<% 
    } else { 
%>
   <%@ include file="common_home.jsp" %>
   <%@ include file="home_under.jsp" %>
<% 
    } 
%>

    	
  
