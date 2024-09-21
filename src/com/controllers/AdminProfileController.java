package com.controllers;

import com.beans.Admin;
import com.dao.AdminDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
public class AdminProfileController {

    @Autowired
    private AdminDAO adminDAO;
    
    // Password encoder for hashing passwords
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @RequestMapping(value = "/adminprofile")
    public String getAdminProfile(Model model) {
        Admin admin = adminDAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
        model.addAttribute("admin", admin);
        return "adminprofile";
    }

    @RequestMapping(value = "/updateAdminProfile", method = RequestMethod.POST)
    public String updateAdminProfile(
            @RequestParam("firstName") String firstName,
            @RequestParam("email") String email,
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword,
            RedirectAttributes redirectAttrs) {

        // Fetch the existing admin data
        Admin admin = adminDAO.getAdminByDefaultId();

        // Update the admin details
        admin.setFirstName(firstName);
        admin.setEmail(email);

        // Update password if provided
        if (!newPassword.isEmpty()) {
            // Check if the current password matches
            if (passwordEncoder.matches(currentPassword, admin.getPassword())) {
                // Hash the new password before updating
                String hashedPassword = passwordEncoder.encode(newPassword);
                admin.setPassword(hashedPassword);
            } else {
                // Add error message to flash attributes and redirect
                redirectAttrs.addFlashAttribute("currentPasswordError", "Current password is incorrect.");
                return "redirect:/adminprofile"; // Redirect to the profile page
            }
        }

        // Update the admin in the database (including the hashed password)
        adminDAO.updateAdmin(admin);

        // Redirect to profile page with success message
        redirectAttrs.addFlashAttribute("successMessage", "Profile updated successfully!");
        return "redirect:/adminprofile"; // Redirect to the profile page
    }

    @RequestMapping(value = "/adminprofile/uploadPhoto", method = RequestMethod.POST)
    public String uploadPhoto(@ModelAttribute("admin") Admin admin,
                              @RequestParam("file") MultipartFile file,
                              @RequestParam("adminId") Integer adminId,
                              Model model) {

        String defaultPhotoPath = "default_profile.jpg"; // Path to the default photo

        if (!file.isEmpty()) {
            try {
                // Save the file to the desired location
                String uploadDir = "E:\\Java_Servlet\\job_navigator\\webcontent\\resources\\Upload_image\\"; // Set your upload directory path
                String fileName = adminId + "_" + file.getOriginalFilename(); // Use adminId to ensure uniqueness
                File uploadFile = new File(uploadDir + fileName);
                file.transferTo(uploadFile);

                // Update the admin_photo in the database with the uploaded file's name
                admin.setAdminPhoto(fileName);
                adminDAO.updateAdminPhoto(adminId, fileName);

                Admin updatedProfile = adminDAO.getAdminById(adminId);
                model.addAttribute("admin", updatedProfile);
                model.addAttribute("successMessage", "Photo uploaded successfully!");

            } catch (IOException e) {
                model.addAttribute("errorMessage", "Photo upload failed: " + e.getMessage());
            }
        } else {
            // No file selected, set the default photo
            admin.setAdminPhoto(defaultPhotoPath);
            adminDAO.updateAdminPhoto(adminId, defaultPhotoPath);

            Admin updatedProfile = adminDAO.getAdminById(adminId);
            model.addAttribute("admin", updatedProfile);
            model.addAttribute("errorMessage", "No photo selected. Default photo applied.");
        }

        return "adminprofile"; // Return to the profile page with the updated data
    }

    @RequestMapping(value = "/adminprofile/deletePhoto", method = RequestMethod.POST)
    public String deletePhoto(@ModelAttribute("admin") Admin admin,
                              @RequestParam("adminId") Integer adminId,
                              Model model) {

        adminDAO.deleteAdminPhoto(adminId);
        Admin updatedProfile = adminDAO.getAdminById(adminId);
        model.addAttribute("admin", updatedProfile);
        model.addAttribute("successMessage", "Photo deleted successfully!");

        return "adminprofile";
    }
}
