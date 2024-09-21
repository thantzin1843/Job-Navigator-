package com.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSCertificate;
import com.dao.JSCertificateDao;

@Controller
public class JSCertificateController {

	private static String UPLOAD_DIR = "C:/uploads/";

	@Autowired
	private JSCertificateDao dao;

	@RequestMapping(value = "/saveJSCertificate", method = RequestMethod.POST)
	public String saveCertification(@ModelAttribute("certification") JSCertificate certification,
			@RequestParam("imageFile") MultipartFile imageFile, RedirectAttributes redirectAttributes) {
		if (!dao.isCertificateUnique(certification.getCertificate())) {
			redirectAttributes.addFlashAttribute("errorMessage",
					"Certificate " + certification.getCertificate() + " is already existed!");
			return "redirect:/create/qualifications/page"; // Redirect back to form page with error message
		}
		// Save the uploaded file to the server
		if (!imageFile.isEmpty()) {
			try {
				byte[] bytes = imageFile.getBytes();
				Path path = Paths.get(UPLOAD_DIR + imageFile.getOriginalFilename());
				Files.write(path, bytes);

				// Set the image file name to the Certification object
				certification.setImage(imageFile.getOriginalFilename());

			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		// Save the certification details to the database
		dao.save(certification);

		redirectAttributes.addFlashAttribute("saveMessage",
				"Your certificate, " + certification.getCertificate() + " saved successfully!");
		return "redirect:/create/qualifications/page";
	}

	@RequestMapping(value = "/delete/certificate/{id}", method = RequestMethod.GET)
	public String deleteJSCertificate(@PathVariable int id, HttpSession session,
			RedirectAttributes redirectAttributes) {
		dao.deleteCertificate(id);
		redirectAttributes.addFlashAttribute("deleteMessage", "Your certificate deleted successfully!");
		return "redirect:/create/qualifications/page";
	}
}
