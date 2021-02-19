// package com.eco.exception;

// import lombok.Getter;

// public enum ErrorCode {
	
// 	NOT_NULL("ERROR0001", "원래는 NullPoint Exception 발생하는건데 감지해서 error로 온거에요!")
// 	, MIN_VALUE("ERROR0002", "숫자 최소값확인")
// 	, NOT_BLANK("ERROR0003", "문자열 NULL이거나 공백")
// 	, POSITIVE("ERROR0004", "양수인지 확인")
// 	, SIZE("ERROR0005", "특정길이 맞지않음.")
// 	, NOT_EMPTY("ERROR0006", "문자열 비어있음.")
// 	, EMAIL("ERROR0007", "이메일 형식 안맞음")
// 	, LENGTH("ERROR0008", "문자열 길이 맞지않음")
    
// 	;

//     @Getter
//     private String code;

//     @Getter
//     private String description;

//     ErrorCode(String code, String description) {
//         this.code = code;
//         this.description = description;
//     }
// }