package com.eco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eco.admin.service.IAdminService;
import com.eco.admin.service.IMemberManageService;
import com.eco.dao.ICountDao;
import com.eco.dto.MemberVO;
import com.eco.dto.Paging;

@Controller
public class MemberManageController {

	@Autowired
	IAdminService as;
	
	@Autowired
	IMemberManageService memberManageService;
	
	@Autowired
	ICountDao countDao;
	
	@RequestMapping("adminMemberDetail")
	public ModelAndView adminMemberDetail(HttpServletRequest request, 
			@RequestParam("useq") String useq) {
		
		ModelAndView mav = new ModelAndView();
		MemberVO mvo = memberManageService.getMember(useq);
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
			} else if( session.getAttribute("page")!= null) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			
			Paging paging = new Paging();
			paging.setPage(page);
			int count = countDao.getAllCount("member", "name", key);
			paging.setTotalCount(count);
			paging.paging();
			List<MemberVO> memberList = memberManageService.listMember(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("memberList", memberList);
			mav.setViewName("admin/MemberManage");
		}
		return mav;
	}
}
