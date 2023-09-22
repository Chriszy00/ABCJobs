package com.ABCJobsPortal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCJobsPortal.model.JobApplication;
import com.ABCJobsPortal.repository.JobApplicationRepository;

@Service
@Transactional
public class JobApplicationService {

	@Autowired
	JobApplicationRepository jobAppRepository;
	
	public JobApplication apply(JobApplication jApp) {
		return jobAppRepository.save(jApp);
	}
	
	public List<JobApplication> getAllJobApplications() {
		return jobAppRepository.findAll();
	}
	
	public List<JobApplication> findByUserId(String id) {
		return jobAppRepository.findByUserId(id);
	}
	
	public JobApplication getJobApplicationById(Long id) {
		return jobAppRepository.findById(id).get();
	}
}

