package com.withus.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.withus.domain.ImageVo;
import com.withus.mapper.ImageMapper;
import com.withus.service.ImageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ImageController {
	@Autowired
    private final ImageService imageService;
	@Autowired
	private ImageMapper imageMapper;

	//upload 페이지
	@Secured("ROLE_USER")
    @GetMapping("/upload")
    public String upload() {
        return "upload";
    }
	
    //이미지 등록
	@Secured("ROLE_USER")
    @PostMapping("/upload/{gno}")
    public String uploadImage(@RequestParam MultipartFile image, @PathVariable("gno") int gno) throws IllegalStateException, IOException{
        imageService.insertImage(image,gno);       
        return "redirect:/groups/view/" + gno;
    }
    //이미지 수정
	@Secured("ROLE_USER")
    @PostMapping("/modify/{gno}")
    public String modifyImage(@RequestParam MultipartFile image, @RequestParam int gno) throws IllegalStateException, IOException{
    	
        imageService.modifyImage(image,gno);
        return "redirect:/groups/view/" + gno;
    }
    //이미지 출력
	@Secured("ROLE_USER")
    @GetMapping("/image/{imageId}")
    public String displayImage(@PathVariable("imageId") int imageId, Model model) {    	
        ImageVo image = imageMapper.getImageById(imageId);        
        model.addAttribute("image", image);
        return "imagedisplay"; // 이미지를 표시할 뷰 페이지 이름
    }
    //이미지 삭제
	@Secured("ROLE_USER")
    @GetMapping("/delete/{imageId}")
    public String deleteImage(@PathVariable("imageId") int imageId) {
    	imageMapper.delete(imageId);
    	return "home";
    }
}
