package com.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.beans.Admin;
import com.beans.AdminPayment;
import com.dao.AdminDAO;
import com.dao.AdminPaymentDAO;


@Controller

public class AdminPaymentController {
	
	@Autowired
    private AdminPaymentDAO adminPaymentDAO;
	@Autowired
    private AdminDAO admin1DAO;
	@RequestMapping(value ="/adminPayment")
    public String getPaymentInfo( Model model) {
		 List<AdminPayment> payments = adminPaymentDAO.getPaymentDetails();
	        model.addAttribute("payments", payments);
	        Admin admin = admin1DAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
	        model.addAttribute("admin", admin);
	        return "adminPayment";// Return to the appropriate JSP view
    }
	@RequestMapping(value ="/approvePayment", method = RequestMethod.POST)
	public String approvePayment(@RequestParam("paymentId") int paymentId,
			@RequestParam("companyId") int companyId,
    		@RequestParam("pointAmount") int pointAmount) {
        adminPaymentDAO.approvePayment(paymentId);
        int compPoint = adminPaymentDAO.getCompPoint(companyId);       
        adminPaymentDAO.addPoint(companyId,pointAmount);
        return "redirect:/adminPayment";
 
	}
	@RequestMapping(value ="/cancelPayment", method = RequestMethod.POST)
	public String cancelPayment(@RequestParam("paymentId") int paymentId) {
        adminPaymentDAO.cancelPayment(paymentId);
        return "redirect:/adminPayment";
    }

	@RequestMapping(value ="/adminPayment", method = RequestMethod.POST)
    public String viewPaymentScreenshot(@RequestParam("paymentId") int paymentId,Model model) {
        // Fetch the screenshot URL from the DAO
		List<AdminPayment> payments = adminPaymentDAO.getPaymentDetails();
        model.addAttribute("payments", payments);
        String screenshotUrl = adminPaymentDAO.getPaymentScreenshotById(paymentId);
        System.out.println(screenshotUrl);

        if (screenshotUrl != null) {
            // Add the screenshot URL to the model to be used in the view
            model.addAttribute("screenshotUrl", screenshotUrl);
        } else {
            // Handle cases where no screenshot is found
            model.addAttribute("errorMessage", "Screenshot not available for this payment.");
        }

        // Return the name of the view where you want to display the screenshot (e.g., "paymentDetails.jsp")
        return "adminPayment"; // Replace with the appropriate JSP page
    }
	@RequestMapping(value = "/deletePayment", method = RequestMethod.POST)
    public String deletePayment(@RequestParam("paymentId") int paymentId) {
        adminPaymentDAO.deletePayment(paymentId);
        return "redirect:/adminPayment"; // Redirect back to the payment list page after deletion
    }
}
