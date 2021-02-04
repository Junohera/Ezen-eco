package com.eco.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int useq;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String gender;
	private String membership;
	private Timestamp indate;
}
