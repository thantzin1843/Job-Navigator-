package com.controllers;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OtherController {
	private JdbcTemplate jdbcTemplate;
    
    // Setter for JdbcTemplate
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Mapping for the 'terms' URL
    @RequestMapping("/term")
    public String showTermsPage(Model model) {
        // Return the view name of the Terms and Conditions page (terms.jsp)
        return "term";
    }
    
    @RequestMapping("/privacypolicy")
    public String showPrivacy(Model model) {
        // Return the view name of the Terms and Conditions page (terms.jsp)
        return "privacypolicy";
    }
}
