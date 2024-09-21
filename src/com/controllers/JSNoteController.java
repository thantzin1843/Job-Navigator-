
package com.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSNote;
import com.dao.JSNoteDao;

@Controller
public class JSNoteController {

	@Autowired
	private JSNoteDao dao;

	@RequestMapping(value = "/save/note", method = RequestMethod.POST)
	public String saveNote(@ModelAttribute("note") JSNote note, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		if (!dao.isNoteUnique(note.getNote())) {
			redirectAttributes.addFlashAttribute("noteerrorMessage", "Note is already existed!");
			return "redirect:/job_seeker/profile/" + note.getUserId(); // Redirect back to form page with error message
		}
		dao.save(note);
		return "redirect:/job_seeker/profile/" + note.getUserId(); // Redirect to a view page to display saved skills
	}

}
