package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.Menu;
import cn.springmvc.service.MenuService;

@Controller
public class MobileWebController {

	@Autowired
	private MenuService menuService;

	@RequestMapping("/mobileLogin")
	public ModelAndView login(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/login", context);
	}

	@RequestMapping("/mobile/home")
	public ModelAndView home(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/home", context);
	}

	@RequestMapping("/mobile/menu")
	public ModelAndView menu(HttpServletRequest request) {
		Map<String, Object> context = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Menu> list = menuService.query(map);
			context.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/menu", context);
	}
}
