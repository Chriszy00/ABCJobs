package com.ABCJobsPortal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="job_apply")
public class JobApply {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "apply_id")
	private Long applyId;
	
	
	@Column(name = "user_details_id")
	private Long userDetailsId;
	
	@Column(name = "job_id")
	private Long jobId;
	
	@Column(name = "date_applied")
	private String dateApplied;
	
	@Column(name = "status", nullable = false, columnDefinition = "VARCHAR(45) DEFAULT 'PENDING'")
	private String status;

	@OneToOne(optional=false)
	@JoinColumn(name = "user_details_id", referencedColumnName = "user_details_id", insertable=false, updatable=false)
	private UserDetails user;
	
	@ManyToOne
	@JoinColumn(name = "job_id", referencedColumnName = "job_id", insertable=false, updatable=false)
	private Jobs job;
	
	public JobApply() {

	}

	public JobApply(Long applyId, Long userDetailsId, Long jobId, String dateApplied, UserDetails user, Jobs job, String status) {
		super();
		this.applyId = applyId;
		this.userDetailsId = userDetailsId;
		this.jobId = jobId;
		this.dateApplied = dateApplied;
		this.status = status;
		this.user = user;
		this.job = job;
	}

	public Long getApplyId() {
		return applyId;
	}

	public void setApplyId(Long applyId) {
		this.applyId = applyId;
	}

	public Long getUserDetailsId() {
		return userDetailsId;
	}

	public void setUserDetailsId(Long userDetailsId) {
		this.userDetailsId = userDetailsId;
	}

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public String getDateApplied() {
		return dateApplied;
	}

	public void setDateApplied(String dateApplied) {
		this.dateApplied = dateApplied;
	}

	public UserDetails getUser() {
		return user;
	}

	public void setUser(UserDetails user) {
		this.user = user;
	}

	public Jobs getJob() {
		return job;
	}

	public void setJob(Jobs job) {
		this.job = job;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
