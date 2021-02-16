package com.eco.dto.search;

import java.io.Serializable;

import lombok.Data;

@Data
public class SearchDTO implements Serializable {
	
	private static final long serialVersionUID = 5427742420093436962L;

// 검색어 관련 
	/** 검색조건 select에서 고른 대상테이블 */
	private String searchTable = "";
	/** 검색조건 select에서 고른 검색대상컬럼 */
	private String searchCondition = "";
	/** 검색Keyword input:text에 입력한 검색어 */
	private String searchKeyword = "";
	/**
	 * ex 1) searchCondition과 searchKeyword 둘다 값이 있는경우, 검색조건 like '%검색어%'
	 * ex 2) searchCondition은 없고, searchKeyword 둘다 값이 있는경우, 모든 검색조건 or로 연결하면서 like '%검색어%'
	 * 
	 	
		<where> 조건들마다 and로 구분해서 맨앞이면 자동으로 없애줌.
			<choose>
				<when test='searchKeyword != null and searchKeyword != ""'> 검색어가 있을경우에는 미실행
					<choose>
						searchCondition 널이 아니고, searchCondition의 값이 "name"이면, name안에서 검색어 문자열 포함확인
						<when test='searchCondition != null and searchCondition == "name"'>and name like '%'||#{searchKeyword}||'%'</when>
						
						searchCondition 널이 아니고, searchCondition의 값이 "email"이면, email안에서 검색어 문자열 포함확인
						<when test='searchCondition != null and searchCondition == "email"'>and email like '%'||#{searchKeyword}||'%'</when>
						
						searchCondition 널이 아니고, searchCondition의 값이 "id"이면, id안에서 검색어 문자열 포함확인
						<when test='searchCondition != null and searchCondition == "id"'>and id like '%'||#{searchKeyword}||'%'</when>
						
						searchCondition 널이거나, searchCondition의 값이 ""이거나, 동일한게 없다면
						(name안에서 검색어 문자열 포함확인) or (email안에서 검색어 문자열 포함확인) or (id like '%'||#{searchKeyword}||'%')
						위의 경우중에 하나라도 맞으면 반환(=전체검색)
						<otherwise>
							and (
								name like '%'||#{searchKeyword}||'%'
								or email like '%'||#{searchKeyword}||'%'
								or id like '%'||#{searchKeyword}||'%'
							)
						</otherwise>
					</choose>
				</when>
			</choose>
		</where>
	 * 
	 */
// 검색어 관련 
	
// 정렬 관련
	private String searchFilter;
	/**
	 *  ex)
	 *  앨범발매일 오름차순 -> pdateAsc
	 *  앨범발매일 내림차순 -> pdateDesc
	 *  뮤직시퀀스 오름차순  -> mseqAsc
	 *  위의 경우가 없을 경우, 기본정렬은 otherwise에 기입
	 *  ORDER BY
			<choose>
					<when test='searchFilter != null and searchFilter == "pdateAsc"'>pdate asc</when>
					<when test='searchFilter != null and searchFilter == "pdateDesc"'>pdate desc</when>
					<when test='searchFilter != null and searchFilter == "mseqAsc"'>mseq asc</when>
					<otherwise>mseq desc</otherwise>
			</choose>
	 */
// 정렬 관련
	
	// 기본 페이지 사이즈(페이징이 아니라 on/off형태의 화면일때(더보기) off상태에 보여줄 최소 목록의 수
	private int firstSize = 100;

	private int page = 1;
	
	private String alert = "";
	
}