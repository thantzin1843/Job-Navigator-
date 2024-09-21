package com.controllers;

import com.dao.Profile_CompanyDao;
import com.dao.Profile_JobDao;
import com.dao.JobCategoryDao;
import com.dao.ReviewDAO;
import com.beans.Profile_Company;
import com.beans.Profile_Job;
import com.beans.JobCategory;
import com.beans.SocialMediaAccount;
import com.beans.Review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class CompanyProfileController {

    @Autowired    
    private Profile_CompanyDao profile_companyDao;

    @Autowired
    private Profile_JobDao profile_jobDao;

    @Autowired
    private JobCategoryDao jobCategoryDAO;
    
    @Autowired
    private ReviewDAO reviewDAO;

    @RequestMapping(value = "/companyProfile")
    public String getCompanyProfile(HttpSession session, Model model) {
    	Integer companyId = (Integer) session.getAttribute("company_id");
    	
    	if (companyId == null) {
            // Handle the case where company_id is not set in the session
        	System.out.print("no company id");
            model.addAttribute("error", "Company ID not found in session.");
            return "redirect:/login"; 
        }
    	
        Profile_Company company = profile_companyDao.getCompanyById(companyId);
        
        List<Profile_Job> jobs = profile_jobDao.getJobsByCompanyId(companyId);
        
        int jobCount = profile_companyDao.getJobCountByCompanyId(companyId);
        
        List<JobCategory> jobCategories = jobCategoryDAO.getAllJobCategories();
        
        List<Review> reviews = reviewDAO.getReviewsByCompanyId(companyId);
        
        // Debugging: Print or log the social media accounts
        for (SocialMediaAccount account : company.getSocialMediaAccounts()) {
            System.out.println("Platform: " + account.getPlatform() + ", URL: " + account.getAccountUrl());
        }

        model.addAttribute("company", company);
        model.addAttribute("compImg", company.getCompanyPhoto());
        model.addAttribute("jobs", jobs);
        model.addAttribute("jobCategories", jobCategories);
        model.addAttribute("jobCount", jobCount);
        model.addAttribute("reviews", reviews);
        return "companyProfile"; // Ensure this matches your JSP file name
    }

    @RequestMapping(value = "/companyProfile/{companyId}", method = RequestMethod.GET)
    public String showCompanyProfile(@PathVariable("companyId") int companyId, Model model) {
        Profile_Company company = profile_companyDao.getCompanyById(companyId);
        List<Profile_Job> jobs = profile_jobDao.getJobsByCompanyId(companyId);
        int jobCount = profile_companyDao.getJobCountByCompanyId(companyId);
        List<JobCategory> jobCategories = jobCategoryDAO.getAllJobCategories();

        model.addAttribute("company", company);
        model.addAttribute("jobs", jobs);
        model.addAttribute("jobCategories", jobCategories);
        model.addAttribute("jobCount", jobCount);

        return "companyProfile";
    }
    
    @RequestMapping(value = "/companyProfilejs/{companyId}")
    public String getCompanyProfilejs(@PathVariable("companyId") int companyId, Model model) {
        Profile_Company company = profile_companyDao.getCompanyById(companyId);
        List<Profile_Job> jobs1 = profile_jobDao.getJobsByCompanyId(companyId);
        int jobCount1 = profile_companyDao.getJobCountByCompanyId(companyId);
        List<JobCategory> jobCategories1 = jobCategoryDAO.getAllJobCategories();
        List<Review> reviews = reviewDAO.getReviewsByCompanyId(companyId);

        model.addAttribute("company", company);
        model.addAttribute("jobs1", jobs1);
        model.addAttribute("compImg", company.getCompanyPhoto());
        model.addAttribute("jobCategories1", jobCategories1);
        model.addAttribute("jobCount1", jobCount1);
        model.addAttribute("reviews", reviews);

        return "companyProfilejs"; // Make sure this matches the name of your JSP file
    }

    @RequestMapping(value = "/addreview", method = RequestMethod.POST)
    public String addReview(@RequestParam("company_id") int companyId,
                            @RequestParam("rating") int rating,
                            @RequestParam("review_text") String reviewText, HttpSession session) {
        int jobSeekerId = (Integer) session.getAttribute("jobseeker_id");; // Default value

        // Insert review into the companyreviews table
        reviewDAO.addCompanyReview(companyId, jobSeekerId, rating, reviewText);

        // Redirect to the company profile page after submission
        return "redirect:/companyProfilejs/"+companyId; // Adjust the redirect URL as needed
    }
    @RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
    public String deleteReview(@RequestParam("reviewId") int reviewId, Model model) {
    	 reviewDAO.deleteReview(reviewId);
         return "redirect:/companyProfile";
    }
}
