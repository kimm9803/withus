package com.withus.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.withus.domain.ImageVo;

@Mapper
public interface ImageMapper {

	void save(@Param("imageVo")ImageVo imageVo, @Param("gno")int gno);

	ImageVo getImageById(int imageId);

	void modify(@Param("imageVo") ImageVo imageVo, @Param("gno") int gno);

	void delete(int imageId);

}
