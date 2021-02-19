package com.eco.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class BoardVO {
	//테이블 : test,  vo : test  = 스프링이 알아서 변환 or 테이블 : test_avl,  vo : testAvl   = 스프링이 알아서 변환  xml 
	// 자주 묻는 qna (adminQna) 관련 210215 추가
	private int adqseq;
	private Timestamp adQna_date;
	// 1:1 qna 관련 (Qna)
	private int qseq;
	private int useq;
	@NotEmpty(message="제목을 입력하세요")
	private String title;
	private Timestamp qna_date; //210215 추가
	// qna 댓글 관련
	private int qrseq;
	private int aseq;
	private String replycontent;
	@NotEmpty(message="내용을 입력하세요")
	private String qnacontent;
	// 공지사항 관련
	private int nseq;
	@NotEmpty(message="제목을 입력하세요")
	private String ntitle;
	@NotEmpty(message="내용을 입력하세요")
	private String ncontent;
	private Timestamp notice_date;
}
