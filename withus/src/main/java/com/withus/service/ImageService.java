package com.withus.service;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.withus.domain.ImageVo;
import com.withus.mapper.ImageMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageService {
    private final ImageMapper imageMapper;

    public void insertImage(MultipartFile image, int gno) throws IllegalStateException, IOException {
        // 파일이 빈 것이 들어오면 메서드 종료
        if (image.isEmpty()) {
            return;
        }

        // 저장할 파일 경로 지정
        String absolutePath = "c:\\upload";

        // 확장자 추출
        String originalImageExtension = null;
        String contentType = image.getContentType();
        if (contentType.contains("image/jpeg")) {
            originalImageExtension = ".jpg";
        } else if (contentType.contains("image/png")) {
            originalImageExtension = ".png";
        } else if (contentType.contains("image/gif")) {
            originalImageExtension = ".gif";
        }

        // 규칙적인 파일 이름 생성
        String newImageName = generateFileName(originalImageExtension);

        // Vo에 담기
        ImageVo imageVo = ImageVo.builder()
                .originImageName(image.getOriginalFilename())
                .newImageName(newImageName)
                .imagePath(absolutePath)
                .build();

        // Mapper 실행
        imageMapper.save(imageVo,gno);        

        // 파일을 전송하기
        File file = new File(absolutePath + "\\" + newImageName); // 슬래시를 역슬래시로 변경
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        image.transferTo(file);
    }
    // 이미지 저장 형식
    private String generateFileName(String fileExtension) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String formattedDate = dateFormat.format(new Date());

        return "image_" + formattedDate + fileExtension;
    }
    // 이미지 수정
	public void modifyImage(MultipartFile image, int gno) throws IllegalStateException, IOException {
		 if (image.isEmpty()) {
	            return;
	        }

	        // 저장할 파일 경로 지정
	        String absolutePath = "c:\\upload";

	        // 확장자 추출
	        String originalImageExtension = null;
	        String contentType = image.getContentType();
	        if (contentType.contains("image/jpeg")) {
	            originalImageExtension = ".jpg";
	        } else if (contentType.contains("image/png")) {
	            originalImageExtension = ".png";
	        } else if (contentType.contains("image/gif")) {
	            originalImageExtension = ".gif";
	        }

	        // 규칙적인 파일 이름 생성
	        String newImageName = generateFileName(originalImageExtension);

	        // Vo에 담기
	        ImageVo imageVo = ImageVo.builder()
	                .originImageName(image.getOriginalFilename())
	                .newImageName(newImageName)
	                .imagePath(absolutePath)
	                .build();

	        // Mapper 실행	        
	        imageMapper.modify(imageVo,gno);

	        // 파일을 전송하기
	        File file = new File(absolutePath + "\\" + newImageName); // 슬래시를 역슬래시로 변경
	        if (!file.getParentFile().exists()) {
	            file.getParentFile().mkdirs();
	        }
	        image.transferTo(file);
		
	}
}
