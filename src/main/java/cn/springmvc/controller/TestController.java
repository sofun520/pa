package cn.springmvc.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping("/mvc/test/query")
	public ModelAndView query(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("test/query", context);
	}

	@RequestMapping("/mvc/test/test")
	public ModelAndView test(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("test/test", context);
	}

}
