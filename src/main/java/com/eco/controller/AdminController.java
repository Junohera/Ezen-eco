package com.eco.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eco.dto.ArtistVO;
import com.eco.dto.ChartVO;
import com.eco.dto.GenreVO;
import com.eco.dto.MemberVO;
import com.eco.dto.MusicVO;
import com.eco.dto.Paging;
import com.eco.dto.ThemeVO;
import com.eco.service.AdminService;
import com.eco.service.MemberService;
import com.eco.service.MusicService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	
	
	
	
	@RequestMapping("genreInsert")
	public String genreInsert(@ModelAttribute("dto") @Valid GenreVO genrevo,
			BindingResult result, Model model , HttpServletRequest request) {
		if(result.getFieldError("title")!=null) {
			model.addAttribute("message", "제목을 입력하세요");
			return "admin/genreInsertForm";
		}
		as.genreInsert(genrevo);
		return "admin/GenreManage";
	}
	
	
	@RequestMapping("/genreInsertForm")
	public String genreInsertForm(Model model, HttpServletRequest request) {
		String url = "admin/genreInsertForm";
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("adminId");
		if(session.getAttribute("adminId") == null) url="adminLogin";
		return url;
	}
	
	
	@RequestMapping("GenreManage")
	public ModelAndView GenreManage(HttpServletRequest request) {
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
			} else if( session.getAttribute("page")!= null  ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("genre", "title", key);
			paging.setTotalCount(count);
			paging.paging();
			List<GenreVO> genreList = as.listGenre(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("genreList", genreList);
			mav.setViewName("admin/GenreManage");
		}
		return mav;
	}
	
	
	
	@RequestMapping("chartInsert")
	public String chartInsert(@ModelAttribute("dto") @Valid ChartVO chartvo,
			BindingResult result, Model model , HttpServletRequest request) {
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
					"UTF-8", new DefaultFileRenamePolicy());
			ChartVO cvo = new ChartVO();
			cvo.setTitle(multi.getParameter("title"));
			String file = multi.getFilesystemName("filename");
			cvo.setImg(file);
			ContentValidator validator = new ContentValidator();
			validator.validate(chartvo, result);
			if(result.hasErrors()) {
				if(result.getFieldError("title")!=null) 
					model.addAttribute("message", "제목을 입력하세요");
				return "admin/chartInsertForm";
			}
		} catch (IOException e) {e.printStackTrace();}
		as.chartInsert(chartvo);
		return "admin/ChartManage";
	}
	
	
	@RequestMapping("/chartInsertForm")
	public String chartInsertForm(Model model, HttpServletRequest request) {
		String url = "admin/chartInsertForm";
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("adminId");
		if(session.getAttribute("adminId") == null) url="adminLogin";
		return url;
	}
	
	
	@RequestMapping("ChartManage")
	public ModelAndView ChartManage(HttpServletRequest request) {
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
			} else if( session.getAttribute("page")!= null  ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("chart", "title", key);
			paging.setTotalCount(count);
			paging.paging();
			List<ChartVO> chartList = as.listChart(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("chartList", chartList);
			mav.setViewName("admin/ChartManage");
		}
		return mav;
	}
	
	

	@RequestMapping("themeInsert")
	public String themeInsert(@ModelAttribute("dto") @Valid ThemeVO themevo,
			BindingResult result, Model model , HttpServletRequest request) {
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
					"UTF-8", new DefaultFileRenamePolicy());
			ThemeVO tvo = new ThemeVO();
			tvo.setTitle(multi.getParameter("title"));
			String file = multi.getFilesystemName("filename");
			tvo.setImg(file);
			ContentValidator validator = new ContentValidator();
			validator.validate(themevo, result);
			if(result.hasErrors()) {
				if(result.getFieldError("title")!=null) 
					model.addAttribute("message", "제목을 입력하세요");
				return "admin/themeInsertForm";
			}
		} catch (IOException e) {e.printStackTrace();}
		as.themeInsert(themevo);
		return "admin/ThemeManage";
	}
	
	
	@RequestMapping("/themeInsertForm")
	public String themeInsertForm(Model model, HttpServletRequest request) {
		String url = "admin/themeInsertForm";
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("adminId");
		if(session.getAttribute("adminId") == null) url="adminLogin";
		return url;
	}
	
	
	@RequestMapping("ThemeManage")
	public ModelAndView ThemeManage(HttpServletRequest request) {
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
			} else if( session.getAttribute("page")!= null  ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("theme", "title", key);
			paging.setTotalCount(count);
			paging.paging();
			List<ThemeVO> themeList = as.listTheme(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("themeList", themeList);
			mav.setViewName("admin/ThemeManage");
		}
		return mav;
	}
	
	
	
	@RequestMapping("ArtistManage")
	public ModelAndView ArtistManage(HttpServletRequest request) {
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
			} else if( session.getAttribute("page")!= null  ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("artist", "name", key);
			paging.setTotalCount(count);
			paging.paging();
			List<ArtistVO> artistList = as.listArtist(paging, key);
			mav.addObject("paging", paging);
			mav.addObject("key", key);
			mav.addObject("artistList", artistList);
			mav.setViewName("admin/ArtistManage");
		}
		return mav;
	}
	
	
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
			} else if( session.getAttribute("page")!= null) {
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
			} else if( session.getAttribute("page")!= null  ) {
				page = (int) session.getAttribute("page");
			} else {
				page = 1;
				session.removeAttribute("page");
			}
			Paging paging = new Paging();
			paging.setPage(page);
			int count = as.getAllCount("music", "title", key);
			paging.setTotalCount(count);
			paging.paging();
			List<MusicVO> musicList = as.listMusic(paging, key);
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
	
	@RequestMapping("/AIndex")
	public String AIndex(Model model) {
		return "admin/AIndex";
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
