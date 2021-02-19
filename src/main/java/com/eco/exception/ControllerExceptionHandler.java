// package com.eco.exception;

// import java.lang.reflect.InvocationTargetException;

// import javax.servlet.http.HttpServletRequest;

// import org.springframework.validation.BindingResult;
// import org.springframework.web.bind.MethodArgumentNotValidException;
// import org.springframework.web.bind.annotation.ExceptionHandler;
// import org.springframework.web.bind.annotation.RestControllerAdvice;
// import org.springframework.web.servlet.ModelAndView;

// @RestControllerAdvice
// public class ControllerExceptionHandler {
	
	
// 	@ExceptionHandler(Exception.class)
// 	public ModelAndView allError(Exception e, HttpServletRequest request) {
// 		System.out.printf("### Exception url:{%s}, trace:{%s}",request.getRequestURI(), e.getStackTrace());
// 		ModelAndView mv = new ModelAndView();
// 		mv.addObject("error", e);
// 		mv.setViewName("error/error");
// 		return mv;
// 	}
	
// 	@ExceptionHandler({IllegalAccessException.class, InvocationTargetException.class})
// 	public ModelAndView errorBymultiToObject(Exception e, HttpServletRequest request) {
// 		System.out.printf("### Exception url:{%s}, trace:{%s}",request.getRequestURI(), e.getStackTrace());
// 		ModelAndView mv = new ModelAndView();
// 		mv.addObject("error", e);
// 		mv.setViewName("error/error");
// 		return mv;
// 	}
	
// 	@ExceptionHandler(MethodArgumentNotValidException.class)
// 	public ModelAndView validError(MethodArgumentNotValidException e, HttpServletRequest request) {
// 		System.out.printf("### @Valid에 맞지않는 값이 존재합니다. ### \n 요청 url:{%s} \n 에러내용 :trace:{%s}\n### @Valid에 맞지않는 값이 존재합니다. ###",request.getRequestURI(), e.getStackTrace());
// 		ModelAndView mv = new ModelAndView();
		
// 		ErrorResponse errorResponse = makeErrorResponse(e.getBindingResult());
// 		mv.addObject("error", errorResponse);
// 		mv.setViewName("error/error");
// 		return mv;
// 	}
	
// 	private ErrorResponse makeErrorResponse(BindingResult bindingResult){
//         String code = "";
//         String description = "";
//         String detail = "";

//         //에러가 있다면
//         if(bindingResult.hasErrors()){
//             //DTO에 설정한 meaasge값을 가져온다
//             detail = bindingResult.getFieldError().getDefaultMessage();

//             //DTO에 유효성체크를 걸어놓은 어노테이션명을 가져온다.
//             String bindResultCode = bindingResult.getFieldError().getCode();
//             System.out.println("System.out.println(bindResultCode);");
//             System.out.println(bindResultCode);
//             switch (bindResultCode){
//                 case "NotNull":
//                     code = ErrorCode.NOT_NULL.getCode();
//                     description = ErrorCode.NOT_NULL.getDescription();
//                     break;
//                 case "Min":
//                     code = ErrorCode.MIN_VALUE.getCode();
//                     description = ErrorCode.MIN_VALUE.getDescription();
//                     break;
//                 case "NotBlank":
//                 	code = ErrorCode.NOT_BLANK.getCode();
//                     description = ErrorCode.NOT_BLANK.getDescription();
//                     break;
//                 case "NotEmpty":
//                 	code = ErrorCode.NOT_EMPTY.getCode();
//                     description = ErrorCode.NOT_EMPTY.getDescription();
//                     break;
//                 case "Positive":
//                 	code = ErrorCode.POSITIVE.getCode();
//                     description = ErrorCode.POSITIVE.getDescription();
//                     break;
//                 case "Size":
//                 	code = ErrorCode.SIZE.getCode();
//                     description = ErrorCode.SIZE.getDescription();
//                     break;
//                 case "Email":
//                 	code = ErrorCode.EMAIL.getCode();
//                     description = ErrorCode.EMAIL.getDescription();
//                     break;
//                 case "Length":
//                 	code = ErrorCode.LENGTH.getCode();
//                     description = ErrorCode.LENGTH.getDescription();
//                     break;
//             }
//         }

//         return new ErrorResponse(code, description, detail);
//     }
	
// }
