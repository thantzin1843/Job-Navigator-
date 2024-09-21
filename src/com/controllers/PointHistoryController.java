package com.controllers;

import com.beans.PointHistory;
import com.dao.PointHistoryDao;
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
public class PointHistoryController {

    @Autowired
    private PointPurchaseDao pPurchase;
    
    @Autowired
    private PointHistoryDao pHistoryDao;

    @RequestMapping("/point_history")
    public String getPointsPackages(HttpSession session, Model model) {
    	
    	Integer companyId = (Integer) session.getAttribute("company_id");

        if (companyId == null) {
            // Handle the case where company_id is not set in the session
        	System.out.print("no company id");
            model.addAttribute("error", "Company ID not found in session.");
            return "error"; 
        }
        
        List<PointHistory> transactions = pHistoryDao.getAllHistoryByCompanyId(companyId);
        model.addAttribute("phistory", transactions);
        List<CompanyPoints> companyPoints = pPurchase.getCompanyPointsByCompanyId(companyId);
        
        for (PointHistory transaction : transactions) {
            if ("purchase".equals(transaction.getTransactionType())) {
               
                String paymentStatus = pHistoryDao.PaymentStatus( transaction.getTransactionId() );  
                transaction.setPaymentStatus(paymentStatus); 
               
            }
        }
        //model.addAttribute("point_packages", pointPackages);
        model.addAttribute("company_points", companyPoints);
        
        
        return "point_history"; 
    }
    
    
    
   

}
