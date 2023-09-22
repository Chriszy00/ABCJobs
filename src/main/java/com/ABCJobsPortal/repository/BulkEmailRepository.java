package com.ABCJobsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ABCJobsPortal.model.BulkEmail;
@Repository
public interface BulkEmailRepository extends JpaRepository<BulkEmail, Long> {

	@Query(value = "SELECT * FROM bulk_email", nativeQuery = true)
	public List<BulkEmail> getAllMail();
}
