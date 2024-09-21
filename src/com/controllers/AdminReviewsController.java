package com.controllers;

import com.beans.Admin;
import com.beans.AdminReviews;
import com.dao.AdminDAO;
import com.dao.AdminReviewsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AdminReviewsController {

    @Autowired
    private AdminReviewsDAO adminReviewsDAO;
    @Autowired
    private AdminDAO admin1DAO;
    @RequestMapping(value = "/adminReviews", method = RequestMethod.GET)
    public String getAllReviews(Model model) {
        List<AdminReviews> reviews = adminReviewsDAO.getAllReviews();
        model.addAttribute("reviews", reviews);
        Admin admin = admin1DAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
        model.addAttribute("admin", admin);
        return "adminReviews";  // View name for reviews page
    }

    
    @RequestMapping(value = "/adminReviews/delete", method = RequestMethod.POST)
    public String deleteReview(@ModelAttribute ("rd") AdminReviews rd,
    		@RequestParam("reviewId") long reviewId, Model model) {
        adminReviewsDAO.deleteReviewById(reviewId);
        model.addAttribute("message", "Review deleted successfully");
        return "redirect:/adminReviews";  // Redirect to the reviews page after deletion
    }
    
    


}
