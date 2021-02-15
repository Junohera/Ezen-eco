package com.eco.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eco.dto.BoardVO;
import com.eco.dto.Paging;
import com.eco.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("introduce")
	public String introduce(Model model, HttpServletRequest request) {
		return "board/introduce";
	}
	
	
	@RequestMapping("notice")
	public ModelAndView notice(Model model, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int page=1;
		
		if( request.getParameter("first")!=null ) {
			session.removeAttribute("page");
		}
		if( request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if( session.getAttribute("page")!= null  ) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}
		Paging paging = new Paging();
		paging.setPage(page);
		int count = boardService.getAllCount();
		paging.setTotalCount(count);
		paging.paging();
		List<BoardVO> noticeList = boardService.noticeList(paging);
		
		mav.addObject("paging", paging);
			
		model.addAttribute("noticeList", noticeList);
		mav.setViewName("board/notice");
		
		return mav;
	}
	
	@RequestMapping("serviceCenter")
	public String serviceCenter(Model model, HttpServletRequest request) {
		return "board/serviceCenter";
	}
}
