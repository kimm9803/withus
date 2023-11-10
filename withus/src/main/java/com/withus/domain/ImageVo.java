package com.withus.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ImageVo {
	private int gimageid;
    private String originImageName;
    private String newImageName;
    private String imagePath;
    private int gno;
	
	 @Builder
	    public ImageVo(String originImageName, String newImageName, String imagePath) {
	        this.originImageName = originImageName;
	        this.newImageName = newImageName;
	        this.imagePath = imagePath;
	    }
}
