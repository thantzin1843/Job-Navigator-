package com.controllers;

import com.dao.CompanyDao;
import com.dao.JobSeekerDao;
import com.dao.TestimonialDao;
import com.dao.AdminDDao;
import com.dao.CategoryDao;
import com.dao.UserDao;
import com.model.Category;
import com.model.Company;
import com.model.JobSeeker;
import com.model.Testimonial;
import com.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class SettingController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private JobSeekerDao jobSeekerDao;

	@Autowired
	private CompanyDao companyDao;

	

	@RequestMapping(value = "/companyHome", method = RequestMethod.GET)
	public String companyHome(Model model, HttpSession session) {

	    Integer company_id = (Integer) session.getAttribute("companyId");
	    Integer userid = (Integer) session.getAttribute("userId");

	    if (company_id != null) {					
	        Company company = companyDao.getCompanyByUserId(userid);
	        int points = companyDao.getPointsBalanceByCompanyId(company_id);
	        System.out.println("calling");
	        // Set attributes in the session
	        session.setAttribute("compName", company.getName());
	        session.setAttribute("compImage", company.getImage());
	        session.setAttribute("points", points);
	        
	        return "companyHome";
	    }
	    
	    // Redirect to a different page if company_id is null, e.g., login page
	    return "redirect:/login";
	}


	
}	


