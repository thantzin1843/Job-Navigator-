
package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSExp;
import com.dao.JSExpDao;

@Controller
public class JSExpController {

	@Autowired
	private JSExpDao JSExpDao;

	@RequestMapping(value = "/js/saveExp", method = RequestMethod.POST)
	public String saveJSExp(@ModelAttribute("jsexp") JSExp jsexp, RedirectAttributes redirectAttributes) {
		JSExpDao.save(jsexp);
		redirectAttributes.addFlashAttribute("saveMessage", "Your experience saved successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = "/delete/exp/{id}", method = RequestMethod.GET)
	public String deleteJSExp(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
		JSExpDao.deleteExp(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your experience deleted successfully!");
		return "redirect:/create/qualifications/page";
	}

}
