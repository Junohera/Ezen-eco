package com.eco.dto.search;

import java.io.Serializable;

import com.eco.dto.Paging;

import lombok.Data;

@Data
public class SearchDTO implements Serializable {
	
	private static final long serialVersionUID = 5427742420093436962L;
	
	private String selectedTab = "";
	private String selectedType = "";
	private int selectedSeq;
	
	private String searchTable = "";
	private String searchCondition = "";
	private String searchKeyword = "";
	private String searchFilter = "";
	private int page = 1;
	
	private Paging paging;
}