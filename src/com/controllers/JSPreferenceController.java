package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beans.JSPreference;
import com.dao.JSPreferenceDao;

@Controller
public class JSPreferenceController {
	@Autowired
	private JSPreferenceDao JSPreferenceDao;

	@RequestMapping(value = "/js/saveJobPreference", method = RequestMethod.POST)
	public String saveJobPreference(@ModelAttribute("jobPreference") JSPreference jobPreference, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		JSPreferenceDao.save(jobPreference);
		return "redirect:/job_seeker/profile/" + userId;
	}

	@RequestMapping(value = "/js/updateJobPreference", method = RequestMethod.POST)
	public String updateJobPreference(@ModelAttribute("jobPreference") JSPreference jobPreference) {
		JSPreferenceDao.update(jobPreference);

		return "redirect:/create/preference/page";
	}
}
