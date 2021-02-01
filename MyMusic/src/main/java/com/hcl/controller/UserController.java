package com.hcl.controller;



import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.model.User;
import com.hcl.service.UserServiceImpl;

@Controller
public class UserController {
	@Autowired
	UserServiceImpl impl;
	
	
	
	@GetMapping("login")
	public ModelAndView login() {
		
		return new ModelAndView("login");
	}
	
	@PostMapping("login")
	public String loginCheck(@RequestParam("username") String uname, @RequestParam("password") String password, HttpSession sesh) {
		User u = impl.getByUsername(uname);
		//System.out.println(u);
		if (u != null && u.getPassword().equals(password))
		{
			sesh.setAttribute("sesname", u);
			sesh.setAttribute("role", u.getRole());
			
			return "redirect:home";
		}
		
		else
		{	
			return "redirect:login";
		}
	}
	
	@GetMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("register");
	}
	
	@PostMapping("/register")
	public ModelAndView registerCheck(@RequestParam("username") String uname, @RequestParam("email") String email ,@RequestParam("password") String password) {
		User u = new User();
		u.setUsername(uname);
		u.setPassword(password);
		u.setEmail(email);
		u.setRole("user");
		impl.save(u);
		
		return new ModelAndView("login");
	}
	
	@GetMapping("/editUser")
	public ModelAndView editUser(HttpSession sesh) {
		return new ModelAndView("editUser" , "user", sesh.getAttribute("sesname") );
	}
	
	@PostMapping("/editUser")
	public String editUserSubmit(
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("email") String email,
			@RequestParam("billingAddress") String address1,
			@RequestParam("deliveryAddress") String address2,
			HttpSession sesh) {
		User u = (User) sesh.getAttribute("sesname");
		u = impl.get(u.getId());
		u.setUsername(username);
		u.setPassword(password);
		u.setEmail(email);
		u.setBillingAddress(address1);
		u.setDeliveryAddress(address2);
		
		impl.save(u);
		
		return "redirect:home";
		
	}
	
	@PostMapping("/checkout")
	public String checkout2(@RequestParam("billingAddress") String billingAddress, @RequestParam("deliveryAddress") String deliveryAddress, HttpSession sesh)
	{
		User u = (User) sesh.getAttribute("sesname");
		u = impl.get(u.getId());
		u.setBillingAddress(billingAddress);
		u.setDeliveryAddress(deliveryAddress);
		impl.save(u);
		return "redirect:home";
	}
	
}
