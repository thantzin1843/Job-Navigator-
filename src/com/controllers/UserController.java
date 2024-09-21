package com.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.AdminDDao;
import com.dao.ApplicationDao;
import com.dao.CategoryDao;
import com.dao.CompanyDao;
import com.dao.JobSeekerDao;
import com.dao.ReadyToJobDao;
import com.dao.TestimonialDao;
import com.dao.UserDao;
import com.model.Category;
import com.model.Company;
import com.model.JobSeeker;
import com.model.Testimonial;
import com.model.User;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;

	@Autowired
	private JobSeekerDao jobSeekerDao;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private TestimonialDao testimonialDao;

	@Autowired
	private CategoryDao categoryDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private AdminDDao adminDDao;

	@Autowired
	private ReadyToJobDao ReadyToJobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showIndexPage(Model model, HttpSession session) {
		// Fetch testimonials and add them to the model
		List<Testimonial> testimonials = testimonialDao.getAllTestimonials();
		model.addAttribute("testimonials", testimonials);
		System.out.println(testimonials);
		// Fetch categories and add them to the model
		List<Category> categories = categoryDao.getAllCategories();
		model.addAttribute("categories", categories);

		// Fetch locations from CompanyDao and add them to the model
		List<String> locations = companyDao.getAllLocations();
		System.out.println("Locations fetched: " + locations);
		model.addAttribute("locations", locations);

		int JSCount = adminDDao.getJSCount();
		model.addAttribute("JSCount", JSCount);

		int CompanyCount = adminDDao.getCompanyCount();
		model.addAttribute("companyCount", CompanyCount);

		int JobsCount = adminDDao.getJobsCount();
		model.addAttribute("JobsCount", JobsCount);

		System.out.print("current usre role is " + session.getAttribute("trole"));
		if (session.getAttribute("trole") == "js") {
			Integer jsId = (Integer) session.getAttribute("jobseeker_id");
			System.out.print("current usre role is " + jsId);
			if (jsId != null) {

				int notiCount = applicationDao.jsapplicationCount(jsId);
				model.addAttribute("notiCount", notiCount);
				List<Map<String, Object>> notifications = applicationDao.getGeneralNotificationsByJSId(jsId);
				model.addAttribute("notifications", notifications);
				// Proceed with your logic
			} else {
				// Handle the case where jsId is null
				System.out.println("jsId is null");
			}

			// List<JobSeeker> js = JSDao.getSkillsByJobSeekerId(id);
			// model.addAttribute("js", js);
			return "home";
		}
		if (session.getAttribute("trole") == "company") {
			Integer compId = (Integer) session.getAttribute("company_id");
			int notiCount = applicationDao.applicationCount(compId);
			model.addAttribute("notiCount", notiCount);
			List<Map<String, Object>> gnotifications = applicationDao.getGeneralNotificationsByCompanyId(compId);
			model.addAttribute("gnotifications", gnotifications);
			List<Map<String, Object>> pnotifications = applicationDao.getPaymentNotificationsByCompanyId(compId);
			model.addAttribute("pnotifications", pnotifications);
			System.out.println("here is p notification" + gnotifications);
			System.out.println("here is p notification" + pnotifications);

			return "home";
		}
//		System.out.println("after g");
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage(Model model) {
		return "login";
	}

	// Handle user login
	@RequestMapping(value = "/login/js_login", method = RequestMethod.POST)
	public String JSLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("role") String role, HttpSession session, Model model) {
		System.out.println("JS login");
		User user = userDao.getUserByEmail(email);
		if (user != null) {
			System.out.println("User found: " + user.getEmail());
			System.out.println("Encoded password from DB: " + user.getPasswordHash());
			System.out.println("Raw password entered: " + password);
			System.out.println("Role from DB: '" + user.getRole() + "'");
			System.out.println("Role from request: '" + role + "'");
			boolean passwordMatches = passwordEncoder.matches(password, user.getPasswordHash());
			System.out.println("Password matches: " + passwordMatches);
			if (passwordMatches) {
				session.setAttribute("jsName", user.getUsername());
				if (user.getRole().trim().equalsIgnoreCase(role.trim())) {
					session.setAttribute("user_Id", user.getId());
					session.setAttribute("userId", user.getId());
					System.out.println(user.getId());
					Integer jobSeekerId = userDao.getJobSeekerIdByUserId(user.getId());

					// Add jobseeker_id to session if it was found
					if (jobSeekerId != null) {
						// session.removeAttribute("company_id");
						session.setAttribute("trole", "js");
						JobSeeker jobSeeker = jobSeekerDao.getJobSeekerByUserId(user.getId());
						ReadyToJobDao.insertReadyToJob(user.getId(), false);
						session.setAttribute("jobSeekerId", jobSeekerId);
						session.setAttribute("jsImage", jobSeeker.getImage());
						session.setAttribute("jobseeker_id", jobSeekerId);
						System.out.println(jobSeekerId);
						System.out.print("Testing by TZW");
					} else {
						// Handle the case where jobseeker_id was not found, if necessary
						session.setAttribute("jobseeker_id", "not_found");
					}

					List<Testimonial> testimonials = testimonialDao.getAllTestimonials();
					model.addAttribute("testimonials", testimonials);

					return "redirect:/";
				} else if (user.getRole().trim().equalsIgnoreCase("Admin")) {
					session.setAttribute("admin_id", user.getId());
					return "redirect:/admin_dashboard";
				} else {
					model.addAttribute("error", "Invalid role");
					model.addAttribute("js", "true");
					return "login";
				}
			} else {
				model.addAttribute("error", "Invalid email or password");
				model.addAttribute("js", "true");
				return "login";
			}
		} else {
			model.addAttribute("error", "Invalid email or password");
			model.addAttribute("js", "true");
			return "login";
		}
	}

	@RequestMapping(value = "/login/comp_login", method = RequestMethod.POST)
	public String CompLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("role") String role, HttpSession session, Model model) {
		System.out.println("Company login");
		User user = userDao.getUserByEmail(email);
		if (user != null) {
			System.out.println("User found: " + user.getEmail());
			System.out.println("Encoded password from DB: " + user.getPasswordHash());
			System.out.println("Raw password entered: " + password);
			System.out.println("Role from DB: '" + user.getRole() + "'");
			System.out.println("Role from request: '" + role + "'");
			boolean passwordMatches = passwordEncoder.matches(password, user.getPasswordHash());
			System.out.println("Password matches: " + passwordMatches);
			if (passwordMatches) {
				session.setAttribute("username", user.getUsername());
				if (user.getRole().trim().equalsIgnoreCase(role.trim())) {
					// session.setAttribute("company_id", user.getId());

					Integer company_id = userDao.getCompanyIdByUserId(user.getId());

					if (company_id != null) {
						Company company = companyDao.getCompanyByUserId(user.getId());
						int points = companyDao.getPointsBalanceByCompanyId(company_id);
						System.out.println(company.getName());
						System.out.println(company.getImage());

						session.setAttribute("trole", "company");
						session.setAttribute("userId", user.getId());
						session.setAttribute("companyId", company_id);
						session.setAttribute("compName", company.getName());
						session.setAttribute("compImage", company.getImage());
						session.setAttribute("points", points);
						session.setAttribute("company_id", company_id);
						System.out.print("Test by TZW");
					} else {

						session.setAttribute("company_id", "not_found");
					}

					return "redirect:/";
				} else if (user.getRole().trim().equalsIgnoreCase("Admin")) {
					session.setAttribute("admin_id", user.getId());
					return "redirect:/admin_dashboard";
				} else {
					model.addAttribute("error", "Invalid role");
					model.addAttribute("js", "true");
					return "login";
				}
			} else {
				model.addAttribute("error", "Invalid email or password");
				model.addAttribute("js", "true");
				return "login";
			}
		} else {
			model.addAttribute("error", "Invalid email or password");
			model.addAttribute("js", "true");
			return "login";
		}
	}

	// Show registration page
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String showRegisterPage(Model model) {
		model.addAttribute("user", new User());
		return "signup";
	}

	// Handle user registration
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("user") User user, @RequestParam("role") String role,
			@ModelAttribute("company") Company company, Model model) {
		User existingUser = userDao.getUserByEmail(user.getEmail());
		if (existingUser != null) {
			// Email already exists, return an error message to the model
			model.addAttribute("errorMessage", "Email already exists. Please use a different email.");
			return "signup"; // Return to signup page with error
		}
		User registeredUser = userDao.registerUser(user);
		System.out.println(registeredUser.getId());
		System.out.println(registeredUser.getRole());

		System.out.println(company.getLocation());

		if (registeredUser != null) {
			if (role.equals("JobSeeker")) {
				JobSeeker jobSeeker = new JobSeeker();

				jobSeeker.setUserId(registeredUser.getId());
				jobSeekerDao.registerJobSeeker(jobSeeker);

			} else if (role.equals("Company")) {
				// Company company = new Company();

				company.setUserId(registeredUser.getId());
				company.setName(registeredUser.getName());
				company.setPhone(registeredUser.getPhone());

				companyDao.registerCompany(company);
			}
			return "redirect:/login";
		} else {
			model.addAttribute("error", "Registration failed. Please try again.");
			return "signup";
		}

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
//		session.removeAttribute("jobseeker_id");
//		session.removeAttribute("company_id"); 
		session.invalidate(); // Invalidates the session, effectively logging out the user
		return "redirect:/"; // Redirects to the login page after logout
	}

}
