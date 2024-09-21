package com.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.ReadyToJobDao;

@Controller
public class ReadyToJobController {

	@Autowired
	private ReadyToJobDao ReadyToJobDao;

	@RequestMapping(value = "/updateOpenStatus", method = RequestMethod.POST)
	public String updateOpenStatus(@RequestParam("openStatus") boolean openStatus, HttpSession session) {
		System.out.println(openStatus);
		Integer userId = (Integer) session.getAttribute("tuserId");
		if (userId != null) {
			// Update the open status in the database
			ReadyToJobDao.updateOpenStatus(userId, openStatus);
		} else {
			return "redirect:/create/jsother/page"; // Or any other appropriate action
		}

		return "redirect:/create/jsother/page"; // Redirect back to the profile page or any other appropriate page
	}
}
