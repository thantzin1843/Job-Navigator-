package com.controllers;

import com.dao.PaymentDao;
import com.dao.PointHistoryDao;
import com.beans.FileUploadForm;
import com.beans.Payment;
import com.beans.PointHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Controller

public class PaymentController {

    @Autowired
    private PaymentDao paymentDAO;

    @Autowired
    private PointHistoryDao pointsTransactionHistoryDAO;

    private final String uploadDir = "D:\\Servelt\\Final_JN\\webcontent\\resources\\upload_img\\";
    

    @RequestMapping("/payment_save")
    public String viewAllPaymentsS(Model model) {
    	model.addAttribute("Payment", new Payment());
    	System.out.println("work");
    	return "payment";  
    }
    
    
    @RequestMapping(value = "/point_purchase/payment/payment_save", method = RequestMethod.POST)
    public String handlePaymentForm(@ModelAttribute("Payment") Payment Payment, 
    								@RequestParam("file") MultipartFile file,
                                    HttpSession session, 
                                    Model model) {
        String hiddenPayment = Payment.getHiddenPayment();
        System.out.println("Processing payment form for: " + hiddenPayment);

        
        // hiddenPayment is not null or empty
        if (hiddenPayment == null || hiddenPayment.trim().isEmpty()) {
            model.addAttribute("message", "Hidden payment field is missing.");
            return "error"; 
        }
        
        
        
        // Redirect to the appropriate method based on hiddenPayment value
        if ("kpayForm".equals(hiddenPayment)) {
            model.addAttribute("Payment", new Payment());
            return processPaymentFile(file, session, model, "KPay");
        } else if ("ayaForm".equals(hiddenPayment)) {
            model.addAttribute("Payment", new Payment());
            return processPaymentFile(file, session, model, "AYA");
        } else if ("waveForm".equals(hiddenPayment)) {
            model.addAttribute("Payment", new Payment());
            return processPaymentFile(file, session, model, "Wave");
        } else {
            model.addAttribute("message", "Invalid payment form type.");
            return "payment"; // Adjust as necessary
        }
    }

    
    @RequestMapping("/payment_kpay")
    public String viewAllPaymentsK(Model model) {
    	model.addAttribute("Payment", new Payment());
    	System.out.println("work");
    	return "payment/payment_kpay";  
    }
    
    @RequestMapping("/payment_aya")
    public String viewAllPaymentsA(Model model) {
    	model.addAttribute("Payment", new Payment());
    	System.out.println("work");
    	return "payment/payment_aya";  
    }
    
    @RequestMapping("/payment_wave")
    public String viewAllPaymentsW(Model model) {
    	model.addAttribute("Payment", new Payment());
    	System.out.println("work");
    	return "payment/payment_wave";  
    }

   

    // Common method to process payment files
    private String processPaymentFile(MultipartFile file, HttpSession session, Model model, String paymentMethod) {
        System.out.println("Received POST request for " + paymentMethod + " payment save");
        if (file != null && !file.isEmpty()) {
            try {
            	
            	//String uploadDir = session.getServletContext().getRealPath("/resources/upload_img/");
            	Path uploadPath = Paths.get(uploadDir);
            	if (!Files.exists(uploadPath)) {
            	    Files.createDirectories(uploadPath);
            	}
            	

                // Generate a unique file name
                String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                Path filePath = uploadPath.resolve(fileName);
                
               // Validate session attributes
                Integer companyId = (Integer) session.getAttribute("companyId");
                Integer packageId = (Integer) session.getAttribute("package_id");
                Integer purchasedPoints = (Integer) session.getAttribute("purchasedPoints");

                
                if (companyId == null || packageId == null || purchasedPoints == null) {
                    System.out.println("Missing session attributes");
                    model.addAttribute("error", "Session attributes are missing. Please try again.");
                    return "payment";
                }

                // Save the file to the server
                Files.write(filePath, file.getBytes());
                
                // Save the uploaded file to the target location
                //Files.copy(file.getInputStream(), filePath);

                // Create and save a record in PointsTransactionHistory
                PointHistory transaction = new PointHistory();
                transaction.setTransactionType("purchase");  
                transaction.setPackageId(packageId); 
                transaction.setPointsAmount(purchasedPoints); 
                transaction.setTransactionDate(new java.sql.Timestamp(System.currentTimeMillis()));
                transaction.setCompanyId(companyId);
                
                // Save transaction and get the generated transaction ID
                long transactionId = pointsTransactionHistoryDAO.addTransaction(transaction);
                transaction.setTransactionId(transactionId);

                // Create and save a record in Payment
                Payment payment = new Payment();
                payment.setTransactionId(transactionId);
                payment.setPaymentScreenshot(fileName);
                payment.setCompanyId(companyId);
                payment.setPaymentMethod(paymentMethod);  
                paymentDAO.savePayment(payment);

                //model.addAttribute("message", "File uploaded successfully and records saved for " + paymentMethod + ".");
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("Error occurred: img: " + e.getMessage());
            }
        } else {
            System.out.println("No file selected for " + paymentMethod);
        }

        return "redirect:/"; 
    }
}
