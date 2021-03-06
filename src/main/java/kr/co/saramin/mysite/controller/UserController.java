package kr.co.saramin.mysite.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.saramin.mysite.service.UserService;
import kr.co.saramin.mysite.vo.UserVo;
import kr.co.saramin.security.annotation.Auth;
import kr.co.saramin.security.annotation.AuthUser;

@Controller
@RequestMapping ("/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/joinform")
	public String joinform() {
		return "user/joinform";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute @Valid UserVo userVo, BindingResult result) {
		
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
						
			return "user/joinform";
		}
		
		userService.join(userVo);
		return "redirect:/user/loginform";
	}
	
	@RequestMapping("/loginform")
	public String loginform() {
		return "user/loginform";
	}
	
	@Auth
	@RequestMapping("/updateform")
	public String updateform(@AuthUser UserVo authUser, Model model) {
		
		UserVo userVo = userService.getUser(authUser.getNo());
		model.addAttribute("userVo", userVo);
		
		return "user/updateform";
	}
	
	@Auth
	@RequestMapping("/update")
	public String update(@AuthUser UserVo authUser, @ModelAttribute UserVo userVo) {
		userVo.setNo(authUser.getNo());
		userService.modifyUser(userVo);
		
		return "redirect:/updateform";
	}
	
	/*
	@ExceptionHandler(UserDaoException.class)
	public String handleUserDaoException(Exception ex) {
		System.out.println("logging:" + ex);;
		return "error/500";
	}
	*/
}
