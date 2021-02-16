package com.eco.dto.search;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BrowseSearchDTO extends SearchDTO {
	private static final long serialVersionUID = 1542641227821907510L;
	
	private String selectedType; // 선택한 타입
	private int selectedSeq;	 // 선택한 타입의 시퀀스
	
	public BrowseSearchDTO() {
		if (this.getSelectedType() == null) {
			this.setSelectedType("chart");
		}
		if (this.getSelectedSeq() == 0) {
			this.setSelectedSeq(1); // 원래는 DB의 시퀀스여야하지만 첫번째차트는 반드시 1로 등록하는 경우를 가정하에 1로 하드코딩
		}
	}
}