package com.ABCJobsPortal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "job_application")
public class JobApplication {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "job_application_id")
	private Long jobApplicationId;
	
	@Column(name = "job_id")
	private String jobid;
	
	@Column(name = "user_id")
	private String userId;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "resume")
	private String resume;

	@Column(name = "date_applied")
	private String dateApplied;

	public JobApplication() {
		super();
	}

	public JobApplication(Long jobApplicationId, String jobid, String userId, String status, String resume,
			String dateApplied) {
		super();
		this.jobApplicationId = jobApplicationId;
		this.jobid = jobid;
		this.userId = userId;
		this.status = status;
		this.resume = resume;
		this.dateApplied = dateApplied;
	}

	public Long getJobApplicationId() {
		return jobApplicationId;
	}

	public void setJobApplicationId(Long jobApplicationId) {
		this.jobApplicationId = jobApplicationId;
	}

	public String getJobid() {
		return jobid;
	}

	public void setJobid(String jobid) {
		this.jobid = jobid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getDateApplied() {
		return dateApplied;
	}

	public void setDateApplied(String dateApplied) {
		this.dateApplied = dateApplied;
	}
}

