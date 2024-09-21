package com.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.beans.Job;
import com.beans.Company;
import com.beans.JobFilter;
import com.dao.JobDao;

@Controller
public class JobController {

    @Autowired
    private JobDao jobDao;

    // Show all jobs
    @RequestMapping(value = "/alljobs", method = RequestMethod.GET)
    public String getAllJobs(Model model) {
       
        List<Job> allJobs = jobDao.getAllJobs();
        System.out.println("Total jobs count: " + allJobs.size());
        
        List<String> compLocation=jobDao.getDistinctLocations();
        
        model.addAttribute("jobFilter", new JobFilter());
       
        model.addAttribute("filteredJobs", allJobs);
        model.addAttribute("compLocation", compLocation);
        
        return "filter";
    }
    
    //for company search
    @RequestMapping(value = "/search_company", method = RequestMethod.GET)
    public String getAllCompany(Model model) {
    	List<Company> allcompany = jobDao.getAllCompanies();   	  
        model.addAttribute("allCompany", allcompany);
        model.addAttribute("company", new Company()); 
        return "search_company";
    }
    
    @RequestMapping("/searchComp")
    public String showSearchForm(Model model) {
            model.addAttribute("company", new Company()); 
            return "search_company"; 
    }
    
    
    @RequestMapping(value = "/searchComp", method = RequestMethod.POST)
    public String searchCompanies(@ModelAttribute("company") Company comp, Model model) {
    	model.addAttribute("company", new Company()); 
        String companyName = comp.getCompanyName();
        List<Company> companies;
        
        if (companyName == null || companyName.trim().isEmpty()) {
            companies = jobDao.getAllCompanies();  // Get all companies if no search input is provided
        } else {
            companies = jobDao.getCompaniesByName(companyName);  // Search by company name
        }
        
        model.addAttribute("allCompany", companies);
        model.addAttribute("company", new Company());
        return "search_company"; 
    }
}
