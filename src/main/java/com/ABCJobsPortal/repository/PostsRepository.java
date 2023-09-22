package com.ABCJobsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ABCJobsPortal.model.Posts;

@Repository
public interface PostsRepository extends JpaRepository<Posts, Long> {
	
	@Query(value = "SELECT * FROM post ORDER BY post_id DESC", nativeQuery = true)
	public List<Posts> getAllPosts();
	
	Posts findByPostId(Long postId);
}
