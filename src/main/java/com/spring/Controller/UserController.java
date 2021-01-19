package com.spring.Controller;
import com.spring.*;

import com.spring.DomainClass.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import com.spring.Service.*;

@SuppressWarnings("serial")
@Controller
@SessionAttributes({ "user" })
public class UserController extends ExtendedModelMap {

    @Autowired
	private UserService userService;
	@Autowired
	private NoteService noteService;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/createUser")
	public ModelAndView createUser(@RequestParam("userName") String name, @RequestParam("password") String password,
			@RequestParam("email") String email, @RequestParam("mobileNumber") String mobileNumber) {
		User user = new User(name, password, email, mobileNumber);
		User userObj=userService.getUserObj(email);
		if(userObj!=null) {
			return new ModelAndView("index", "error", "Email Id is already existed!!");
		}
		else {
		userService.createUser(user);
		}
		return new ModelAndView("index");
	}

	@RequestMapping("/loginSuccess")
	public ModelAndView loginSuccess(@RequestParam("email") String email, @RequestParam("password") String password,
			ModelMap modelMap, Model model, HttpServletRequest request) {
		User user = userService.loginSuccess(email, password);
		if (user == null) {
			return new ModelAndView("index", "error", "UserName or Password may be wrong!!");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginStatus", "true");
			modelMap.put("user", user);
			model.addAttribute("user", user);
			return new ModelAndView("redirect:listAllNotes.do", "user", user);
		}
	}
	
	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editNote(@ModelAttribute User user) {
		return new ModelAndView("editUser", "user", user);
	}

	@RequestMapping("/updateUser")
	public ModelAndView updateUser(@RequestParam("userId") Integer id, @RequestParam("userName") String name,
			@RequestParam("password") String password, @RequestParam("email") String email,
			@RequestParam("mobileNumber") String mobileNumber) {
		User user = new User(id, name, password, email, mobileNumber);
		userService.updateUser(user);
		return new ModelAndView("redirect:listAllNotes.do", "message", "User updated successfully!!");
	}

	@RequestMapping("/logout")
	public String invalid(@ModelAttribute User user, HttpSession session, SessionStatus status) {

		session.invalidate();
		return "index";

	}

}