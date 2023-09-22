package com.ABCJobsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ABCJobsPortal.model.Jobs;


@Repository
public interface JobRepository extends JpaRepository<Jobs, Long>{
	
	@Query(value = "SELECT * FROM jobs", nativeQuery = true)
	public List<Jobs> getAllJobs();
	
	@Query(value = "SELECT * FROM jobs"
	        + " WHERE company_name LIKE %:key%"
	        + " OR job_name LIKE %:key%"
	        + " OR job_type LIKE %:key%"
	        + " OR workplace_type LIKE %:key%"
	        + " OR location LIKE %:key%"
	        + " OR posted_by LIKE %:key%", nativeQuery = true)
	List<Jobs> searchByKey(@Param("key") String key);
	
	List<Jobs> findByJobNameContainingOrCompanyNameContaining(String jobName, String companyName);


}
