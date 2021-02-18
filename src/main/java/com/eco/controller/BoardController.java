package com.eco.controller;

import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.eco.dto.BoardVO;
import com.eco.dto.MemberVO;
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
		String table = "notice";
		String orderName = "nseq";

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
		int count = boardService.getAllCount(table);
		paging.setTotalCount(count);
		paging.paging();
		List<BoardVO> noticeList = boardService.boardList(table, orderName, paging.getStartNum(), paging.getEndNum());
		
		mav.addObject("paging", paging);
			
		model.addAttribute("noticeList", noticeList);
		mav.setViewName("board/notice");
		
		return mav;
	}
	
	@RequestMapping("qnaList")
	public ModelAndView qnaList(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int page=1;
		String table = "adminQna";
		String orderName = "adqseq";
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
		int count = boardService.getAllCount(table);
		paging.setTotalCount(count);
		paging.paging();
		List<BoardVO> qnaList = boardService.boardList(table, orderName, paging.getStartNum(), paging.getEndNum());
		
		mav.addObject("paging", paging);
			
		model.addAttribute("qnaList", qnaList);
		mav.setViewName("board/qnaList");
		return mav;
	}
	
	@RequestMapping("myQnaList")
	public ModelAndView myQnaList (Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView();
		
		String table = "qna";
		String orderName = "qseq";
		if( mvo==null ) {	
			mav.setViewName("member/login");
			return mav;
		}else {
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
			int count = boardService.mygetAllCount(table, mvo.getUseq());
			paging.setTotalCount(count);
			paging.paging();
			
			mav.addObject("paging", paging);
			List<BoardVO> myboardList = boardService.myboardList(table, orderName, paging.getStartNum(), paging.getEndNum(), mvo.getUseq());	
			model.addAttribute("myboardList", myboardList);
			mav.setViewName("board/myQnaList");
			
			return mav;
		}
	}
	@RequestMapping("qnaWrite")
	public String qnaWrite (Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		model.addAttribute("useq", mvo.getUseq());
		return "board/qnaWrite";
	}
	
	@RequestMapping("qnaInsert")
	public String qnaWriteFrm (@ModelAttribute("bvo") @Valid BoardVO boardVo,
			BindingResult result, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		boardVo.setUseq(mvo.getUseq());
		System.out.println(boardVo.getUseq());
		if(result.getFieldError("title")!=null) {
			model.addAttribute("message", "제목을 입력하세요");
			return "board/qnaWrite";
		}else if(result.getFieldError("content")!=null) {
			model.addAttribute("message", "내용을 입력하세요");
			return "board/qnaWrite";
		}
		boardVo.setUseq(mvo.getUseq());
		boardService.qnaInsert(boardVo);
		return "redirect:myQnaList";
	}
	@RequestMapping("myQnaUpdateForm")
	public String myQnaUpdateFrom(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if( mvo==null ) return "member/login";
		String qseq = request.getParameter("qseq");
		
		List<BoardVO> bvoList = boardService.myQnaUpdateForm(qseq);
		model.addAttribute("bvoList", bvoList);
		return "board/myQnaUpdateForm";
	}
	@RequestMapping(value="myQnaUpdate", method = RequestMethod.POST)
	public String myQnaUpdate(@ModelAttribute("bvoList") @Valid BoardVO boardVo,
			BindingResult result, Model model, HttpServletRequest request) {
		String qseq = request.getParameter("qseq");
		if(result.getFieldError("title")!=null) {
			model.addAttribute("message", "제목을 입력하세요");
			return "board/myQnaUpdateForm";
		}else if(result.getFieldError("content")!=null) {
			model.addAttribute("message", "내용을 입력하세요");
			return "board/myQnaUpdateForm";
		}
		boardVo.setQseq(Integer.parseInt(request.getParameter("qseq")));
		boardVo.setTitle(request.getParameter("title"));
		boardVo.setContent(request.getParameter("content"));
		boardService.myQnaUpdate(boardVo.getQseq(), boardVo.getTitle(), boardVo.getContent());
		return "redirect:myQnaList";
	}
	@RequestMapping("myQnaDelete")
	public String myQnaDelete(Model model, HttpServletRequest request) {
		String qseq = request.getParameter("qseq");
		boardService.myQnaDelete(qseq);
		return "redirect:myQnaList";
	}
}
