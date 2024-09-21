package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.Language;
import com.dao.LanguageDao;

@Controller
public class LanguageController {
	@Autowired
	private LanguageDao LanguageDao;

	@RequestMapping(value = "/saveLanguage", method = RequestMethod.POST)
	public String saveLanguage(@ModelAttribute("language") Language language, RedirectAttributes redirectAttributes) {
		if (!LanguageDao.isLanguageUnique(language.getName())) {
			redirectAttributes.addFlashAttribute("errorMessage", language.getName() + " language is already existed!");
			return "redirect:/create/qualifications/page"; // Redirect back to form page with error message
		}
		LanguageDao.save(language);
		redirectAttributes.addFlashAttribute("saveMessage", language.getName() + " language saved successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = "/delete/language/{id}", method = RequestMethod.GET)
	public String deleteJSNote(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		LanguageDao.deleteLanguage(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your language deleted successfully!");
		return "redirect:/create/qualifications/page";
	}
}
