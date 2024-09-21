package com.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSProject;
import com.dao.JSProjectDao;

@Controller
public class JSProjectController {

	@Autowired
	private JSProjectDao projectDao;

	private static String UPLOAD_DIR = "C:/uploads";

	@RequestMapping(value = "/js/saveProject", method = RequestMethod.POST)
	public String saveJSProject(@ModelAttribute("project") JSProject project,
			@RequestParam("imageFile") MultipartFile imageFile, RedirectAttributes redirectAttributes) {

		Path uploadPath = Paths.get("C:/uploads/");
		try {
			if (Files.notExists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			if (!imageFile.isEmpty()) {
				byte[] bytes = imageFile.getBytes();
				Path path = uploadPath.resolve(imageFile.getOriginalFilename());
				Files.write(path, bytes);

				project.setImage(imageFile.getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// Save the certification details to the database
		projectDao.save(project);
		redirectAttributes.addFlashAttribute("saveMessage", "Your project saved successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = "/delete/project/{id}", method = RequestMethod.GET)
	public String deleteJSProject(@PathVariable int id, HttpSession session, RedirectAttributes redirectAttributes) {
		projectDao.deleteProject(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your project deleted successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = " /delete/project/editPage/{id}", method = RequestMethod.GET)
	public String editPage(@PathVariable int id, HttpSession session, Model m) {
		JSProject pj = projectDao.getProjectById(id);
		m.addAttribute("project", pj);
		return "editProject";
	}

	@RequestMapping(value = "/project/update", method = RequestMethod.POST)
	public String updateProject(@ModelAttribute("project") JSProject project,
			@RequestParam("imageFile") MultipartFile imageFile, RedirectAttributes redirectAttributes) {

		Path uploadPath = Paths.get("C:/uploads/");
		try {
			if (Files.notExists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			if (!imageFile.isEmpty()) {
				byte[] bytes = imageFile.getBytes();
				Path path = uploadPath.resolve(imageFile.getOriginalFilename());
				Files.write(path, bytes);

				project.setImage(imageFile.getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		// Save the certification details to the database
		projectDao.update(project);
		redirectAttributes.addFlashAttribute("saveMessage", "Project infos are updated successfully!");
		return "redirect:/create/qualifications/page";
	}

}
