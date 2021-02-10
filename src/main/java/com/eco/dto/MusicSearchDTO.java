package com.eco.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MusicSearchDTO extends DefaultSearchDTO {
	private static final long serialVersionUID = -6859111898623268561L;
	private int mseq;
	private int abseq;
	private int atseq;
	private int gseq;
	private String title;
	private String content;
	private String theme;
	private String titleyn;	
	private String src;
}