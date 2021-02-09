package com.eco.controller;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
=======
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

=======
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eco.dto.Bundle;
import com.eco.dto.BundleDetailVO;
import com.eco.dto.MemberVO;
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
import com.eco.service.BundleService;

@Controller
public class BundleController {
	
	@Autowired
	BundleService bundleService;

	@RequestMapping(value = "/bundle", method = RequestMethod.GET)
	public String bundle(Model model, HttpServletRequest request) {
		
		return "music/bundle";
	}
<<<<<<< HEAD
	@RequestMapping(value = "/addBundle", method = RequestMethod.POST)
	public String addBundle(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
=======
	@RequestMapping(value = "/addBundleMaster", method = RequestMethod.POST)
	public @ResponseBody Bundle addBundleMaster(Model model, HttpServletRequest request
			, @RequestBody @Valid Bundle bundle
			, BindingResult result
			) {
		
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			return null;
		} else {
			bundle.setUseq(loginUser.getUseq());
			bundle.setUseyn("Y");
			
			if(result.getFieldError("title")!=null) {
				System.out.println(result.getFieldError("title"));
				return null;
			} else {
				bundleService.addBundleMaster(bundle);
				return bundle;
			}
		}
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
	}
	@RequestMapping(value = "/modBundle", method = RequestMethod.POST)
	public String modBundle(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/addBundleDetail", method = RequestMethod.POST)
<<<<<<< HEAD
	public String addBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
=======
	public @ResponseBody boolean addBundleDetail(Model model, HttpServletRequest request
			, @RequestBody List<BundleDetailVO> bundleDetailList
			) {
		System.out.println("System.out.println(bundleDetailList);");
		System.out.println(bundleDetailList);
		
		int insertCount = 0;
		for (BundleDetailVO bundleDetail : bundleDetailList) {
			System.out.println(bundleDetail);
			insertCount += bundleService.addBundleDetail(bundleDetail);
		}
		
		if (insertCount == bundleDetailList.size()) {
			return true;
		} else {
			return false;
		}
		
>>>>>>> c3d37b7c155523a8418335d93061db89524ee26a
	}
	@RequestMapping(value = "/delBundleDetail", method = RequestMethod.POST)
	public String delBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
}
