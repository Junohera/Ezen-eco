package com.eco.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Music {
	private int mseq;
	private int abseq;
	private int atseq;
	private int gseq;
	private String title;
	private String content;
	private String theme;
	private String titleyn;	
<<<<<<< HEAD
=======
	private String src;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

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
}
