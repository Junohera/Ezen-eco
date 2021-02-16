package com.eco.dto;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ArtistVO {
	private int atseq;
	
	@NotBlank(message="name")
	private String name;
	
	@NotBlank(message = "group")
	@Size(min=1, max=1, message = "group")
	private String groupyn;
	
	@NotBlank(message = "gender")
	@Size(min=1, max=1, message = "gender")
	private String gender;
	
	@Positive(message = "genre")
	private int gseq;
	
	private String img;
	private String oldimg;
	private String imglink;
	private String description;
	
	private int rank;
	private int likecount;

	private String atgenre;
	private int rn;

	private List<AlbumVO> albumList;
	private int albumcount;
}
