package com.ABCJobsPortal.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCJobsPortal.model.BulkEmail;
import com.ABCJobsPortal.model.Posts;
//import com.ABCJobsPortal.model.Educations;
//import com.ABCJobsPortal.model.Experiences;
//import com.ABCJobsPortal.model.JobPosting;
//import com.ABCJobsPortal.model.Thread;
//import com.ABCJobsPortal.model.ThreadComment;
import com.ABCJobsPortal.model.UserDetails;
import com.ABCJobsPortal.service.BulkEmailService;
import com.ABCJobsPortal.service.PostService;
//import com.ABCJobsPortal.service.EducationsService;
//import com.ABCJobsPortal.service.ExperiencesService;
//import com.ABCJobsPortal.service.JobPostingService;
//import com.ABCJobsPortal.service.ThreadCommentService;
//import com.ABCJobsPortal.service.ThreadService;
import com.ABCJobsPortal.service.UserDetailsService;

@Controller
public class DashboardController {

	@Autowired
	UserDetailsService ud;
	
//	@Autowired
//	EducationsService eds;
//	
//	@Autowired
//	ExperiencesService exs;
//	
	@Autowired
	BulkEmailService bes;
	
	@Autowired
	PostService ps;
	

	
	@RequestMapping(value="/dashboard") // profile overview
	public ModelAndView dashboard(HttpSession session, Model model, Posts post) throws Exception {

			List<Posts> posts = ps.getAllPosts(); 
			
		    // Calculate and set timeSincePosted for each post
		    LocalDateTime currentDateTime = LocalDateTime.now(ZoneId.of("Asia/Singapore"));
		    for (Posts p : posts) {
		        p.setTimeSincePosted(getTimeSincePosted(p.getCreatedAt(), currentDateTime));
		    }
		    System.out.println("TIME: " + currentDateTime);
		    
			model.addAttribute("posts", posts);
			System.out.println("Posts: " + posts);
			
		try {
			this.setModel(model, session);
			return new ModelAndView("dashboard/index");  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login/login");
		}
	}
	
	@RequestMapping(value="/create-post", method= RequestMethod.POST)
	public String createPost(
			@RequestParam("category") String category, 
			@RequestParam("heading") String heading,
			@RequestParam("body") String body,
			Posts post, Model model, HttpSession session, UserDetails userDetails) throws Exception {
		
		try {
			LocalDateTime now = LocalDateTime.now();
			
			post.setCategory(category);
			post.setHeading(heading);
			post.setBody(body);
			post.setCreatedAt(now);
			post.setPostedByFirstName(String.valueOf(session.getAttribute("firstName")));
			post.setPostedByLastName(String.valueOf(session.getAttribute("lastName")));

			Object userIdObj = session.getAttribute("userId");
			if (userIdObj != null && userIdObj instanceof Long) {
			    Long userId = (Long) userIdObj;
			    post.setCreatedBy(userId);
			} else {
			    System.err.println("Error: User ID not found or not valid");
			}
			
			ps.createPost(post);
			
			this.setModel(model, session);
			List<Posts> updatedPosts = ps.getAllPosts();
			model.addAttribute("posts", updatedPosts);
			
			model.addAttribute("scMessage", "You have successfully created a post");
			return "dashboard/index";
		} catch (Exception e) {
			System.out.println(e);
		}
		
		model.addAttribute("errMsg", "Post failed");
		return "dashboard/index";
	}
	
	private String getTimeSincePosted(LocalDateTime postedAt, LocalDateTime currentDateTime) {
	    Duration duration = Duration.between(postedAt, currentDateTime);

	    long days = duration.toDays();
	    long hours = duration.toHours() % 24;
	    long minutes = duration.toMinutes() % 60;

	    String timeSincePosted;
	    if (days > 0) {
	        timeSincePosted = String.format("Posted %d days, %d hours ago", days, hours);
	    } else if (hours > 0) {
	        timeSincePosted = String.format("Posted %d hours ago", hours);
	    } else {
	        timeSincePosted = String.format("Posted %d minutes ago", minutes);
	    }

	    return timeSincePosted;
	}
    
	
	@RequestMapping(value = "/profile")	public ModelAndView profile(HttpSession session, Model model) {
		try {
			this.setModel(model, session);
			return new ModelAndView("dashboard/profile");  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login/login");
		}
	}
	
