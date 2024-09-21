package com.controllers;

import com.dao.AdminDAO;
import com.dao.AdminDDao;
import com.beans.Admin;
import com.beans.AdminDashboard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

//import java.util.HashMap;
//import java.util.Map;

@Controller
public class AdminController {
	
	@Autowired
    private AdminDDao adminDDao;
	@Autowired
    private AdminDAO admin1DAO;
	 @RequestMapping("/admin_dashboard")
	    public String viewAllPaymentsS(Model model) {
	    	
	    	
	    	int userCount = adminDDao.getUserCount();
	        model.addAttribute("userCount", userCount);
	        
	        int JSCount = adminDDao.getJSCount();
	        model.addAttribute("JSCount", JSCount);
	        
	        int CompanyCount = adminDDao.getCompanyCount();
	        model.addAttribute("companyCount", CompanyCount);
	        
	        int JobsCount = adminDDao.getJobsCount();
	        model.addAttribute("JobsCount", JobsCount);
	        
	        double jobSeekerPercentage = 0;
	        double companyPercentage = 0;

	        if (userCount > 0) {
	            jobSeekerPercentage = (double) JSCount / userCount * 100;
	            companyPercentage = (double) CompanyCount / userCount * 100;
	        }
	        
	        
	        model.addAttribute("jobSeekerPercentage", jobSeekerPercentage);
	        model.addAttribute("companyPercentage", companyPercentage);
	        System.out.println(jobSeekerPercentage);
	        System.out.println(companyPercentage);
	        
	        int WReviewCount = adminDDao.getWebsiteReviewCount();
	        model.addAttribute("WReviewCount", WReviewCount);
	        
	        double averageRating = adminDDao.calculateAverageRating();
	        model.addAttribute("averageRating", averageRating);
	        
	        int pointsPackage = adminDDao.getPackagePoints();
	        model.addAttribute("pointsPackage", pointsPackage);
	        
	        int paymentCount = adminDDao.getPayment();
	        model.addAttribute("paymentCount", paymentCount);
	        
	        int PendingCount = adminDDao.getPending();
	        model.addAttribute("PendingCount", PendingCount);
	        
	        int ApproveCount = adminDDao.getApprove();
	        model.addAttribute("ApproveCount", ApproveCount);
	        
	        int CancelCount = adminDDao.getCancelled();
	        model.addAttribute("CancelCount", CancelCount);
	        
	        Admin admin = admin1DAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
	        model.addAttribute("admin", admin);
	    	return "admin_dashboard";  
	    }
	 
	   

}
