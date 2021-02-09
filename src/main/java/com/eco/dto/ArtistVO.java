package com.eco.dto;

import java.util.List;

import lombok.Data;

@Data
public class ArtistVO {
	private int atseq;
	private String name;
	private String groupyn;
	private String gender;
	private int gseq;
	private String img;
	private String description;

	private String genre;

	private List<AlbumVO> albumList;
}
