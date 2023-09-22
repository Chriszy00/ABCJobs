package com.ABCJobsPortal.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "posts")
public class Posts {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "post_id")
	private Long postId;
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "created_by")
	private Long createdBy;
	
	@Column(name = "posted_by_firstname")
	private String postedByFirstName;
	
	@Column(name = "posted_by_lastname")
	private String postedByLastName;
	
	@Column(name = "heading")
	private String heading;
	
	@Column(name = "body")
	private String body;
	
	@Column(name = "created_at")
	private LocalDateTime createdAt;
	
	@Column(name = "time_since_posted")
	private String timeSincePosted;
	
	
	public Posts() {}

	public Posts(Long postId, String category, Long createdBy, String postedByFirstName, String postedByLastName,
			String heading, String body, LocalDateTime createdAt) {
		super();
		this.postId = postId;
		this.category = category;
		this.createdBy = createdBy;
		this.postedByFirstName = postedByFirstName;
		this.postedByLastName = postedByLastName;
		this.heading = heading;
		this.body = body;
		this.createdAt = createdAt;
	}

	public Long getPostId() {
		return postId;
	}

	public void setPostId(Long postId) {
		this.postId = postId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long createdBy) {
		this.createdBy = createdBy;
	}

	public String getPostedByFirstName() {
	    return postedByFirstName;
	}

	public void setPostedByFirstName(String postedByFirstName) {
	    this.postedByFirstName = postedByFirstName;
	}

	public String getPostedByLastName() {
	    return postedByLastName;
	}

	public void setPostedByLastName(String postedByLastName) {
	    this.postedByLastName = postedByLastName;
	}

	public String getHeading() {
		return heading;
	}

	public void setHeading(String heading) {
		this.heading = heading;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getTimeSincePosted() {
	    return timeSincePosted;
	}

	public void setTimeSincePosted(String timeSincePosted) {
	    this.timeSincePosted = timeSincePosted;
	}

}
