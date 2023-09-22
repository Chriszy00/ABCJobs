package com.ABCJobsPortal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCJobsPortal.model.Jobs;
import com.ABCJobsPortal.repository.JobRepository;

@Service
@Transactional
public class JobsService {

	@Autowired
	JobRepository jobRepository;

	public Jobs addJob(Jobs job) {
		return jobRepository.save(job);
	}

	public List<Jobs> getAllJobs() {
		return jobRepository.findAll();
	}

	public Jobs getJobsById(Long id) {
		return jobRepository.findById(id).get();
	}

	public List<Jobs> searchJobs(String query) {
		// You can customize this method based on your search criteria.
		// For simplicity, this example performs a basic search by job name or company
		// name.

		// Perform the search using the query
		List<Jobs> searchResults = jobRepository.findByJobNameContainingOrCompanyNameContaining(query, query);

		return searchResults;
	}
}
