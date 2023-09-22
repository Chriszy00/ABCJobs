package com.ABCJobsPortal.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCJobsPortal.model.JobApply;
import com.ABCJobsPortal.repository.JobApplyRepository;

@Service
@Transactional
public class JobApplyService {
	@Autowired
	JobApplyRepository jaRepo;
	
	public List<JobApply> getAllAplication() {
		return jaRepo.getAllAplication();
	}
	
	public boolean registered(Long userId, Long jobId) {
	    try {
	        // Check if there is a matching entry in the repository
	        Optional<JobApply> jobApply = jaRepo.findByUserDetailsIdAndJobId(userId, jobId);
	        return jobApply.isPresent(); // Return true if an entry is found
	    } catch (Exception e) {
	        System.out.println(e);
	        return false; // Return false in case of an exception
	    }
	}

}
