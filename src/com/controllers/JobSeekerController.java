package com.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beans.JSCertificate;
import com.beans.JSEducation;
import com.beans.JSExp;
import com.beans.JSNote;
import com.beans.JSPreference;
import com.beans.JSProject;
import com.beans.JSSkill;
import com.beans.JSSocialMedia;
import com.beans.JobSeeker;
import com.beans.Language;
import com.beans.ReadyToJob;
import com.dao.JSCertificateDao;
import com.dao.JSDao;
import com.dao.JSEducationDao;
import com.dao.JSExpDao;
import com.dao.JSNoteDao;
import com.dao.JSProjectDao;
import com.dao.JSSkillDao;
import com.dao.JSSocialMediaDao;
import com.dao.LanguageDao;
import com.dao.ReadyToJobDao;

@Controller
public class JobSeekerController {

	@Autowired
	JSDao jsDao;

	@Autowired
	JSSkillDao skillDao;

	@Autowired
	private LanguageDao languageDao;

	@Autowired
	private JSEducationDao educationDao;

	@Autowired
	private JSCertificateDao certificateDao;

	@Autowired
	private JSExpDao workExpDao;

	@Autowired
	private JSProjectDao projectDao;

	@Autowired
	private JSSocialMediaDao JSSocialMediaDao;

	@Autowired
	private ReadyToJobDao ReadyToJobDao;

	@Autowired
	private JSNoteDao notedao;

	private static String UPLOAD_DIR = "C:/uploads/";

//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String showForm(HttpSession session, Model m) {
//		Integer userId = (Integer) session.getAttribute("tuserId");
//		m.addAttribute("userId", userId);
//		return "home";
//	}

	@RequestMapping(value = "/job_seeker/profile/{id}", method = RequestMethod.GET)
	public String profile(@PathVariable int id, Model m, HttpSession session) {
		session.setAttribute("tuserId", id); // this is just for testing , set this session after login not here
		JobSeeker job_seeker = jsDao.getJobSeekerById(id);
		List<JSSkill> skills = skillDao.getSkillsByJobSeekerId(id);
		List<JSExp> workExperiences = workExpDao.getWorkExpByUserId(id);
		List<JSNote> notes = notedao.getNoteByJobSeekerId(id);
		List<JSSocialMedia> medias = JSSocialMediaDao.getSocialMediaByUserId(id);
		m.addAttribute("medias", medias);
		m.addAttribute("workExperiences", workExperiences);
		m.addAttribute("command", job_seeker);
		m.addAttribute("skills", skills);
		m.addAttribute("notes", notes);
		return "jobSeekerProfileJS";
	}

	@RequestMapping(value = "/delete/skill/{id}", method = RequestMethod.GET)
	public String deleteSkill(@PathVariable int id, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		skillDao.deleteSkill(id);
		return "redirect:/job_seeker/profile/" + userId;
	}

	@RequestMapping(value = "/delete/note/{id}", method = RequestMethod.GET)
	public String deleteJSNote(@PathVariable int id, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		notedao.deleteNote(id);
		return "redirect:/job_seeker/profile/" + userId;
	}

