package com.webproject.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.webproject.entity.Delivery;
import com.webproject.model.DeliveryModel;
import com.webproject.service.DeliveryService;

@SuppressWarnings("deprecation")
@Controller
@RequestMapping("admin/delivery")
public class AdminDeliveryController {

	@Autowired
	DeliveryService deliveryService;

	@RequestMapping("{index}")
	public String User(ModelMap modelMap, @PathVariable("index") Integer index) {
		if (index == null) {
			index = 1;
		}
		Page<Delivery> usPage = deliveryService.page(index - 1, 6);
		List<Delivery> deliveries = usPage.getContent();
		modelMap.addAttribute("listDelivery", deliveries);
		modelMap.addAttribute("page", usPage);
		return "admin/Table/delivery";
	}

	@GetMapping("add")
	public String create(ModelMap model) {

		DeliveryModel deliveryModel = new DeliveryModel();
		deliveryModel.setIsEdit(false);
		model.addAttribute("delivery", deliveryModel);

		return "admin/Table/add_delivery";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("delivery") DeliveryModel deliveryModel,
			@RequestParam("priceD") String priceD, HttpServletRequest request, BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("admin/Table/add_delivery");
		}

		Delivery delivery = new Delivery();

		String price = StringEscapeUtils.escapeHtml4((priceD));
		if (isInteger(priceD)) {

			String name = StringEscapeUtils.escapeHtml4(deliveryModel.getName());
			String desc = StringEscapeUtils.escapeHtml4(deliveryModel.getDescription());
			BeanUtils.copyProperties(deliveryModel, delivery);

			delivery.setName(name);
			delivery.setDescription(desc);
			delivery.setPrice(Integer.parseInt(price));

			if (deliveryModel.getIsEdit() == true) {
				delivery.set_id(Long.parseLong(request.getParameter("_id")));
			}
			deliveryService.save(delivery);
			String message = "";
			if (deliveryModel.getIsEdit() == true) {
				message = "Delivery cập nhật thành công";

			} else {
				message = "Delivery được thêm thành công";
			}
			model.addAttribute("message", message);
			return new ModelAndView("forward:/admin/delivery/1", model);

		} else {
			return new ModelAndView("forward:/admin/delivery/1", model);
		}

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Long id) {
		Optional<Delivery> optional = deliveryService.findById(id);

		DeliveryModel deliveryModel = new DeliveryModel();
		if (optional.isPresent()) {
			Delivery delivery = optional.get();
			BeanUtils.copyProperties(delivery, deliveryModel);
			deliveryModel.setIsEdit(true);
			model.addAttribute("delivery", deliveryModel);
			return new ModelAndView("admin/Table/add_delivery", model);
		}
		model.addAttribute("message", "Category không tồn tại");
		return new ModelAndView("forward:/admin/delivery/1", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Long id) {
		deliveryService.deleteById(id);

		model.addAttribute("message", "Delivery đã được xóa thành công");

		return new ModelAndView("forward:/admin/delivery/1", model);
	}

	public boolean isInteger(String s) {
		if (s.isEmpty())
			return false;
		try {
			Integer.parseInt(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

}
