package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacAdmin;
import cn.springmvc.service.JhacAdminService;

import com.alibaba.fastjson.JSONObject;

@Controller
// @RequestMapping("/")
public class WebController {

	@Autowired
	private JhacAdminService service;

	@RequestMapping("/test")
	@ResponseBody
	public JSONObject index() {
		List<JhacAdmin> list = service.query(new HashMap<String, Object>());
		JSONObject re = new JSONObject();
		re.put("data", list);
		return re;
	}

	@RequestMapping("/login")
	public ModelAndView test() {
		return new ModelAndView("login");
	}

	@RequestMapping("/registe")
	public ModelAndView registe() {

		Map<String, Object> context = new HashMap<String, Object>();
		return new ModelAndView("registe", context);
	}

	@RequestMapping("/adminLogin")
	public ModelAndView configLogin() {
		return new ModelAndView("admin/login");
	}

	@RequestMapping("/admin/home")
	public ModelAndView home() {
		return new ModelAndView("admin/home");
	}

}
