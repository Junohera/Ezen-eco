package com.eco.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class MemberVO {
	private int useq;
	@NotEmpty(message="4")
	private String id;
	@NotEmpty(message="5")
	private String pw;
	private String name;
	private String phone;
	private String gender;
	private String membership;
	private Timestamp indate;
}
