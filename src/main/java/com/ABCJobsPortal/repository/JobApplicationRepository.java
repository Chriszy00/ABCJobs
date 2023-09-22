package com.ABCJobsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ABCJobsPortal.model.JobApplication;

@Repository
public interface JobApplicationRepository extends JpaRepository <JobApplication, Long> {

	List<JobApplication> findByUserId(String userId);
}
 