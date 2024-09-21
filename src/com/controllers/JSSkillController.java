package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSSkill;
import com.dao.JSSkillDao;

@Controller
public class JSSkillController {
	@Autowired
	private JSSkillDao dao;

	@RequestMapping(value = "/saveSkill", method = RequestMethod.POST)
	public String saveSkill(@Valid @ModelAttribute("skill") JSSkill skill, BindingResult result, Model model,
			HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//    	if (result.hasErrors()) {
//    		 if (result.hasFieldErrors("skill")) {
////                model.addAttribute("skillError", result.getFieldError("skill").getDefaultMessage());
//    			redirectAttributes.addFlashAttribute("errorMessage", "There was an error saving your skill. Please try again.");
//            }
//    		 return "redirect:/create/qualifications/page";
////            return "createQualifications"; // Return to the form page with validation errors
//        }
		int userId = (int) session.getAttribute("tuserId");
		if (!dao.isSkillUnique(skill.getSkill(), userId)) {
			redirectAttributes.addFlashAttribute("errorMessage", "Skill is already existed!");
			return "redirect:/create/qualifications/page"; // Redirect back to form page with error message
		}
		dao.save(skill);
		redirectAttributes.addFlashAttribute("saveMessage", skill.getSkill() + " is saved successfully!");
		return "redirect:/create/qualifications/page"; // Redirect to a view page to display saved skills
	}

	@RequestMapping(value = "/profile/saveSkill", method = RequestMethod.POST)
	public String saveProfileSkill(@ModelAttribute("skill") JSSkill skill, HttpSession session,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int userId = (int) session.getAttribute("tuserId");
		if (!dao.isSkillUnique(skill.getSkill(), userId)) {
			redirectAttributes.addFlashAttribute("skillerrorMessage", skill.getSkill() + " is already existed!");
			return "redirect:/job_seeker/profile/" + skill.getUserId(); // Redirect back to form page with error message
		}
		dao.save(skill);
		return "redirect:/job_seeker/profile/" + skill.getUserId(); // Redirect to a view page to display saved skills
	}

	@RequestMapping(value = "/delete/skill/quapage/{id}", method = RequestMethod.GET)
	public String deleteJSSkillQua(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
		Integer userId = (Integer) session.getAttribute("userId");
		dao.deleteSkill(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Skill deleted successfully!");
		return "redirect:/create/qualifications/page";
	}
}
