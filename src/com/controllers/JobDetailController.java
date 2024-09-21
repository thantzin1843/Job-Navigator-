package com.controllers;

import com.beans.Job;
import com.beans.JobDetail;
import com.beans.JobFilter;
import com.dao.JobDetailDao;
import com.dao.JobDao;
import com.dao.ApplicationDao;
import com.beans.Application;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class JobDetailController {

    @Autowired
    private JobDetailDao dao;
    @Autowired
    private JobDao jobDao;

    
    @RequestMapping(value = "/jobdetail/{jobId}", method =  RequestMethod.GET)
    public String showJobDetail(@PathVariable("jobId") int jobId, Model model) {
        JobDetail jobDetail = dao.getJobDetail(jobId);
        model.addAttribute("jobDetail", jobDetail);
                
        
        return "job_detail"; 
    }
    
    @RequestMapping("/jobdetail")
    public String getJobDetails(@RequestParam("jobId") int jobId, Model model) {
        JobDetail jobDetail = dao.getJobDetail(jobId); 
        model.addAttribute("jobDetail", jobDetail);
        
        return "job_detail"; 
    }


   
    
}
