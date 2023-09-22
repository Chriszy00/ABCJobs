package com.ABCJobsPortal.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ABCJobsPortal.model.Posts;
import com.ABCJobsPortal.repository.PostsRepository;

@Service
@Transactional
public class PostService {
	
	@Autowired
	PostsRepository postRepo;
	
	public Posts addPost(Posts post) {
		return postRepo.save(post);
	}
	
	/*
	 * public List<Posts> getAllPosts() { return postRepo.getAllPosts(); }
	 */
	
	public Posts createPost(Posts post) {
		return postRepo.save(post);
	}
	
	public List<Posts> getAllPosts() {
		return postRepo.findAll();
	}
	
	public Posts getPostById(Long id) {
		return postRepo.findById(id).get();
	}


}
