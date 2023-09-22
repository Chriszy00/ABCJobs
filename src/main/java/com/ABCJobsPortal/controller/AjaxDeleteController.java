package com.ABCJobsPortal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ABCJobsPortal.model.Jobs;
import com.ABCJobsPortal.repository.JobApplyRepository;
import com.ABCJobsPortal.repository.JobRepository;

@RestController
@RequestMapping(value = "/delete")
public class AjaxDeleteController {
	@Autowired
	JobRepository jobRepository;
	
	@Autowired
	JobApplyRepository jaRepo;
	
	@DeleteMapping("/deleteJob/{jobId}")
	public ResponseEntity<String> deleteJob(@PathVariable Long jobId) {
	    // Fetch the job by jobId
	    Jobs job = jobRepository.findById(jobId).orElse(null);
	    
//	    List<JobApply> allApplies = jaRepo.getAllAplication();
//	    List<JobApply> sameJobId = new ArrayList<>();
//	    
//	    for (JobApply deleteJobApply : allApplies) {
//	        if (deleteJobApply.getUserDetailsId() == job) {
//	            sameJobId.add(deleteJobApply);
//	        }
//	    }
//	    
//	    jaRepo.deleteAll(sameJobId);
	    jobRepository.delete(job);
	    
	    return ResponseEntity.ok("Job and associated JobApply records deleted successfully.");
	}
}
