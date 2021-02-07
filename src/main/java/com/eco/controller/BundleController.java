package com.eco.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eco.dto.Bundle;
import com.eco.dto.MemberVO;
import com.eco.service.BundleService;

@Controller
public class BundleController {
	
	@Autowired
	BundleService bundleService;

	@RequestMapping(value = "/bundle", method = RequestMethod.GET)
	public String bundle(Model model, HttpServletRequest request) {
		
		return "music/bundle";
	}
	@RequestMapping(value = "/addBundle", method = RequestMethod.POST)
	public String addBundle(Model model, HttpServletRequest request
			, @ModelAttribute("bundle") @Valid Bundle bundle
			, BindingResult result
			) {
		MemberVO loginUser = (MemberVO) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/loginForm";
		} else {
			bundle.setUseq(loginUser.getUseq());
			bundle.setUseyn("Y");
			if(result.getFieldError("title")!=null) {
				System.out.println(result.getFieldError("title"));
			} else {
				bundleService.addBundle(bundle);
			}
			String returnPath = request.getHeader("Referer");
			returnPath = "redirect:" + returnPath.substring(returnPath.lastIndexOf("/"));
			
			return returnPath;	
		}
		
	}
	@RequestMapping(value = "/modBundle", method = RequestMethod.POST)
	public String modBundle(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/addBundleDetail", method = RequestMethod.POST)
	public String addBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
	@RequestMapping(value = "/delBundleDetail", method = RequestMethod.POST)
	public String delBundleDetail(Model model, HttpServletRequest request) {
		String returnPath = "";
		return "redirect:/" + returnPath;
	}
}
