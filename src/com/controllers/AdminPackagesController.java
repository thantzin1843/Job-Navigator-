package com.controllers;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.Admin;
import com.beans.AdminPackages;
import com.dao.AdminDAO;
import com.dao.AdminPackagesDAO;


@Controller
public class AdminPackagesController {
	
	@Autowired
    private AdminPackagesDAO adminPackagesDAO;
	@Autowired
    private AdminDAO admin1DAO;
	@RequestMapping(value = "/adminPackages")
    public String getPointsPackages( Model model) {
		List<AdminPackages> packages = adminPackagesDAO.getAllPackages();
        model.addAttribute("packages", packages);
        
       
        
        model.addAttribute("selectedPackage", new AdminPackages());
        Admin admin = admin1DAO.getAdminByDefaultId(); // Fetch data for admin_id = 1
        model.addAttribute("admin", admin);
        //System.out.println("Packages List: " + packages);
        return "adminPackages";
       
        
 }

	@RequestMapping(value = "/adminPackages/edit", method = RequestMethod.POST)
	public String editPackage(@RequestParam("packageId") long packageId, Model model) {
	    AdminPackages packageToEdit = adminPackagesDAO.getPackageById(packageId);
	    model.addAttribute("selectedPackage", packageToEdit);
        model.addAttribute("packages", adminPackagesDAO.getAllPackages());
        return "adminPackages";
	}
	
	@RequestMapping(value = "/adminPackages/update", method = RequestMethod.POST)
	public String updatePackage(@ModelAttribute("selectedPackage") AdminPackages adminPackage, Model model) {
	    if (adminPackage.getCost() == null) {
	        model.addAttribute("message", "Points and Cost cannot be null");
	        return "adminPackages"; // or redirect to an error page
	    }
	    adminPackagesDAO.updatePackage(adminPackage);
	    return "redirect:/adminPackages";
	}

	@RequestMapping(value = "/adminPackages/add", method = RequestMethod.POST)
	public String addPackage(@RequestParam("points") int points,
	                         @RequestParam("cost") BigDecimal cost,
	                         RedirectAttributes redirectAttributes) {

	    List<AdminPackages> existingPackages = adminPackagesDAO.getAllPackages();
	    for (AdminPackages pkg : existingPackages) {
	        if (pkg.getPoints() == points) {
	            redirectAttributes.addFlashAttribute("message", "Can't add; points already exist.");
	            return "redirect:/adminPackages";  // Redirect back to the same page with the message
	        }
	    }

	    AdminPackages newPackage = new AdminPackages();
	    newPackage.setPoints(points);
	    newPackage.setCost(cost);

	    adminPackagesDAO.addPackage(newPackage);
	    redirectAttributes.addFlashAttribute("message1", "Package added successfully");

	    return "redirect:/adminPackages";
	}


	@RequestMapping(value = "/adminPackages/delete", method = RequestMethod.POST)
	public String deletePackage(@RequestParam("packageId") long packageId, RedirectAttributes redirectAttributes) {
	    List<Integer> pendingPackageIds = adminPackagesDAO.getPendingPackageIds();
	    
	    // Check if the packageId is in the list of pending package IDs
	    if (pendingPackageIds.contains((int) packageId)) {
	        redirectAttributes.addFlashAttribute("message2", "Can't delete; package has pending payments.");
	        redirectAttributes.addFlashAttribute("errorPackageId", packageId);  // Send the packageId with the message
	        return "redirect:/adminPackages";  // Redirect with error message
	    }
	    
	    // Proceed with deletion if no pending payments
	    adminPackagesDAO.deletePackage(packageId);
	    redirectAttributes.addFlashAttribute("message1", "Package deleted successfully");
	    
	    return "redirect:/adminPackages";  // Redirect with success message
	}




	public class AdminPackagesRowMapper implements RowMapper<AdminPackages> {
	    @Override
	    public AdminPackages mapRow(ResultSet rs, int rowNum) throws SQLException {
	        AdminPackages adminPackage = new AdminPackages();
	        adminPackage.setPackageId(rs.getLong("package_id"));
	        adminPackage.setPoints(rs.getInt("points"));
	        adminPackage.setCost(rs.getBigDecimal("cost"));
	        return adminPackage;
	    }
	}
	// Inside your controller class

	

}
