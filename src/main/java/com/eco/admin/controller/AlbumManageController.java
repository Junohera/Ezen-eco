package com.eco.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eco.admin.service.IAlbumManageService;
import com.eco.dao.ICountDao;
import com.eco.dao.IMusicDao;
import com.eco.dto.AlbumVO;
import com.eco.dto.Paging;
import com.eco.dto.search.SearchDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AlbumManageController {
	
	@Autowired
	IAlbumManageService albumManageService;
	
	@Autowired
	IMusicDao musicDao;
	
	@Autowired
	ICountDao c;
	
	@RequestMapping("albumManageList")
	public String albumManageList(HttpServletRequest request, Model model,
			@ModelAttribute("search") SearchDTO search) {
		
		
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		// 검색조건에 의한 갯수조회
		search.setSearchTable("album"); // 검색조건 테이블 저장
		int count = c.count(search);
		
		// 페이징
		Paging paging = new Paging();
		paging.setPage(search.getPage());
		paging.setTotalCount(count);
		paging.paging();

		// 페이징과 검색조건에 의한 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("search", search);
		List<AlbumVO> albumList = albumManageService.list(map);
		
		// 페이지내에 필요값 저장
		model.addAttribute("paging", paging);
		model.addAttribute("albumList", albumList);
		
		/*
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
		int count = adminService.getAllCount("album", "title", key);
		paging.setTotalCount(count);
		paging.paging();

		// 검색조건기반 조회
		List<AlbumVO> albumList = albumManageService.list(paging, key);

		// 페이지내에 필요값 저장
		model.addAttribute("paging", paging);
		model.addAttribute("key", key);
		model.addAttribute("albumList", albumList);
		 */
		
		return "admin/album/albumManageList";
	}

	//----------------------------------  albumManageInsertForm-------------------------------------------------------------
	@RequestMapping(value = "albumManageInsertForm", method = RequestMethod.GET)
	public String albumManageInsertForm(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") AlbumVO album
			) {
		
		model.addAttribute("ArtistList", albumManageService.getArtist());
		model.addAttribute("genreList", musicDao.genreList());
		return "admin/album/albumManageInsertForm";
	}
	
	
	//-----------------------------------  albumManageInsert  -------------------------------------------------------------------
	@RequestMapping(value = "albumManageInsert", method = RequestMethod.POST)
	public String albumManageInsert(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") @Valid AlbumVO album
			, BindingResult result , RedirectAttributes redirect
			) {

		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}
		
		model.addAttribute("ArtistList", albumManageService.getArtist());
		model.addAttribute("genreList", musicDao.genreList());
		/*
		try {
			String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			MultipartRequest multi = new MultipartRequest(request, path, 1024*1024*10,
					"UTF-8", new DefaultFileRenamePolicy());
			album.setTitle(multi.getParameter("title"));
			album.setAtseq(Integer.parseInt(multi.getParameter("atseq")));
			album.setGseq(Integer.parseInt(multi.getParameter("gseq")));
			album.setAbtype(multi.getParameter("abtype"));
			album.setImglink(multi.getParameter("imglink"));
			album.setContent(multi.getParameter("content"));
			album.setPdate(multi.getParameter("pdate "));
			
			String file = multi.getFilesystemName("filename");
			album.setImg(file);
			ContentValidatorAA validator = new ContentValidatorAA();
			validator.validate(album, result);
			if(result.hasErrors()) {
				if(result.getFieldError("title")!=null) {
					model.addAttribute("message", "제목을 입력하세요");
					return "admin/album/albumManageInsertForm";
				} else if (result.getFieldError("atseq")!=null) {
					model.addAttribute("message", "가수를 선택해주세요");
					return "admin/album/albumManageInsertForm";
				} else if (result.getFieldError("gseq")!=null) {
					model.addAttribute("message", "장르를 선택해주세요");
					return "admin/album/albumManageInsertForm";
				} else if (result.getFieldError("abtype")!=null) {
					model.addAttribute("message", "앨범타입을 선택해주세요");
					return "admin/album/albumManageInsertForm";
				} else if (result.getFieldError("content")!=null) {
					model.addAttribute("message", "내용을 입력해주세요");
					return "admin/album/albumManageInsertForm";
				}  else if (result.getFieldError("pdate")!=null) {
					model.addAttribute("message", "발매일을 입력해주세요");
					return "admin/album/albumManageInsertForm";
				}
			}
		} catch (IOException e) {e.printStackTrace();}
		
		albumManageService.insert(album);
		
		return "redirect:/albumManageInsertForm?abseq=" + album.getAbseq();
		*/
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request
					, ResourceUtils.getFile("classpath:static/upload/").toPath().toString()
					, 1024 * 1024 * 10
					, "UTF-8"
					, new DefaultFileRenamePolicy()
			);
			
			if (multi.getParameter("title") == null) {
				model.addAttribute("message", "title");
				return "admin/album/albumManageInsertForm";
			} else album.setTitle(multi.getParameter("title"));
			if (multi.getParameter("atseq") == null) {
				model.addAttribute("message", "atseq");
				return "admin/album/albumManageInsertForm";
			} else album.setAtseq(Integer.parseInt(multi.getParameter("atseq")));
			if (multi.getParameter("gseq") == null) {
				model.addAttribute("message", "gseq");
				return "admin/album/albumManageInsertForm";
			} else album.setGseq(Integer.parseInt(multi.getParameter("gseq")));
			if (multi.getParameter("abtype") == null) {
				model.addAttribute("message", "abtype");
				return "admin/album/albumManageInsertForm";
			} else album.setAbtype(multi.getParameter("abtype"));
			if (multi.getParameter("content") == null) {
				model.addAttribute("message", "content");
				return "admin/album/albumManageInsertForm";
			} else album.setContent(multi.getParameter("content"));
			if (multi.getParameter("inputpdate") == null) {
				model.addAttribute("message", "inputpdate");
				return "admin/album/albumManageInsertForm";
			} else album.setInputpdate(multi.getParameter("inputpdate"));
			
			album.setImglink(multi.getParameter("imglink"));
			String img = multi.getFilesystemName("img");
			if (album.getImglink() != null && !album.getImglink().equals("")) {
				img = album.getImglink();
			}
			else if (img != null) {
				img = "/upload/" + img;
			} else {
				img = null;
			}
			album.setImg(img);
			
		} catch (IOException e) {e.printStackTrace();}
		
		int res = albumManageService.insert(album);
		if (res > 0) {
			redirect.addFlashAttribute("message", "저장되었습니다.");
			return "redirect:/albumManageInsertForm?abseq=" + album.getAbseq();
		} else {
			return "admin/album/albumManageInsertForm";
		}
		
		
	}
	
	
	//-----------------------------------  albumManageUpdateForm  -------------------------------------------------------------------
	@RequestMapping(value = "albumManageUpdateForm", method = RequestMethod.GET)
	public String albumManageUpdateForm(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") AlbumVO album
			) {
		return "admin/album/albumManageUpdateForm";
	}
	
	
	//-----------------------------------  albumManageUpdate  -------------------------------------------------------------------
	@RequestMapping(value = "albumManageUpdate", method = RequestMethod.POST)
	public String albumManageUpdate(HttpServletRequest request, Model model
			, @ModelAttribute("AlbumVO") @Valid AlbumVO album
			, BindingResult result
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/albumManageUpdate";
	}
	
	
	//-----------------------------------  albumManageDelete  -------------------------------------------------------------------
	@RequestMapping(value = "albumManageDelete", method = RequestMethod.POST)
	public String albumManageDelete(HttpServletRequest request, Model model
			, @RequestParam("atseq") int atseq
			) {
		// 세션 체크
		HttpSession session = request.getSession();
		String adminId = (String) session.getAttribute("adminId");
		if (adminId == null) {
			return "redirect:/admin";
		}

		return "admin/albumManageDelete";
	}

}
