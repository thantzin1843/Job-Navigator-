package com.controllers;

import com.beans.WebReview;
import com.dao.WebReviewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class WebReviewController {

    @Autowired
    private WebReviewDAO webReviewDAO;

    @RequestMapping(value = "/websiteReview")
    public String getReview() {
        return "websiteReview";
    }

    @RequestMapping(value = "/submitReview", method = RequestMethod.POST)
    public ModelAndView submitReview(HttpServletRequest request,
                                     @RequestParam(value = "jobSeekerId", required = false) Integer jobSeekerId,
                                     @RequestParam(value = "companyId", required = false) Integer companyId,
                                     @RequestParam("rating") Integer rating,
                                     @RequestParam("reviewText") String reviewText, Model model, RedirectAttributes redirectAttrs) {

        WebReview review = new WebReview();
        String reviewerRole;

        if (jobSeekerId != null) {
            reviewerRole = "JobSeeker";
            review.setJobSeekerId(jobSeekerId);
        } else if (companyId != null) {
            reviewerRole = "Company";
            review.setCompanyId(companyId);
        } else {
        	 redirectAttrs.addFlashAttribute("error", "ither jobSeekerId or companyId must be provided.");
            throw new IllegalArgumentException("Either jobSeekerId or companyId must be provided");
           
        }

        review.setReviewerRole(reviewerRole);
        review.setRating(rating);
        review.setReviewText(reviewText);
        review.setReviewDate(new Timestamp(System.currentTimeMillis()));

        webReviewDAO.addReview(review);
        redirectAttrs.addFlashAttribute("success", "Thank you for your feedback! 🎉 Your review has been successfully noted.");
       
        return new ModelAndView("redirect:/websiteReview");
    }
}
