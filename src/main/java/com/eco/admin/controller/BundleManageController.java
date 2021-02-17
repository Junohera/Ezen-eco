package com.eco.admin.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.eco.admin.service.IAdminService;
import com.eco.admin.service.IBundleManageService;
import com.eco.dao.ICountDao;
import com.eco.dto.BundleVO;
import com.eco.dto.Paging;

@Controller
public class BundleManageController {

	
	@Autowired
	IAdminService adminService;
	
	@Autowired
	IBundleManageService bundleManageService;
	
	@Autowired
	ICountDao countDao;
	
	@RequestMapping("bundleManageList")
	public String bundleManageList(HttpServletRequest request, Model model) {
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		// 검색조건 체크
		int page=1;
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
		} else if( session.getAttribute("page")!= null  ) {
			page = (int) session.getAttribute("page");
		} else {
			page = 1;
			session.removeAttribute("page");
		}

		// 검색조건 - 페이징
		Paging paging = new Paging();
		paging.setPage(page);
		int count = countDao.getAllCount("bundle_master", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		// 검색조건기반 조회
		List<BundleVO> bundleList = bundleManageService.list(paging, key);

		// 페이지내에 필요값 저장
		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("bundleList", bundleList);
		
		return "admin/bundleManageList";
	}

	
	@RequestMapping(value = "bundleManageInsertForm", method = RequestMethod.GET)
	public String bundleManageInsertForm(HttpServletRequest request, Model model
			, @ModelAttribute("bundleVO") BundleVO bundle
			) {
		return "admin/bundleManageInsertForm";
	}
	
	@RequestMapping(value = "bundleManageInsert", method = RequestMethod.POST)
	public String bundleManageInsert(HttpServletRequest request, Model model
			, @ModelAttribute("bundleVO") @Valid BundleVO bundle
			, BindingResult result
			) {

		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		// 유효성 체크
		if (result.hasErrors()) { // 어느 멤버변수인지 모르지만, 에러내용이 존재한다면
			if (result.getFieldError("memberName") != null) { // writer 멤버변수에 대한 에러내용이 존재한다면
				model.addAttribute("msg", "Writer 입력은 비어있거나 3글자 미만이면 안되요~");
			}
			return "admin/bundleManageInsertForm";
		}

		// 서비스를 통한 DB등록
		// ...

		return "admin/bundleManageInsert";
	}
	
	@RequestMapping(value = "bundleManageUpdateForm", method = RequestMethod.GET)
	public String bundleManageUpdateForm(HttpServletRequest request, Model model
			, @ModelAttribute("bundleVO") BundleVO bundle
			) {
		return "admin/bundleManageUpdateForm";
	}
	
	@RequestMapping(value = "bundleManageUpdate", method = RequestMethod.POST)
	public String bundleManageUpdate(HttpServletRequest request, Model model
			, @ModelAttribute("bundleVO") @Valid BundleVO bundle
			, BindingResult result
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/bundleManageUpdate";
	}
	
	@RequestMapping(value = "bundleManageDelete", method = RequestMethod.POST)
	public String bundleManageDelete(HttpServletRequest request, Model model
			, @RequestParam("atseq") int atseq
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/bundleManageDelete";
	}

}
