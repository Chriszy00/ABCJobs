package com.ABCJobsPortal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCJobsPortal.model.Jobs;
import com.ABCJobsPortal.repository.JobRepository;

@Service
@Transactional
public class JobService {
	@Autowired
	JobRepository jobRepository;
	
	public Jobs addJob(Jobs job) {
		return jobRepository.save(job);
	}
	
	public List<Jobs> getAllJobs() {
		return jobRepository.getAllJobs();
	}

}