	@RequestMapping(value="/update-profile") // update profile GET
	public ModelAndView updateProfile(Model model, HttpSession session) throws Exception {
		try {
			this.setModel(model, session);
			return new ModelAndView("dashboard/update-profile");  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login/login");
		}
	}
	
	@RequestMapping(value="/update-profile", method = RequestMethod.POST) // update profile POST
	public String up(
			@ModelAttribute("profile") UserDetails userDetails,
			@RequestParam("position") String position, @RequestParam("startDateEX") String startDateEX, 
			@RequestParam("endDateEX") String endDateEX, @RequestParam("companyNameEX") String companyNameEX, 
			@RequestParam("intitutionName") String intitutionName, @RequestParam("startDateED") String startDateED, 
			@RequestParam("endDateED") String endDateED, @RequestParam("educationName") String educationName, 
//			Experiences experiences, Educations educations,
			Model model, HttpSession session) {
		
		Long userDetailsId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
		ud.updateProfile(userDetailsId, userDetails);
		
//		if(position.equals("") || startDateEX.equals("") || endDateEX.equals("") || companyNameEX.equals("")) {
//			System.out.println("Experiences Empty");
//		} else {
			// exs.updateExperiences(String.valueOf(userDetailsId), experiences);
			
//			experiences.setPosition(position);
//			experiences.setStartDate(startDateEX);
//			experiences.setEndDate(endDateEX);
//			experiences.setCompanyName(companyNameEX);
//			experiences.setUserDetailsId(String.valueOf(userDetailsId));
//			
//			exs.addExperiences(experiences);
//		}
		
//		if(intitutionName.equals("") || startDateED.equals("") || endDateED.equals("") || educationName.equals("")) {
//			System.out.println("Educations Empty");
//		} else {
//			educations.setEducationName(educationName);
//			educations.setStartDate(startDateED);
//			educations.setEndDate(endDateED);
//			educations.setIntitutionName(intitutionName);
//			educations.setUserDetailsId(String.valueOf(userDetailsId));
//			
//			eds.addEducations(educations);
//		}
		
		this.setModel(model, session);
		
		String msg = "Profile has been updated";
		model.addAttribute("message", msg);
		return "dashboard/profile";
	}
	
	private void setModel(Model model, HttpSession session) {
		String userId = String.valueOf(session.getAttribute("userId"));
		String[] userDetails = ud.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("f", userDetails[1].charAt(0));
		model.addAttribute("l", userDetails[2].charAt(0));
		
		model.addAttribute("firstName", userDetails[1]);
		model.addAttribute("lastName", userDetails[2]);
		
		model.addAttribute("fullName", userDetails[1] + " " + userDetails[2]);
		model.addAttribute("title", userDetails[3]);
		model.addAttribute("about", userDetails[4]);
		model.addAttribute("company", userDetails[5]);
		model.addAttribute("email", session.getAttribute("email"));
		model.addAttribute("website", userDetails[6]);
		
		// experiences
//		model.addAttribute("ex", exs.getExperiencesByUserDetailsId(udID)); // Experiences[]
//		
//		// educations
//		model.addAttribute("ed", eds.getEducationsByUserDetailsId(udID)); // Educations[]
		
		// notifications
		List<BulkEmail> be = bes.getEmail(); 
		model.addAttribute("nf1", be.get(be.size() - 1));
		model.addAttribute("nf2", be.get(be.size() - 2));
		model.addAttribute("nf3", be.get(be.size() - 3));
	}
}
