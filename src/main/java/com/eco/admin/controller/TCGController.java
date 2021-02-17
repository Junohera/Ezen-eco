//package com.eco.admin.controller;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.ResourceUtils;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.eco.admin.service.IAdminService;
//import com.eco.admin.valid.ContentValidator;
//import com.eco.admin.valid.ContentValidator1;
//import com.eco.admin.valid.ContentValidator2;
//import com.eco.dto.ChartVO;
//import com.eco.dto.GenreVO;
//import com.eco.dto.Paging;
//import com.eco.dto.ThemeVO;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//
//@Controller
//public class TCGController {
//	
//	@Autowired
//	IAdminService as;
//
//	@RequestMapping("chartDelete")
//	public String chartDelete(Model model, HttpServletRequest request,
//			@RequestParam("cseq") String cseq) {
//		as.chartDelete(cseq);
//		return "redirect:/ChartManage";
//	}
//	
//	
//	
//	@RequestMapping("genreDelete")
//	public String genreDelete(Model model, HttpServletRequest request,
//			@RequestParam("gseq") String gseq) {
//		as.genreDelete(gseq);
//		return "redirect:/GenreManage";
//	}
//	
//	
//	
//	@RequestMapping("themeDelete")
//	public String themeDelete(Model model, HttpServletRequest request,
//			@RequestParam("tseq") String tseq) {
//		as.themeDelete(tseq);
//		return "redirect:/ThemeManage";
//	}
//	
//	
//	
//	@RequestMapping("chartUpdate")
//	public String chartUpdate(@ModelAttribute("dto") @Valid ChartVO chartvo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			chartvo.setCseq(Integer.parseInt(multi.getParameter("cseq")));
//			chartvo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			String oldimage = multi.getParameter("oldimage");
//			if(file!=null) chartvo.setImg(file);
//			else if(oldimage!=null)chartvo.setImg(oldimage);
//			else chartvo.setImg(null);
//		} catch (IOException e) {e.printStackTrace();}
//		as.chartUpdate(chartvo);
//		return "redirect:/ChartManage";
//	}
//	
//	
//	
//	@RequestMapping("/chartUpdateForm")
//	public String chartUpdateForm(Model model, HttpServletRequest request,
//			@RequestParam("cseq") String cseq) {
//		String url = "admin/chartUpdateForm";
//		model.addAttribute("chart", as.getChart(cseq));
//		return url;
//	}
//	
//	
//	
//	@RequestMapping("adminChartDetail")
//	public ModelAndView adminChartDetail(HttpServletRequest request, 
//			@RequestParam("cseq") String cseq) {
//		
//		ModelAndView mav = new ModelAndView();
//		ChartVO cvo = as.getChart(cseq);
//		mav.addObject("ChartVO", cvo);
//		mav.setViewName("admin/adminChartDetail");
//		return mav;
//	}
//	
//	
//	
//	@RequestMapping("genreUpdate")
//	public String genreUpdate(@ModelAttribute("dto") @Valid GenreVO genrevo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			genrevo.setGseq(Integer.parseInt(multi.getParameter("gseq")));
//			genrevo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			String oldimage = multi.getParameter("oldimage");
//			if(file!=null) genrevo.setImg(file);
//			else if(oldimage!=null)genrevo.setImg(oldimage);
//			else genrevo.setImg(null);
//		} catch (IOException e) {e.printStackTrace();}
//		as.genreUpdate(genrevo);
//		return "redirect:/GenreManage";
//	}
//	
//	
//	@RequestMapping("/genreUpdateForm")
//	public String genreUpdateForm(Model model, HttpServletRequest request,
//			@RequestParam("gseq") String gseq) {
//		String url = "admin/genreUpdateForm";
//		model.addAttribute("genre", as.getGenre(gseq));
//		return url;
//	}
//	
//
//
//	@RequestMapping("adminGenreDetail")
//	public ModelAndView adminGenreDetail(HttpServletRequest request, 
//			@RequestParam("gseq") String gseq) {
//		
//		ModelAndView mav = new ModelAndView();
//		GenreVO gvo = as.getGenre(gseq);
//		mav.addObject("GenreVO", gvo);
//		mav.setViewName("admin/adminGenreDetail");
//		return mav;
//	}
//	
//	
//	@RequestMapping("themeUpdate")
//	public String themeUpdate(@ModelAttribute("dto") @Valid ThemeVO themevo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			themevo.setTseq(Integer.parseInt(multi.getParameter("tseq")));
//			themevo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			themevo.setImg(file);
//			String oldimage = multi.getParameter("oldimage");
//			if(file!=null) themevo.setImg(file);
//			else if(oldimage!=null)themevo.setImg(oldimage);
//			else themevo.setImg(null);
//		} catch (IOException e) {e.printStackTrace();}
//		as.themeUpdate(themevo);
//		return "redirect:/ThemeManage";
//	}
//	
//	
//	
//	@RequestMapping("/themeUpdateForm")
//	public String themeUpdateForm(Model model, HttpServletRequest request,
//			@RequestParam("tseq") String tseq) {
//		String url = "admin/themeUpdateForm";
//		model.addAttribute("theme", as.getTheme(tseq));
//		return url;
//	}
//	
//	
//	
//	@RequestMapping("adminThemeDetail")
//	public ModelAndView adminThemeDetail(HttpServletRequest request, 
//			@RequestParam("tseq") String tseq) {
//		
//		ModelAndView mav = new ModelAndView();
//		ThemeVO tvo = as.getTheme(tseq);
//		mav.addObject("ThemeVO", tvo);
//		mav.setViewName("admin/adminThemeDetail");
//		return mav;
//	}
//	
//	
//	
//	@RequestMapping("genreInsert")
//	public String genreInsert(@ModelAttribute("dto") @Valid GenreVO genrevo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			genrevo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			genrevo.setImg(file);
//			ContentValidator1 validator = new ContentValidator1();
//			validator.validate(genrevo, result);
//			if(result.hasErrors()) {
//				if(result.getFieldError("title")!=null) 
//					model.addAttribute("message", "제목을 입력하세요");
//				return "admin/genreInsertForm";
//			}
//		} catch (IOException e) {e.printStackTrace();}
//		as.genreInsert(genrevo);
//		return "redirect:/GenreManage";
//	}
//	
//	
//	@RequestMapping("/genreInsertForm")
//	public String genreInsertForm(Model model, HttpServletRequest request) {
//		String url = "admin/genreInsertForm";
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		if(session.getAttribute("adminId") == null) url="adminLogin";
//		return url;
//	}
//	
//	
//	@RequestMapping("GenreManage")
//	public ModelAndView GenreManage(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		int page=1;
//		if(id==null)
//			mav.setViewName("redirect:/admin");
//		else {
//			if( request.getParameter("first")!=null ) {
//				session.removeAttribute("page");
//				session.removeAttribute("key");
//			}
//			String key = "";
//			if( request.getParameter("key") != null ) {
//				key = request.getParameter("key");
//				session.setAttribute("key", key);
//			} else if( session.getAttribute("key")!= null ) {
//				key = (String)session.getAttribute("key");
//			} else {
//				session.removeAttribute("key");
//				key = "";
//			} 
//			if( request.getParameter("page") != null ) {
//				page = Integer.parseInt(request.getParameter("page"));
//				session.setAttribute("page", page);
//			} else if( session.getAttribute("page")!= null  ) {
//				page = (int) session.getAttribute("page");
//			} else {
//				page = 1;
//				session.removeAttribute("page");
//			}
//			Paging paging = new Paging();
//			paging.setPage(page);
//			int count = as.getAllCount("genre", "title", key);
//			paging.setTotalCount(count);
//			paging.paging();
//			List<GenreVO> genreList = as.listGenre(paging, key);
//			mav.addObject("paging", paging);
//			mav.addObject("key", key);
//			mav.addObject("genreList", genreList);
//			mav.setViewName("admin/GenreManage");
//		}
//		return mav;
//	}
//	
//	
//	
//	@RequestMapping("chartInsert")
//	public String chartInsert(@ModelAttribute("dto") @Valid ChartVO chartvo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			chartvo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			chartvo.setImg(file);
//			ContentValidator2 validator = new ContentValidator2();
//			validator.validate(chartvo, result);
//			if(result.hasErrors()) {
//				if(result.getFieldError("title")!=null) 
//					model.addAttribute("message", "제목을 입력하세요");
//				return "admin/chartInsertForm";
//			}
//		} catch (IOException e) {e.printStackTrace();}
//		as.chartInsert(chartvo);
//		return "redirect:/ChartManage";
//	}
//	
//	
//	@RequestMapping("/chartInsertForm")
//	public String chartInsertForm(Model model, HttpServletRequest request) {
//		String url = "admin/chartInsertForm";
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		if(session.getAttribute("adminId") == null) url="adminLogin";
//		return url;
//	}
//	
//	
//	@RequestMapping("ChartManage")
//	public ModelAndView ChartManage(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		int page=1;
//		if(id==null)
//			mav.setViewName("redirect:/admin");
//		else {
//			if( request.getParameter("first")!=null ) {
//				session.removeAttribute("page");
//				session.removeAttribute("key");
//			}
//			String key = "";
//			if( request.getParameter("key") != null ) {
//				key = request.getParameter("key");
//				session.setAttribute("key", key);
//			} else if( session.getAttribute("key")!= null ) {
//				key = (String)session.getAttribute("key");
//			} else {
//				session.removeAttribute("key");
//				key = "";
//			} 
//			if( request.getParameter("page") != null ) {
//				page = Integer.parseInt(request.getParameter("page"));
//				session.setAttribute("page", page);
//			} else if( session.getAttribute("page")!= null  ) {
//				page = (int) session.getAttribute("page");
//			} else {
//				page = 1;
//				session.removeAttribute("page");
//			}
//			Paging paging = new Paging();
//			paging.setPage(page);
//			int count = as.getAllCount("chart", "title", key);
//			paging.setTotalCount(count);
//			paging.paging();
//			List<ChartVO> chartList = as.listChart(paging, key);
//			mav.addObject("paging", paging);
//			mav.addObject("key", key);
//			mav.addObject("chartList", chartList);
//			mav.setViewName("admin/ChartManage");
//		}
//		return mav;
//	}
//	
//	
//
//	@RequestMapping("themeInsert")
//	public String themeInsert(@ModelAttribute("dto") @Valid ThemeVO themevo,
//			BindingResult result, Model model , HttpServletRequest request) {
//		try {
//			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
//			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
//					"UTF-8", new DefaultFileRenamePolicy());
//			themevo.setTitle(multi.getParameter("title"));
//			String file = multi.getFilesystemName("filename");
//			themevo.setImg(file);
//			ContentValidator validator = new ContentValidator();
//			validator.validate(themevo, result);
//			if(result.hasErrors()) {
//				if(result.getFieldError("title")!=null) 
//					model.addAttribute("message", "제목을 입력하세요");
//				return "admin/themeInsertForm";
//			}
//		} catch (IOException e) {e.printStackTrace();}
//		as.themeInsert(themevo);
//		return "redirect:/ThemeManage";
//	}
//	
//	
//	@RequestMapping("/themeInsertForm")
//	public String themeInsertForm(Model model, HttpServletRequest request) {
//		String url = "admin/themeInsertForm";
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		if(session.getAttribute("adminId") == null) url="adminLogin";
//		return url;
//	}
//	
//	
//	@RequestMapping("ThemeManage")
//	public ModelAndView ThemeManage(HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		String id = (String)session.getAttribute("adminId");
//		int page=1;
//		if(id==null)
//			mav.setViewName("redirect:/admin");
//		else {
//			if( request.getParameter("first")!=null ) {
//				session.removeAttribute("page");
//				session.removeAttribute("key");
//			}
//			String key = "";
//			if( request.getParameter("key") != null ) {
//				key = request.getParameter("key");
//				session.setAttribute("key", key);
//			} else if( session.getAttribute("key")!= null ) {
//				key = (String)session.getAttribute("key");
//			} else {
//				session.removeAttribute("key");
//				key = "";
//			} 
//			if( request.getParameter("page") != null ) {
//				page = Integer.parseInt(request.getParameter("page"));
//				session.setAttribute("page", page);
//			} else if( session.getAttribute("page")!= null  ) {
//				page = (int) session.getAttribute("page");
//			} else {
//				page = 1;
//				session.removeAttribute("page");
//			}
//			Paging paging = new Paging();
//			paging.setPage(page);
//			int count = as.getAllCount("theme", "title", key);
//			paging.setTotalCount(count);
//			paging.paging();
//			List<ThemeVO> themeList = as.listTheme(paging, key);
//			mav.addObject("paging", paging);
//			mav.addObject("key", key);
//			mav.addObject("themeList", themeList);
//			mav.setViewName("admin/ThemeManage");
//		}
//		return mav;
//	}
//}
