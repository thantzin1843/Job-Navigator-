
package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSSocialMedia;
import com.dao.JSSocialMediaDao;

@Controller
public class JSSocialMediaController {
	@Autowired
	private JSSocialMediaDao dao;

	@RequestMapping(value = "/js/create/socialMedia", method = RequestMethod.POST)
	public String saveSocialmedia(@ModelAttribute("social") JSSocialMedia social,
			RedirectAttributes redirectAttributes) {
		if (!dao.isMediaUnique(social.getLink())) {
			redirectAttributes.addFlashAttribute("errorMessage", "Account is already existed!");
			return "redirect:/create/qualifications/page"; // Redirect back to form page with error message
		}
		dao.save(social);
		redirectAttributes.addFlashAttribute("saveMessage", "Your account is saved successfully!");
		return "redirect:/create/jsother/page"; // Redirect to a view page to display saved skills
	}

	@RequestMapping(value = "/delete/media/{id}", method = RequestMethod.GET)
	public String deleteJSSocialMedia(@PathVariable int id, HttpSession session,
			RedirectAttributes redirectAttributes) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		dao.deleteMedia(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your account is deleted successfully!");
		return "redirect:/create/jsother/page";
	}
}
