package com.ABCJobsPortal.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "jobs")
public class Jobs {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name = "job_id")
	 private Long jobId;
	 
	 @Column(name = "company_name")
	 private String companyName;
	 
	 @Column(name = "job_name")
	 private String jobName;
	 
	 @Column(name = "job_description")
	 private String jobDesc;
	 
	 @Column(name = "job_type")
	 private String jobType;
	 
	 @Column(name = "workplace_type")
	 private String workplaceType;
	 
	 @Column(name = "salary")
	 private String salary;
	 
	 @Column(name = "location")
	 private String location;
	 
	 @Column(name = "date_posted")
	 private String datePosted;
	 
	 @Column(name = "posted_by")
	 private String postedBy;

	public Jobs() {
		super();
	}

	public Jobs(Long jobId, String companyName, String jobName, String jobDesc, String jobType, String workplaceType,
			String salary, String location, String datePosted, String postedBy) {
		super();
		this.jobId = jobId;
		this.companyName = companyName;
		this.jobName = jobName;
		this.jobDesc = jobDesc;
		this.jobType = jobType;
		this.workplaceType = workplaceType;
		this.salary = salary;
		this.location = location;
		this.datePosted = datePosted;
		this.postedBy = postedBy;
	}

	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getWorkplaceType() {
		return workplaceType;
	}

	public void setWorkplaceType(String workplaceType) {
		this.workplaceType = workplaceType;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(String datePosted) {
		this.datePosted = datePosted;
	}

	public String getPostedBy() {
		return postedBy;
	}

	public void setPostedBy(String postedBy) {
		this.postedBy = postedBy;
	}
	
}