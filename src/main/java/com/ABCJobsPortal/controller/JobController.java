package com.ABCJobsPortal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ABCJobsPortal.model.JobApplication;
import com.ABCJobsPortal.model.Jobs;
import com.ABCJobsPortal.service.JobApplicationService;
import com.ABCJobsPortal.service.JobsService;

@Controller
public class JobController {

	@Autowired
	JobsService js;

	@Autowired
	JobApplicationService jobApplicationService;

	@RequestMapping(value = "/job", method = RequestMethod.GET)
	public ModelAndView jobs(@RequestParam(name = "q", required = false) String query, HttpSession session, Model model)
			throws Exception {
		List<Jobs> jobs;

		if (query != null && !query.trim().isEmpty()) {
			// If a query is provided, perform a search based on the query
			jobs = js.searchJobs(query); // Implement this method in your JobsService
		} else {
			// If no query is provided, retrieve all job listings
			jobs = js.getAllJobs();
		}

		model.addAttribute("jobs", jobs);

		List<JobApplication> jobApplication = jobApplicationService.getAllJobApplications();
		model.addAttribute("jobApplication", jobApplication);

		return new ModelAndView("job/job");
	}

	@RequestMapping(value = "/add-job")
	public ModelAndView addJob(HttpSession session) throws Exception {
		return new ModelAndView("job/add-job");
	}

	@RequestMapping(value = "/add-job", method = RequestMethod.POST)
	public String addJob(@RequestParam("jobName") String jobName, @RequestParam("companyName") String companyName,
			@RequestParam("jobDesc") String jobDesc, @RequestParam("location") String location,
			@RequestParam("workplaceType") String workplaceType, @RequestParam("salary") String salary,
			@RequestParam("jobType") String jobType, Jobs job, Model model, HttpSession session) throws Exception {

		try {
			job.setJobName(jobName);
			job.setCompanyName(companyName);
			job.setJobDesc(jobDesc);
			job.setLocation(location);
			job.setWorkplaceType(workplaceType);
			job.setSalary(salary);
			job.setJobType(jobType);
			job.setDatePosted(java.time.LocalDate.now().toString());
			job.setPostedBy(String.valueOf(session.getAttribute("userId")));
			js.addJob(job);

			List<Jobs> updatedJobs = js.getAllJobs();
			model.addAttribute("jobs", updatedJobs);

			List<JobApplication> updatedJobApplication = jobApplicationService.getAllJobApplications();
			model.addAttribute("jobApplication", updatedJobApplication);

			model.addAttribute("scMessage", "Successfully added to job listing");
			return "job/job";
		} catch (Exception e) {
			System.out.println(e);
		}

		model.addAttribute("errMsg", "Error occured");
		return "job/add-job";
	}

	@RequestMapping(value = "/apply/{id}", method = RequestMethod.POST)
	public String applyJob(@PathVariable("id") Long id, @RequestParam("resume") String resume, Jobs job,
			JobApplication jobApplication, Model model, HttpSession session) throws Exception {

		try {

			jobApplication.setJobid(id.toString());
			jobApplication.setUserId(String.valueOf(session.getAttribute("userId")));
			jobApplication.setStatus("Pending");
			jobApplication.setResume(resume);
			jobApplication.setDateApplied(java.time.LocalDate.now().toString());
			jobApplicationService.apply(jobApplication);

			List<Jobs> updatedJobs = js.getAllJobs();
			model.addAttribute("jobs", updatedJobs);

			List<JobApplication> updatedJobApplication = jobApplicationService.getAllJobApplications();
			model.addAttribute("jobApplication", updatedJobApplication);

			model.addAttribute("scMessage",
					"You have successfully submitted your application. Please wait for approval.");
			return "job/job";
		} catch (Exception e) {
			System.out.println("ERROR HEREEE: " + e);
		}

		System.out.println("Application failed.");
		model.addAttribute("errMsg", "Application failed.");
		return "job/job";
	}
}
