package com.ABCJobsPortal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


import com.ABCJobsPortal.model.BulkEmail;
import com.ABCJobsPortal.model.JobApply;
import com.ABCJobsPortal.model.Jobs;
import com.ABCJobsPortal.model.Posts;
import com.ABCJobsPortal.repository.BulkEmailRepository;
import com.ABCJobsPortal.repository.JobApplyRepository;
import com.ABCJobsPortal.repository.JobRepository;
import com.ABCJobsPortal.repository.PostsRepository;
import com.ABCJobsPortal.repository.UserDetailsRepository;
import com.ABCJobsPortal.service.JobApplyService;

@RestController
@RequestMapping(value = "/page")
public class PageController {
	@Autowired
	JobRepository jobRepository;;

	@Autowired
	BulkEmailRepository bmRepository;

	@Autowired
	PostsRepository postRepo;

	@Autowired
	UserDetailsRepository udRepo;

	/*
	 * @Autowired CommentService commentService;
	 * 
	 * @Autowired CommentRepository commentRepo;
	 * 
	 * @Autowired ReplyService replyService;
	 */
	@Autowired
	JobApplyRepository jaRepo;
	
	@Autowired
	JobApplyService jaService;
	

	@GetMapping(value = "/jobsList")
	public ResponseEntity<List<Jobs>> getJobs() {
		List<Jobs> allJobs = jobRepository.getAllJobs();
		return new ResponseEntity<>(allJobs, HttpStatus.OK);
	}

	/*
	 * @RequestMapping(value = "/incrementApply", method = RequestMethod.POST)
	 * public ResponseEntity<String> incrementApply(@RequestParam("jobId") Long
	 * jobId, HttpSession session) { Long userId = (Long)
	 * session.getAttribute("userId");
	 * 
	 * // Check if the user has already applied for this job if
	 * (jaService.registered(userId, jobId)) {
	 * 
	 * return ResponseEntity.badRequest().body("You already applied to this job.");
	 * }
	 * 
	 * // Fetch the job by jobId Jobs job =
	 * jobRepository.findById(jobId).orElse(null); if (job != null) {
	 * job.setUserApply(job.getUserApply() + 1); jobRepository.save(job); // Save
	 * the updated job
	 * 
	 * JobApply jobApply = new JobApply(); jobApply.setJobId(jobId);
	 * jobApply.setUserDetailsId(userId);
	 * jobApply.setDateApplied(java.time.LocalDate.now().toString());
	 * jobApply.setStatus("PENDING"); jaRepo.save(jobApply);
	 * 
	 * return ResponseEntity.ok("Apply incremented successfully."); } else { return
	 * ResponseEntity.badRequest().body("Job not found."); } }
	 */



	@GetMapping(value = "/notifications")
	public ResponseEntity<List<BulkEmail>> getMail() {
		List<BulkEmail> bulkMail = bmRepository.getAllMail();
		return new ResponseEntity<>(bulkMail, HttpStatus.OK);
	}
	
	@GetMapping(value = "/allPosts")
	public ResponseEntity<List<Posts>> getPosts() {
		List<Posts> userPosts = postRepo.getAllPosts();
		return new ResponseEntity<>(userPosts, HttpStatus.OK);
	}
	
	@PostMapping("/getPostId")
	public ResponseEntity<Long> getPostId(Long postId) {
		System.out.println("Received postId: " + postId);
	    return ResponseEntity.ok(postId);
	}
	
	/*
	 * @GetMapping("/allComments") public ResponseEntity<List<Comment>>
	 * getCommentsByPostId() { List<Comment> comments =
	 * commentService.getAllComments(); // Replace with your actual service method
	 * return new ResponseEntity<>(comments, HttpStatus.OK); }
	 * 
	 * @GetMapping("/allReply") public ResponseEntity<List<Reply>>
	 * getReplyByCommentId(@RequestParam Long commentId) { List<Reply> reply =
	 * replyService.getReplyByCommentId(commentId); // Replace with your actual
	 * service method return new ResponseEntity<>(reply, HttpStatus.OK); }
	 */
	
	@GetMapping("/pendingApplications")
	public ResponseEntity<List<JobApply>> getPendingApplications() {
	    List<JobApply> apply = jaRepo.getPendingAplication(); // Replace with your actual service method

	    return new ResponseEntity<>(apply, HttpStatus.OK);
	}
	
//	@GetMapping("/acceptedApplications")
//	public ResponseEntity<List<JobApply>> getAcceptedApplications(HttpSession session) {
//		Long userId = (Long) session.getAttribute("userId");
//		
//	    List<JobApply> apply = jaRepo.getAcceptedAplication(); // Replace with your actual service method
//	    
//	    
//	    return new ResponseEntity<>(apply, HttpStatus.OK);
//	}
	
	@GetMapping("/acceptedApplications")
	public ResponseEntity<List<JobApply>> getAcceptedApplications(HttpSession session) {
	    Long userId = (Long) session.getAttribute("userId");
	    
	    List<JobApply> allApplies = jaRepo.getAcceptedAplication(); // Replace with your actual service method
	    
	    List<JobApply> userApplies = new ArrayList<>();
	    
	    for (JobApply apply : allApplies) {
	        if (apply.getUserDetailsId().equals(userId)) {
	            userApplies.add(apply);
	        }
	    }
	    
	    return new ResponseEntity<>(userApplies, HttpStatus.OK);
	}


	
	@GetMapping("/declinedApplications")
	public ResponseEntity<List<JobApply>> getDeclinedApplications(HttpSession session) {
	    Long userId = (Long) session.getAttribute("userId");
	    
	    List<JobApply> allApplies = jaRepo.getDeclinedAplication(); // Replace with your actual service method
	    
	    List<JobApply> userApplies = new ArrayList<>();
	    
	    for (JobApply apply : allApplies) {
	        if (apply.getUserDetailsId().equals(userId)) {
	            userApplies.add(apply);
	        }
	    }
	    
	    return new ResponseEntity<>(userApplies, HttpStatus.OK);
	}
	
	@PostMapping("/updateApplicationStatus")
    public ResponseEntity<String> updateApplicationStatus(@RequestParam("applyId") Long applyId, @RequestParam("status") String status) {
        try {
            JobApply application = jaRepo.findById(applyId).orElse(null);
            if (application != null) {
                application.setStatus(status);
                jaRepo.save(application);
                return ResponseEntity.ok("Application status updated successfully.");
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating application status.");
        }
    }
}