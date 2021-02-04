package com.eco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eco.dto.MemberVO;
import com.eco.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;
	
	@RequestMapping("/loginForm")
	public String login_form(Model model, HttpServletRequest request) {
		return "member/login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@ModelAttribute("dto") @Valid MemberVO membervo, 
			BindingResult result, Model model, HttpServletRequest request) {
		if(result.getFieldError("id")!=null) {
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
			return "member/login";
		}else if(result.getFieldError("pw")!=null) {
			model.addAttribute("message", result.getFieldError("pw").getDefaultMessage());
			return "member/login";
		}
		
		MemberVO mvo = ms.getMember(membervo.getId());
		if(mvo!=null) {
			if(mvo.getPw()!=null) {
				if(mvo.getPw().equals(membervo.getPw())) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", mvo);
					return "redirect:/";
				}else {
					model.addAttribute("message", "입력한 비밀번호가 일치하지 않습니다");
					return "member/login";
				}
			}else {
				model.addAttribute("message", "비밀번호를 입력하세요");
				return "member/login";
			}
		}else {
			model.addAttribute("message", "ID를 입력하세요");
			return "member/login";
		}
	}
	
	@RequestMapping("logout")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	@RequestMapping("contract")
	public String contract(Model model, HttpServletRequest request) {
		return "member/contract";
	}
	
	@RequestMapping(value="joinForm", method=RequestMethod.POST)
	public String joinForm(Model model, HttpServletRequest request) {
		return "member/joinForm";
	}
	
	@RequestMapping("idCheckForm")
	public String id_check_form(Model model, HttpServletRequest request,
			@RequestParam("id") String id) {
		MemberVO mvo = ms.getMember(id);
		int result = 0;
		if(mvo==null)	result=-1;
		else result=1;
		
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		return "member/idCheck";
	}
	
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(@ModelAttribute("dto") @Valid MemberVO membervo,
			BindingResult result, Model model, HttpServletRequest request) {
		MemberVO mvo = new MemberVO();
		
		if(result.getFieldError("id")!=null) {
			model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
			model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}else if(result.getFieldError("pwd")!=null) {
			model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
			model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}else if(result.getFieldError("name")!=null) {
			model.addAttribute("message", result.getFieldError("name").getDefaultMessage());
			model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}else if(result.getFieldError("email")!=null) {
			model.addAttribute("message", result.getFieldError("email").getDefaultMessage());
			model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}else if(!request.getParameter("reid").equals(membervo.getId())) {
			model.addAttribute("message", "아이디 중복검사를 실행해주세요");
			//model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}else if(!request.getParameter("pwdCheck").equals(membervo.getPw())){
			model.addAttribute("message", "입력하신 비밀번호가 일치하지 않습니다");
			model.addAttribute("reid", request.getParameter("reid"));
			return "member/joinForm";
		}
		ms.insertMember(membervo);
		return "member/login";
	}
	
	@RequestMapping("resetPw")
	public String certificationNum(Model model, HttpServletRequest request,
			@RequestParam("id") String id, @RequestParam("pw") String pw ) {
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPw( pw );
		ms.resetPw(mvo);
		return "member/resetPwComplete";
	}
	
	
	
	
	
	// 아이찾기 인증번호 확인
	@RequestMapping("findIdCertificationNum")
	public String certificationNum(Model model, HttpServletRequest request,
			@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("id") String id, @RequestParam("inputNum") String inputNum) {
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setName(name);
		mvo.setPhone(phone);
		if(inputNum.equals("0000")) {
			model.addAttribute("member", mvo);
			return "member/viewId";
		}else {
			return "member/findId_CertificationNumber";
		}
	}
	
	// 비밀번호 찾기 인증번호 확인
	@RequestMapping("findPwCertificationNum")
	public String findPwCertificationNum(Model model, HttpServletRequest request,
			@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("id") String id, @RequestParam("inputNum") String inputNum) {
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setName(name);
		mvo.setPhone(phone);
		model.addAttribute("member", mvo);
		if(inputNum.equals("0000")) 
			return "member/resetPassword";
		else 
			return "member/findPw_CertificationNumber";
	}
	
	//아이디 찾기_이름 전화번호 검색
	@RequestMapping("lookupNamePhone")
	public String lookupNamePhone(Model model, HttpServletRequest request,
			@RequestParam("name") String name, @RequestParam("phone") String phone ) {
		MemberVO mvo = ms.confirmNamePhone(name, phone);
		if(mvo==null) {
			model.addAttribute("msg", "이름과 전화번호가 일치하는 회원이 없습니다");
			model.addAttribute("name", name);
			model.addAttribute("phone", phone);
			return "member/findIdForm";
		}else {
			model.addAttribute("member", mvo);
			return "member/findId_CertificationNumber";
		}
		
	}
	//비밀번호 찾기_아이디, 이름 전화번호 검색
	@RequestMapping("lookupIdNamePhone")
	public String lookupIdNamePhone(Model model, HttpServletRequest request,
			@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("id") String id) {
		MemberVO mvo = ms.confirmIdNamePhone(id, name, phone);
		if(mvo==null) {
			model.addAttribute("msg", "이름과 전화번호가 일치하는 회원이 없습니다");
			model.addAttribute("id", id);
			model.addAttribute("name", name);
			model.addAttribute("phone", phone);
			return "member/findIdForm";
		}else {
			model.addAttribute("member", mvo);
			return "member/findPw_CertificationNumber";
		}
	}
	
	// 아이디 찾기_이름, 전화번호 입력창으로 이동
	@RequestMapping("findIdForm")
	public String find_id_form(Model model, HttpServletRequest request) {
		return "member/findIdForm";
	}
	
	// 비번 찾기_아이디, 이름, 전화번호 입력창으로 이동
	@RequestMapping("findPwForm")
	public String findPwForm(Model model, HttpServletRequest request) {
		return "member/findPwForm";
	}
	
		
	// 팝업창 최초
	@RequestMapping("findIdPw")
	public String find_id_pw(Model model, HttpServletRequest request) {
		return "member/findIdPwForm";
	}
	
}
