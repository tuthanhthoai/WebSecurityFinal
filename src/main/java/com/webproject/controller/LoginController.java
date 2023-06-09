package com.webproject.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.webproject.entity.User;
import com.webproject.model.UserModel;
import com.webproject.service.UserService;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("account")
public class LoginController {
	@Autowired
	UserService userService;

	@GetMapping("login")
	public String loginPage(ModelMap model, HttpSession session) {
		UserModel user = new UserModel();
		model.addAttribute("user", user);
		model.addAttribute("action", "login");
		String token = UUID.randomUUID().toString();
		session.setAttribute("token", token);

		return "login/login";
	}

	@PostMapping("login")
	public ModelAndView login(ModelMap model, @Valid @ModelAttribute("csrftoken") String csrfToken,
			@Valid @ModelAttribute("user") UserModel user, BindingResult result, HttpSession session)
			throws JSONException {
		String message = "";
		if (result.hasErrors()) {
			return new ModelAndView("login/login");
		}

		String email = StringEscapeUtils.escapeHtml4(user.getEmail().trim());
		String pw = StringEscapeUtils.escapeHtml4(user.getPassword().trim());
		user.setEmail(email);
		user.setPassword(pw);
		String storedToken = (String) session.getAttribute("token");
		System.err.println(csrfToken);
		System.err.println(storedToken);
		if (csrfToken == null || !csrfToken.equals(storedToken)) {
			// Thông báo không xác thực
			message = "Không xác thực được người dùng";
			model.addAttribute("messageErorr", message);
		}

		if (user.getEmail() == "" || user.getPassword() == "") {
			model.addAttribute("user", user);
			model.addAttribute("messageError", "dữ liệu nhập vào không được để trống!");
			return new ModelAndView("login/login");
		}
		User entity = userService.findByEmail(user.getEmail());

		if (entity == null) {
			message = "không tìm thấy tài khoản";
		} else if (BCrypt.checkpw(user.getPassword(), entity.getHashedPassword())) {

			session.setAttribute("user", entity);
			if (entity.getRoles().equals("admin")) {
				return new ModelAndView("redirect:/admin");
			}
			return new ModelAndView("redirect:/");
		} else {
			message = "Mật khẩu không chính xác";
		}
		model.addAttribute("user", user);
		model.addAttribute("messageError", message);
		return new ModelAndView("login/login");
	}

	@GetMapping("signup")
	public String signUpPage(ModelMap model, HttpSession session) {
		UserModel user = new UserModel();
		model.addAttribute("user", user);
		model.addAttribute("action", "signup");
		String token = UUID.randomUUID().toString();
		session.setAttribute("token", token);
		return "login/login";
	}

	@PostMapping("signup")
	public ModelAndView signUp(ModelMap model, @Valid @ModelAttribute("csrftoken") String csrfToken,
			@Valid @ModelAttribute("user") UserModel user, BindingResult result, HttpSession session) {
		String message = "";
		String email = StringEscapeUtils.escapeHtml4(user.getEmail().trim());
		String firstName = StringEscapeUtils.escapeHtml4(user.getFirstName().trim());
		String lastName = StringEscapeUtils.escapeHtml4(user.getLastName().trim());
		String idCard = StringEscapeUtils.escapeHtml4(user.getIdCard().trim());
		String phone = StringEscapeUtils.escapeHtml4(user.getPhone().trim());
		String pw = StringEscapeUtils.escapeHtml4(user.getPassword().trim());
		String pw2 = StringEscapeUtils.escapeHtml4(user.getPassword2().trim());

		user.setEmail(email);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setIdCard(idCard);
		user.setPhone(phone);
		user.setPassword(pw);
		user.setPassword2(pw2);

		user.setRoles("user");

		String regexNumber = "^(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})$";
		String regexIdCard = "^[1-9][0-9]{8}$";
		String regexIsAllSameDigits = "^(.)\\1+$";
		// String regexPw = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}$";
		String storedToken = (String) session.getAttribute("token");
		System.err.println(csrfToken);
		System.err.println(storedToken);
		if (csrfToken == null || !csrfToken.equals(storedToken)) {
			// Thông báo không xác thực
			message = "Đăng ký thất bại!";
			model.addAttribute("messageErorr", message);
		}

		if (!user.getIdCard().matches(regexIdCard) || user.getIdCard().matches(regexIsAllSameDigits)) {
			message = "số CMND không hợp lệ";
		} else if (!user.getPhone().matches(regexNumber) || user.getPhone().matches(regexIsAllSameDigits)) {
			message = "số điện thoại không hợp lệ";
//		} else if (!user.getPassword().matches(regexPw) || !user.getPassword2().matches(regexPw)) {
//			message = "mật khẩu không hợp lệ";
		} else if (!BCrypt.checkpw(user.getPassword2(), BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()))) {
			message = "mật khẩu nhập lại không chính xác";
		} else if (user.getEmail() == "" || user.getFirstName() == "" || user.getLastName() == ""
				|| user.getIdCard() == "" || user.getPhone() == "" || user.getPassword() == "") {
			message = "dữ liệu nhập vào không được để trống!";
		} else {

			try {
				User userResp = new User();
				BeanUtils.copyProperties(user, userResp);
				userResp.setHashedPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
				userService.save(userResp);
				model.addAttribute("messageSuccess", "Đăng ký thành công vui lòng trở lại đăng nhập");
				model.addAttribute("action", "signup");
				model.remove("user");
				return new ModelAndView("login/login");
			} catch (Exception e) {
				message = "Thông tin không hợp lệ";
			}

		}
		model.addAttribute("user", user);
		model.addAttribute("messageError", message);
		model.addAttribute("action", "signup");
		return new ModelAndView("login/login");

	}

	@GetMapping("logout")
	public String logout(ModelMap model, HttpSession session) {
		session.invalidate();
		return "redirect:/account/login";
	}

}
