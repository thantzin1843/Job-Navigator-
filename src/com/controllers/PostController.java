package com.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.beans.Post;
import com.dao.Profile_CompanyDao;
import com.dao.CompanyDao;
import com.dao.PostDAO;

@Controller
public class PostController {

    @Autowired
    private PostDAO postDao;
    @Autowired
	private Profile_CompanyDao profile_companyDao;
    @Autowired
	private CompanyDao companyDao;

    @RequestMapping(value = "/post/{companyId}", method = RequestMethod.GET)
    public String showPostForm(@PathVariable("companyId") int companyId, Model model) {
        Post post = new Post();
        post.setCompanyId(companyId);
        model.addAttribute("post", post);
        model.addAttribute("companyId", companyId);
        return "post";
    }

    @RequestMapping(value = "/savePost", method = RequestMethod.POST)
    public String savePost(@ModelAttribute("post") Post post, Model model) {
        System.out.println("Company ID: " + post.getCompanyId());
        
        int pointsBalance = postDao.getCompanyPointsBalance(post.getCompanyId());

        // Subtract 10 points
        
        if (pointsBalance >= 10) {
        	int jobId = postDao.saveJob(post);

        	int updatedPointsBalance = pointsBalance - 10;
            // Process skills and save them
            postDao.processSkills(post, jobId);
            postDao.processEducationRequirement(post, jobId);
            postDao.updateCompanyPointsBalance(post.getCompanyId(), updatedPointsBalance);

            // Insert transaction into PointsTransactionHistory
            postDao.insertPointsTransaction(post.getCompanyId(), null, "used", 10);
            List <String> skillsbyJob =postDao.getSkillsByJobId(jobId);
            List <String> educationbyJob =postDao.getEducationLevelsByJobId(jobId);
            model.addAttribute("skillsbyJob",skillsbyJob);
            model.addAttribute("educationbyJob",educationbyJob);
        }
        else {
        	// model.addAttribute("errorMessage", "Job post not found.");
             return "post_notconfirm";
        	
        }
        
        
        //model.addAttribute("successMessage", "Job post saved successfully!");
        return "postconfirm";
    }

    @RequestMapping(value = "/Editpost/{jobId}", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("jobId") int jobId, Model model, HttpSession session) {
    	
    		 
    		 Post post = postDao.getPostById(jobId);
    	        List <String> skillsbyJob =postDao.getSkillsByJobId(jobId);
    	        List <String> educationbyJob =postDao.getEducationLevelsByJobId(jobId);
    	        System.out.println("Education:" + post.getEducationLevel());
    	        System.out.println("Job ID: " + post.getJobId());
    	        System.out.println("Work setting: " + post.getWorkSetting());
    	        System.out.println("Skills: " + post.getSkills());
    	        model.addAttribute("post", post);
    	        model.addAttribute("skillsbyJob",skillsbyJob);
    	        model.addAttribute("educationbyJob", educationbyJob.isEmpty() ? null : educationbyJob.get(0));
    	
        return "Editpost"; // JSP page for editing the job post
    }

    @RequestMapping(value = "/updatePost", method = RequestMethod.POST)
    public String updatePost(@ModelAttribute("post") Post post, Model model,  HttpSession session) {
    	int companyId= (Integer) session.getAttribute("company_id");
   	 int pointsBalance = postDao.getCompanyPointsBalance(companyId);
   	 
   	if (pointsBalance >= 5) {
   		
   		int updatedPointsBalance = pointsBalance - 5;
   		
   		 postDao.updateCompanyPointsBalance(companyId, updatedPointsBalance);
   		 postDao.insertPointsTransaction(companyId, null, "used", 5);
        postDao.updateJob(post);
        List <String> skillsbyJob =postDao.getSkillsByJobId(post.getJobId());
        List <String> educationbyJob =postDao.getEducationLevelsByJobId(post.getJobId());
        // Process skills and education requirements similar to savePost

        model.addAttribute("skillsbyJob",skillsbyJob);
        model.addAttribute("educationbyJob",educationbyJob);
        model.addAttribute("successMessage", "Job post updated successfully!");
	   	} else {
	    	// model.addAttribute("errorMessage", "Job post not found.");
	        return "post_notconfirm";
	   	
	   }
		int points = companyDao.getPointsBalanceByCompanyId(companyId);
		session.setAttribute("points", points);
        return "redirect:companyProfile";
    }
    
    @RequestMapping(value = "/deletePost", method = RequestMethod.POST)
    public String deletePost(@RequestParam("jobId") int jobId, Model model) {
        // Retrieve companyId associated with the jobId
        Integer companyId = postDao.getCompanyIdByJobId(jobId);
        
        if (companyId != null) {
            // Delete the job post
            postDao.deleteJob(jobId);
            
            // Redirect to the company profile page with the remaining job posts
            return "redirect:/companyProfile";
        } else {
            // Handle the case where the jobId is not found
            model.addAttribute("errorMessage", "Job post not found.");
            return "errorPage"; // Redirect to an error page or another appropriate view
        }
    }
    
    @RequestMapping(value = "/post_confirm", method = RequestMethod.GET)
    public String confirm_Post(HttpSession session, Model model) {
    	Integer companyId = (Integer) session.getAttribute("company_id");
    	int points = companyDao.getPointsBalanceByCompanyId(companyId);
    	session.setAttribute("points", points);
        return "redirect:/";
    }


}
