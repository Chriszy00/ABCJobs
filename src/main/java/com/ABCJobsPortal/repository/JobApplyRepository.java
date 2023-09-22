package com.ABCJobsPortal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ABCJobsPortal.model.JobApply;

public interface JobApplyRepository extends JpaRepository<JobApply, Long>{
	
	@Query(value = "SELECT * FROM job_apply", nativeQuery = true)
	public List<JobApply> getAllAplication();
	
	@Query(value = "SELECT * FROM job_apply WHERE status = 'PENDING'", nativeQuery = true)
	public List<JobApply> getPendingAplication();
	
	@Query(value = "SELECT * FROM job_apply WHERE status = 'ACCEPT'", nativeQuery = true)
	public List<JobApply> getAcceptedAplication();
	
	@Query(value = "SELECT * FROM job_apply WHERE status = 'DECLINE'", nativeQuery = true)
	public List<JobApply> getDeclinedAplication();
	
	Optional<JobApply> findByUserDetailsIdAndJobId(Long userId, Long jobId);

}