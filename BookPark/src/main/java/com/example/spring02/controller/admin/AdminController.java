package com.example.spring02.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.member.dto.MemberVO;
import com.example.spring02.service.admin.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	// 1. 愿�由ъ옄  濡쒓렇�씤�럹�씠吏� 留ㅽ븨
	@RequestMapping("login.do")
	public String login(){
		return "admin/adminLogin";
	}
	// 2. 愿�由ъ옄  濡쒓렇�씤 泥댄겕 
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(HttpSession session, MemberVO vo, ModelAndView mav){
		String name = adminService.loginCheck(vo);
		// 濡쒓렇�씤 �꽦怨�
		if(name != null) {
			session.setAttribute("adminId", vo.getUserId());
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("adminName", name);
			session.setAttribute("userName", name);
			mav.setViewName("home"); // 愿�由ъ옄 �럹�씠吏� �씠�룞
			mav.addObject("msg", "success");
		// 濡쒓렇�씤 �떎�뙣
		} else { 
			mav.setViewName("admin/adminLogin"); // 濡쒓렇�씤 �럹�씠吏� �씠�룞
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	// 3. 愿�由ъ옄 濡쒓렇�븘�썐
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		mav.addObject("msg", "logout");
		return mav;
	}
}
