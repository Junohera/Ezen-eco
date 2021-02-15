package com.eco.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {

	// qna 관련
	private int qseq;
	private int useq;
	private String title;
	// qna 댓글 관련
	private int qrseq;
	private int aseq;
	private String content;
	// 공지사항 관련
	private int nseq;
	private String ntitle;
	private String ncontent;
	private Timestamp notice_date;
}
