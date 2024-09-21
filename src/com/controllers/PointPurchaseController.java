package com.controllers;

import com.beans.PointPurchase;
import com.dao.PointPurchaseDao;
import com.beans.CompanyPoints;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class PointPurchaseController {

    @Autowired
    private PointPurchaseDao dao;

    @RequestMapping("/point_purchase")
    public String getPointsPackages(HttpSession session, Model model) {
    	
    	Integer companyId = (Integer) session.getAttribute("company_id");

        if (companyId == null) {
            // Handle the case where company_id is not set in the session
        	System.out.print("no company id");
            model.addAttribute("error", "Company ID not found in session.");
            return "error"; 
        }
        session.setAttribute("companyId", companyId);
        List<PointPurchase> pointPackages = dao.getAllPointsPackages();
        List<CompanyPoints> companyPoints = dao.getCompanyPointsByCompanyId(companyId);
        
        model.addAttribute("point_packages", pointPackages);
        model.addAttribute("company_points", companyPoints);
        
        
        return "point_purchase"; 
    }
    
    @RequestMapping(value = "/point_purchase/payment/{packageId}", method = RequestMethod.GET)
    public String getPaymentPage(@PathVariable("packageId") Long packageId, Model model, HttpSession session) {
        
    	PointPurchase packageDetails = dao.getPointPackageById(packageId);
    	System.out.println(packageDetails);
    	
        if (packageDetails == null) {
            return "error"; 
        }

        // Get the companyId from session
        Integer companyId = (Integer) session.getAttribute("companyId");
        System.out.println("Company ID: " + companyId); //check

//        if (companyId == null) {
//            return "error";         }
        session.setAttribute("package_id", packageDetails.getPackageId());
        session.setAttribute("purchasedPoints", packageDetails.getPoints());
        session.setAttribute("purchasedCost", packageDetails.getCost());
        session.setAttribute("companyId", companyId);
        
        model.addAttribute("choosePackage", packageDetails);
        model.addAttribute("companyId", companyId);

        return "payment";
    }

}
