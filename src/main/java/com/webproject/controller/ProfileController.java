package com.webproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webproject.entity.Order;
import com.webproject.entity.OrderItem;
import com.webproject.entity.User;
import com.webproject.model.UserModel;
import com.webproject.service.OrderItemService;
import com.webproject.service.OrderService;
import com.webproject.service.UserService;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("/account/profile")
public class ProfileController {

	@Autowired
	UserService userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderItemService orderItemService;

	@GetMapping("")
	public String profilePage(ModelMap model, HttpSession session) {

		return "web/profile";
	}

	@GetMapping("/edit")
	public String profileEditPage(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/account/login";

		model.addAttribute("user", user);
		return "web/editProfile";
	}

	@PostMapping("/edit")
	public String profileEdit(ModelMap model, @Valid @ModelAttribute("user") UserModel usermodel, BindingResult result,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/account/login";

		String firstName = StringEscapeUtils.escapeHtml4(usermodel.getFirstName().trim());
		String lastName = StringEscapeUtils.escapeHtml4(usermodel.getLastName().trim());
		String idCard = StringEscapeUtils.escapeHtml4(usermodel.getIdCard().trim());
		String phone = StringEscapeUtils.escapeHtml4(usermodel.getPhone().trim());
		String address = StringEscapeUtils.escapeHtml4(usermodel.getAddress().trim());

		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setIdCard(idCard);
		user.setPhone(phone);
		user.setAddress(address);
		userService.save(user);

		model.addAttribute("user", user);
		return "web/editProfile";
	}

	@GetMapping("/change-password")
	public String changePassPage(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/account/login";

		model.addAttribute("user", user);
		return "web/changePassword";
	}

	@PostMapping("/change-password")
	public String changePassword(ModelMap model, @Valid @ModelAttribute("user") UserModel usermodel,
			BindingResult result, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String message = "";

		String currentPw = StringEscapeUtils.escapeHtml4(usermodel.getCurrentpassword());
		String pw = StringEscapeUtils.escapeHtml4(usermodel.getPassword());
		String pw2 = StringEscapeUtils.escapeHtml4(usermodel.getPassword2());
		if (user == null)
			return "redirect:/account/login";

		usermodel.setCurrentpassword(currentPw);
		usermodel.setPassword(pw);
		usermodel.setPassword2(pw2);
		if (currentPw.isEmpty() || pw.isEmpty() || pw2.isEmpty()) {
			model.addAttribute("user", user);
			message = "Mật khẩu nhập lại không chính xác";
			model.addAttribute("messageError", message);
			return "web/changePassword";
		} else if (BCrypt.checkpw(usermodel.getCurrentpassword(), user.getHashedPassword())) {
			if (BCrypt.checkpw(usermodel.getPassword2(), BCrypt.hashpw(usermodel.getPassword(), BCrypt.gensalt()))) {
				user.setHashedPassword(BCrypt.hashpw(usermodel.getPassword(), BCrypt.gensalt()));
				userService.save(user);
				message = "Đổi mật khẩu thành công";
				model.addAttribute("messageSuccess", message);
			} else {
				message = "Mật khẩu nhập lại không chính xác";
				model.addAttribute("messageError", message);
			}
		} else {
			message = "Mật khẩu không chính xác";
			model.addAttribute("messageError", message);
		}

		model.addAttribute("user", user);
		return "web/changePassword";
	}

	@GetMapping("/orders")
	public String listorder(ModelMap model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "redirect:/account/login";
		List<Order> orders = orderService.findAllByUserId(user.get_id());
		List<OrderItem> orderItems = new ArrayList<>();

		for (Order order : orders) {
			List<OrderItem> list = orderItemService.findByOrderId(order.get_id());
			for (OrderItem item : list) {
				orderItems.add(item);
			}
		}
		model.addAttribute("orderitems", orderItems);
		model.addAttribute("orders", orders);
		model.addAttribute("user", user);
		return "web/historyPurchase";
	}
}
