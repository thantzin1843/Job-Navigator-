package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.changepwDAO;

@Controller
public class changepwController {

	@Autowired
	private changepwDAO changePwDAO;

	@RequestMapping(value = "/changepw")
	public String getchangepw(Model model, HttpSession session) {
		System.out.print(" change pwa page");
		return "changepw";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword,
			HttpSession session, Model model, RedirectAttributes redirectAttrs) {
		// Default user_id set to 69
		int user_id = (Integer) session.getAttribute("userId");
		System.out.println(user_id); // Fetch the current password hash from the database
		String currentPasswordHash = changePwDAO.getPasswordHashByUserId(user_id);

		// Verify if the current password matches the hash in the database
		if (currentPasswordHash == null || !BCrypt.checkpw(currentPassword, currentPasswordHash)) {
			redirectAttrs.addFlashAttribute("error1", "Current password is incorrect!");
			return "redirect:/changepw";
		}

		// Check if new password and confirm password are the same
		if (!newPassword.equals(confirmPassword)) {
			redirectAttrs.addFlashAttribute("error2", "New password and confirm password do not match!");
			return "redirect:/changepw";
		}

		// Hash the new password using BCrypt
		String newPasswordHash = BCrypt.hashpw(newPassword, BCrypt.gensalt());

		// Update the password in the database
		boolean isUpdated = changePwDAO.updatePassword(user_id, newPasswordHash);

		if (isUpdated) {
			redirectAttrs.addFlashAttribute("success", "Password updated successfully!");
			return "redirect:/changepw";
		} else {
			redirectAttrs.addFlashAttribute("error", "Password update failed! Please try again.");
			return "redirect:/changepw"; // Failure redirect
		}
	}
}
