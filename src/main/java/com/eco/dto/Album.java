package com.eco.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class Album {
	private int abseq;
	private int atseq;
	private String title;
	private String img;
	private String content;
	private Timestamp pdate;

	private String name;
	private String groupyn;
	private String gender;
	private int atgseq;
	private String atimg;
	private String atgenre;
	private String description;
	
	private int useq;
}
