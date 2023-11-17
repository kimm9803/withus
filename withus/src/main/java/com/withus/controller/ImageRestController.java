package com.withus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.withus.mapper.ImageMapper;

@RestController
@RequestMapping("/image")
public class ImageRestController {
	
	
	@Autowired
	private ImageMapper imageMapper;
	
	// 이미지삭제
	@Secured("ROLE_USER")
	@GetMapping("/delete/{gno}")
	public void delete(@PathVariable("gno") int gno) {		
		imageMapper.deleteImage(gno);
	}

	

}
