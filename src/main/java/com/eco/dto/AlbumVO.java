package com.eco.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlbumVO {
	private int abseq;
	private int atseq;
	private String title;
	private String img;
	private String content;
	private String abtype;
	private int gseq;
	private Timestamp pdate;

	private String abgenre;
	private String name;
	private String groupyn;
	private String gender;
	private int atgseq;
	private String atgenre;
	private String atimg;
	private String description;
	
	private int useq;
}
