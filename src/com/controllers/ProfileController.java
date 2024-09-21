package com.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.validation.Valid;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import com.beans.Post;
import com.beans.Profile;
import com.beans.SocialMediaAccount;
import com.dao.Profile_CompanyDao;
import com.dao.ProfileDAO;

@Controller
public class ProfileController {

	@Autowired
	private ProfileDAO profileDao;

	@Autowired
	private Profile_CompanyDao profile_companyDao;

	// Display the profile form
	@RequestMapping(value = "/profile/{companyId}", method = RequestMethod.GET)
	public String showPostForm(@PathVariable("companyId") int companyId, Model model, HttpSession session) {
		Profile profile = profileDao.getCompanyProfileById(companyId);
		if (profile == null) {

			profile = new Profile();
			profile.setCompanyId(companyId);
		}

		List<SocialMediaAccount> socialMedia = profile_companyDao.getSocialMediaAccountsByCompanyId(companyId);

		session.setAttribute("companyId", companyId);

		// Add attributes to model
		model.addAttribute("profile", profile);
		model.addAttribute("compBenefit", profile.getBenefits());
		model.addAttribute("socialMedia", socialMedia);

		return "profile";
	}

	// Handle form submission
	@RequestMapping(value = "/saveProfile", method = RequestMethod.POST)
	public String saveProfile(@ModelAttribute("profile") Profile profile, Model model, HttpSession session) {
		System.out.println("Company ID: " + profile.getCompanyId());
		int compId= profile.getCompanyId();
		
		
		profileDao.saveCompany(profile);

		// Save social media data to SocialMediaAccounts table
		profileDao.saveSocialMediaAccount(profile);
		Profile updatedProfile = profileDao.getCompanyProfileById(profile.getCompanyId());
		List<SocialMediaAccount> socialMedia  = profile_companyDao.getSocialMediaAccountsByCompanyId(profile.getCompanyId());
		session.setAttribute("compName", updatedProfile.getName());
	       
        model.addAttribute("profile", updatedProfile);
        model.addAttribute("socialMedia", socialMedia);
        // Optionally, add a success message or redirect to another page
        model.addAttribute("successMessage", "Profile saved successfully!");
        return "redirect:/companyProfile/"; 
	}

	// Handle file upload
	// Handle file upload
	@RequestMapping(value = "/profile/uploadPhoto", method = RequestMethod.POST)
	public String uploadPhoto(@ModelAttribute("profile") Profile profile, @RequestParam("file") MultipartFile file,
			@RequestParam("companyId") int companyId, Model model, HttpSession session) {

		if (!file.isEmpty()) {
			try {
				// Save the file to the desired location
				String uploadDir = "D:\\Servelt\\Final_JN\\webcontent\\resources\\Upload_image\\"; // Set your																				// path
				String fileName = companyId + "_" + file.getOriginalFilename(); // Use companyId to ensure uniqueness
				File uploadFile = new File(uploadDir + fileName);
				file.transferTo(uploadFile);

				// Update the company_photo in the database
				profile.setCompanyPhoto(fileName);
				profileDao.updateCompanyPhoto(companyId, fileName);

				// Reload the updated profile from the database
				Profile updatedProfile = profileDao.getCompanyProfileById(companyId);
				model.addAttribute("profile", updatedProfile);
				model.addAttribute("successMessage", "Photo uploaded successfully!");
				
				profileDao.saveSocialMediaAccount(profile);				
				List<SocialMediaAccount> socialMedia  = profile_companyDao.getSocialMediaAccountsByCompanyId(profile.getCompanyId());	        
			       
		        model.addAttribute("profile", updatedProfile);
		        model.addAttribute("socialMedia", socialMedia);
		        
		        //change home pic
		        session.setAttribute("compImage", fileName);

			} catch (IOException e) {
				model.addAttribute("errorMessage", "Photo upload failed: " + e.getMessage());
			}
		} else {
			model.addAttribute("errorMessage", "Please choose a file to upload.");
		}

		return "profile"; // Return to the profile page with the updated data
	}

	@RequestMapping(value = "/profile/deletePhoto", method = RequestMethod.POST)
	public String deletePhoto(@ModelAttribute("profile") Profile profile, @RequestParam("companyId") int companyId, HttpSession session,
			Model model) {

		profileDao.deleteCompanyPhoto(companyId);
		Profile updatedProfile = profileDao.getCompanyProfileById(companyId);
		model.addAttribute("profile", updatedProfile);
		model.addAttribute("successMessage", "Photo uploaded successfully!");
		
		//change home pic
        session.setAttribute("compImage", "default_pic.jpg");
		return "profile";
	}
	@RequestMapping(value = "/profile/deleteSocial/{accountId}/{companyId}", method = RequestMethod.GET)
    public String deleteSocialMediaAccount(@PathVariable("accountId") int accountId, @PathVariable("companyId") int companyId) {
        try {
            // Call the service to delete the social media account
            boolean isDeleted = profileDao.deleteSocialMediaAccount(accountId);
            
            if (isDeleted) {
                System.out.println("deleted successfully");
            } else {
            	 System.out.println("deleted fail");
            }
        } catch (Exception e) {
        	 System.out.println("error");
        }
        // Redirect back to the profile page
        return "redirect:/profile/"+ companyId;
    }
}
