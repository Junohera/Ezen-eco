package com.eco.dto.search;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ArtistSearchDTO extends SearchDTO {
	private static final long serialVersionUID = 1542641227821907510L;
	
	private String tab;

	private int atseq;
	private int abseq;
	private int mseq;
	private int tseq;
	private int cseq;
	private int gseq;
	
	public ArtistSearchDTO() {
		if (this.getTab() == null) {
			this.setTab("track"); // 기본탭은 지정 
		}
		
		if (this.getSearchFilter() == null) {
			
		}
	}
}