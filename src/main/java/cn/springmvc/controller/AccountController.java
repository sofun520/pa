package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import cn.springmvc.model.Account;
import cn.springmvc.model.PageResult;
import cn.springmvc.service.AccountService;
import cn.springmvc.util.PageComponent;

import com.alibaba.fastjson.JSONObject;

@Controller
public class AccountController {

	@Autowired
	private AccountService service;

	@RequestMapping("/mvc/account/query")
	public ModelAndView query(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			int page = Integer
					.parseInt(request.getParameter("page") == null ? "1"
							: request.getParameter("page"));
			// map.put("page", page);
			PageComponent<Account> pageC = service.pageService(page, 15, map);
			context = pageC.getContext();
			context.put("list", pageC.getList());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("account/query", context);
	}

	@RequestMapping("/mvc/account/delete")
	public ModelAndView delete(HttpServletRequest request) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			service.delete(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/mvc/account/save")
	public ModelAndView save(HttpServletRequest request, Account account) {
		try {
			if (account.getaId() == null) {
				account.setaDate(new Date());
				service.insert(account);
			} else {
				service.update(account);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("redirect:query.do");
	}

	/*
	 * ======================接口=====================================
	 */

	@RequestMapping("/api/account/query")
	@ResponseBody
	public PageResult apiquery(HttpServletRequest request) {
		PageResult pr = null;
		JSONObject data = new JSONObject();
		try {
			int page = request.getParameter("page") == null ? 1 : Integer
					.parseInt(request.getParameter("page"));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			PageComponent<Account> pageC = service.pageService(page, 10, map);
			data.put("datas", pageC.getList());
			data.put("pageBean", pageC);

			pr = new PageResult(PageResult.SUCCESS, "查询成功", data);
		} catch (Exception ex) {
			ex.printStackTrace();
			pr = new PageResult(PageResult.FAILED, "内部错误", null);
		}
		return pr;
	}

	@RequestMapping("/api/account/save")
	@ResponseBody
	public PageResult apisave(HttpServletRequest request, Account account) {
		PageResult pr = null;
		try {
			if (account.getaId() != null) {
				service.insert(account);
			} else {
				service.update(account);
			}
			pr = new PageResult(PageResult.SUCCESS, "保存成功", null);
		} catch (Exception ex) {
			ex.printStackTrace();
			pr = new PageResult(PageResult.FAILED, "保存失败:内部程序错误", null);
		}
		return pr;
	}

	/*
	 * ======================手机版=====================================
	 */

	@RequestMapping("/mobile/account/query")
	public ModelAndView test(HttpServletRequest request) {

		Map<String, Object> context = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Account> list = service.query(map);
			context.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/account", context);
	}

	@RequestMapping("/mobile/account/add")
	public ModelAndView add(HttpServletRequest request) {

		Map<String, Object> context = new HashMap<String, Object>();
		try {

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/accountAdd", context);
	}

	@RequestMapping("/mobile/account/save")
	@ResponseBody
	public PageResult mobilesave(HttpServletRequest request, Account account) {
		PageResult pr = null;
		try {
			if (!StringUtils.isEmpty(account.getaId())) {
				account.setaDate(new Date());
				service.update(account);
			} else {
				account.setaDate(new Date());
				service.insert(account);
			}
			pr = new PageResult("0", "数据写入成功", null);
		} catch (Exception ex) {
			pr = new PageResult("1", "数据写入失败：程序内部错误", null);
			ex.printStackTrace();
		}
		return pr;
	}

}
