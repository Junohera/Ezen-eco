package com.eco.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eco.dto.MemberVO;
import com.eco.dto.Music;
import com.eco.dto.Paging;
import com.eco.service.AdminService;
import com.eco.service.MemberService;
import com.eco.service.MusicService;

@Controller
public class AdminController {

	@Autowired
	AdminService as;
	
	@Autowired
	MusicService ps;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	MemberService ms;
	
	
	
	
	
	@RequestMapping("adminMemberDetail")
	public ModelAndView adminMemberDetail(HttpServletRequest request, 
			@RequestParam("useq") String useq) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO mvo = as.getMember(useq);
		mav.addObject("memberVO", mvo);
		mav.setViewName("admin/adminMemberDetail");
		return mav;
	}
	
	
	@RequestMapping("MemberManage")
	public ModelAndView MemberManage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("adminId");
		int page=1;
		if(id==null)
			mav.setViewName("redirect:/admin");
		else {
			if( request.getParameter("first")!=null ) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			String key = "";
			if( request.getParameter("key") != null ) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			} else if( session.getAttribute("key")!= null ) {
				key = (String)session.getAttribute("key");
			} else {
				session.removeAttribute("key");
				key = "";
			} 
			if( request.getParameter("page") != null ) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if( session.getAttribute("page")!= null ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("member", "name", key);
			paging.setTotalCount(count);
			paging.paging();
			List<MemberVO> memberList = as.listMember(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("memberList", memberList);
			mav.setViewName("admin/MemberManage");
		}
		return mav;
	}
	
	
	@RequestMapping("MusicManage")
	public ModelAndView MusicManage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("adminId");
		int page=1;
		if(id==null)
			mav.setViewName("redirect:/admin");
		else {
			if( request.getParameter("first")!=null ) {
				session.removeAttribute("page");
				session.removeAttribute("key");
			}
			String key = "";
			if( request.getParameter("key") != null ) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			} else if( session.getAttribute("key")!= null ) {
				key = (String)session.getAttribute("key");
			} else {
				session.removeAttribute("key");
				key = "";
			} 
			if( request.getParameter("page") != null ) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if( session.getAttribute("page")!= null ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getMusicCount("music", "title", key);
			paging.setTotalCount(count);
			paging.paging();
			List<Music> musicList = as.listMusic(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("musicList", musicList);
			mav.setViewName("admin/MusicManage");
		}
		return mav;
	}
	
	
	@RequestMapping("/admin")
	public String adminIndex(Model model, HttpServletRequest request) {
		return "admin/adminLogin";
	}
	
	@RequestMapping("adminLogin")
	public ModelAndView admin_login(Model model, HttpServletRequest request,
			@RequestParam("adminId") String adminId, 
			@RequestParam("adminPw") String adminPw){
		ModelAndView mav = new ModelAndView();
		int result = as.adminCheck(adminId, adminPw);
		if(result==1) {
			HttpSession session=request.getSession();
			session.setAttribute("adminId", adminId);
			mav.setViewName("admin/AIndex");
		}else if(result==0) {
			mav.addObject("message", "비밀번호를 확인하세요");
			mav.setViewName("admin/adminLogin");
		}else if(result==-1) {
			mav.addObject("message", "아이디를 확인하세요");
			mav.setViewName("admin/adminLogin");
		}
		return mav;
	}
}