	@RequestMapping(value = "/create/preference/page", method = RequestMethod.GET)
	public String preferencePage(HttpSession session, Model m) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		JSPreference jobSeeker = jsDao.findByUserId(userId);
		System.out.println("job seeker " + jobSeeker);
		if (jobSeeker != null) {
			// If preference exists, redirect to an update page
			m.addAttribute("js", jobSeeker);
			m.addAttribute("userId", userId);
			return "updatePreferencePage";
		} else {
			// If no preference exists, show the create form
			m.addAttribute("userId", userId);
			System.out.println("preference page " + userId);
			return "createJobPreference";
		}

	}

	@RequestMapping(value = "/create/qualifications/page", method = RequestMethod.GET)
	public String qualificationpage(HttpSession session, Model model, HttpServletRequest request) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		List<JSSkill> skills = skillDao.getSkillsByJobSeekerId(userId);
		List<Language> languages = languageDao.getLanguagesByUserId(userId);
		List<JSEducation> educationList = educationDao.getEducationByUserId(userId);
		List<JSCertificate> certificates = certificateDao.getCertificatesByUserId(userId);
		List<JSExp> workExperiences = workExpDao.getWorkExpByUserId(userId);
		List<JSProject> projects = projectDao.getProjectsByUserId(userId);

		model.addAttribute("languages", languages);
		model.addAttribute("skills", skills);
		model.addAttribute("certificates", certificates);
		model.addAttribute("workExperiences", workExperiences);
		model.addAttribute("projects", projects);
		model.addAttribute("educationList", educationList);
		model.addAttribute("userId", userId);
		return "createQualifications";
	}

	@RequestMapping(value = "/create/jsother/page", method = RequestMethod.GET)
	public String otherpage(HttpSession session, Model model) {
		Integer userId = (Integer) session.getAttribute("tuserId");
		System.out.println(userId);
		List<ReadyToJob> openList = ReadyToJobDao.getOpenStatusByUserId(userId);
		boolean openStatus = openList.get(0).isReady(); // Assuming 'isOpen()' returns the boolean
		model.addAttribute("openStatus", openStatus);
		System.out.print(openStatus + "js controller");

		List<JSSocialMedia> medias = JSSocialMediaDao.getSocialMediaByUserId(userId);
		model.addAttribute("medias", medias);
		model.addAttribute("userId", userId);
		return "createOther";
	}

	@RequestMapping(value = "/js/editProfile/page", method = RequestMethod.GET)
	public String editProfilePage(HttpSession session, Model m) {
		Integer id = (Integer) session.getAttribute("tuserId");
		JobSeeker job_seeker = jsDao.getJobSeekerById(id);
		m.addAttribute("js", job_seeker);
		return "editJobSeekerProfile";
	}

	@RequestMapping(value = "/js/save/editedProfile", method = RequestMethod.POST)
	public String updateJobSeeker(@ModelAttribute("jobSeeker") JobSeeker jobSeeker,
			@RequestParam("img") MultipartFile img, HttpSession session) {
		Path uploadPath = Paths.get("C:/uploads/");
		try {
			if (Files.notExists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			if (!img.isEmpty()) {

				byte[] bytes = img.getBytes();
				Path path = uploadPath.resolve(img.getOriginalFilename());
				Files.write(path, bytes);

				jobSeeker.setImage(img.getOriginalFilename());
				session.setAttribute("jsImage", img.getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		jsDao.update(jobSeeker);
		return "redirect:/js/editProfile/page"; // Redirect to the appropriate page after update
	}

	@RequestMapping(value = "/saveCV", method = RequestMethod.POST)
	public String saveCV(HttpSession session, @RequestParam("cv") MultipartFile cv,
			RedirectAttributes redirectAttributes) {
		Integer id = (Integer) session.getAttribute("tuserId");
		JobSeeker js = new JobSeeker();
		Path uploadPath = Paths.get("C:/uploads/");
		try {
			if (Files.notExists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}

			if (!cv.isEmpty()) {
				System.out.println("File Name: " + cv.getOriginalFilename());
				System.out.println("File Size: " + cv.getSize());

				byte[] bytes = cv.getBytes();
				Path path = uploadPath.resolve(cv.getOriginalFilename());
				Files.write(path, bytes);

				js.setCv(cv.getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		jsDao.cvUpload(js, id);
		System.out.println("helo");
		return "redirect:/job_seeker/profile/" + id;
	}

	@RequestMapping("/preview")
	@ResponseBody
	public ResponseEntity<Resource> previewFile(@RequestParam String filename, HttpServletRequest request) {
		try {
			// Locate the file
			Path filePath = Paths.get(UPLOAD_DIR).resolve(filename).normalize();
			Resource resource = new UrlResource(filePath.toUri());

			if (resource.exists() && resource.isReadable()) {
				// Determine the file's content type
				String contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
				if (contentType == null) {
					contentType = "application/octet-stream";
				}

				// Return the file for preview
				return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
						.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
						.body(resource);
			} else {
				// File not found or not readable
				return ResponseEntity.status(404).body(null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).body(null);
		}
	}

}
