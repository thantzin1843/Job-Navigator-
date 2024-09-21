
package com.controllers;

import com.beans.Admin;
import com.beans.Adminaccounts;
import com.dao.AdminDAO;
import com.dao.AdminaccountDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class AdminAccountController {

    @Autowired
    private AdminaccountDAO adminDAO;
    @Autowired
    private AdminDAO admin1DAO;
    
    @RequestMapping("/adminaccounts")
    public String getAdminAccounts(Model model) {
    	System.out.print("work");       
    	List<Adminaccounts> accounts = adminDAO.getAllAdminAccounts();
        model.addAttribute("accounts", accounts);
        Admin admin = admin1DAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
        model.addAttribute("admin", admin);
        return "adminaccounts"; // Return to the appropriate JSP view
    }
}    
