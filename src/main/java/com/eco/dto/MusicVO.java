package com.eco.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MusicVO {
	private int mseq;
	private int abseq;
	private int atseq;
	private int gseq;
	private String title;
	private String content;
	private String theme;
	private String titleyn;	
	private String src;

	private String abtitle;
	private String abimg;
	private String abcontent;
	private Timestamp pdate;
	private String name;
	private String groupyn;
	private String gender;
	private int atgseq;
	private String atimg;
	private String description;
	private String gtitle;
	
	private int useq;
}
