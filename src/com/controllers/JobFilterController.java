package com.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beans.JobFilter;
import com.beans.Job;
import com.dao.JobFilterDao;
import com.dao.JobDao;

@Controller
public class JobFilterController {

    @Autowired
    private JobFilterDao jobFilterDao;
    
    @Autowired
    private JobDao jobDao;

    // Show the filter form
    @RequestMapping(value = "/filter", method = RequestMethod.GET)
    public String showFilterForm(Model model) {
        model.addAttribute("jobFilter", new JobFilter());
        return "filter";
    }

    // Handle filter form submission
    @RequestMapping(value = "/showfilter", method = RequestMethod.POST)
    public String showFilteredJobs(@ModelAttribute("jobFilter") JobFilter jobFilter, Model model, HttpSession session) {
        // Fetch the filtered jobs
        List<JobFilter> filteredJobs = jobFilterDao.getFilteredJobs(jobFilter);
        System.out.println("Filtered jobs count: " + filteredJobs.size());
        
        List<String> compLocation=jobDao.getDistinctLocations();
        

        // Print debug information
        System.out.println("Category: " + jobFilter.getCategoryName());
        System.out.println("Company: " + jobFilter.getCompanyName());
        System.out.println("Location: " + jobFilter.getLocation());
        System.out.println("Job Types: " + Arrays.toString(jobFilter.getJobTypes()));
        System.out.println("Work Types: " + Arrays.toString(jobFilter.getWorkTypes()));
        System.out.println("Min Salary: " + jobFilter.getMinSalary());       
        System.out.println("Salary: " + jobFilter.getSalary());

        // Add attributes to the model
        model.addAttribute("filteredJobs", filteredJobs);
        model.addAttribute("compLocation", compLocation);
       
        // Return the view name
        return "filter";
    }

    
  
}
