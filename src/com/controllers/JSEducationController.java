package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSEducation;
import com.dao.JSEducationDao;

@Controller
public class JSEducationController {
	@Autowired
	private JSEducationDao JSEducationDao;

	@RequestMapping(value = "/save/js/education", method = RequestMethod.POST)
	public String saveJSEducation(@ModelAttribute("jseducation") JSEducation jseducation,
			RedirectAttributes redirectAttributes) {
		JSEducationDao.save(jseducation);
		redirectAttributes.addFlashAttribute("saveMessage", "Your education saved successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = "/delete/education/{id}", method = RequestMethod.GET)
	public String deleteJSEducation(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		JSEducationDao.deleteEducation(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your education deleted successfully!");
		return "redirect:/create/qualifications/page";
	}

}
