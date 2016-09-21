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

import cn.springmvc.model.Card;
import cn.springmvc.model.Cash;
import cn.springmvc.model.PageResult;
import cn.springmvc.service.CardService;
import cn.springmvc.service.CashService;
import cn.springmvc.util.PageComponent;

import com.alibaba.fastjson.JSONObject;

@Controller
public class CashController {

	@Autowired
	private CashService service;

	@Autowired
	private CardService cardService;

	@RequestMapping("/mvc/cash/query")
	public ModelAndView query(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			List<Card> cardList = cardService.query(map);

			int page = Integer
					.parseInt(request.getParameter("page") == null ? "1"
							: request.getParameter("page"));
			// map.put("page", page);
			PageComponent<Cash> pageC = service.pageService(page, 15, map);
			context = pageC.getContext();
			context.put("list", pageC.getList());
			context.put("cardList", cardList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("cash/query", context);
	}

	@RequestMapping("/mvc/cash/save")
	public ModelAndView save(HttpServletRequest request, Cash cash) {
		// JSONObject data = new JSONObject();
		// PageResult pr = null;
		try {
			if (cash.getCashId() == null) {
				cash.setCashDate(new Date());
				service.insert(cash);
			} else {
				service.update(cash);
			}
			// pr = new PageResult(PageResult.SUCCESS, "数据写入成功", null, null);
		} catch (Exception ex) {
			ex.printStackTrace();
			// pr = new PageResult(PageResult.FAILED, "数据写入失败：内部错误", null,
			// null);
		}
		// data.put(PageResult.DATA, pr);
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/mvc/cash/delete")
	public ModelAndView delete(HttpServletRequest request) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			service.delete(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("redirect:query.do");
	}

	/*
	 * ======================接口=====================================
	 */

	@RequestMapping("/api/cash/query")
	@ResponseBody
	public JSONObject apiquery(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		try {
			int page = request.getParameter("page") == null ? 1 : Integer
					.parseInt(request.getParameter("page"));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			PageComponent<Cash> pageC = service.pageService(page, 10, map);
			data.put("datas", pageC.getList());
			data.put("pageBean", pageC);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return data;
	}

	@RequestMapping("/api/cash/save")
	@ResponseBody
	public PageResult apisave(HttpServletRequest request, Cash cash) {
		PageResult pr = null;
		try {
			if (cash.getCashId() != null) {
				service.insert(cash);
			} else {
				service.update(cash);
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

	@RequestMapping("/mobile/cash/query")
	public ModelAndView test(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			List<Card> cardList = cardService.query(map);

			int page = Integer
					.parseInt(request.getParameter("page") == null ? "1"
							: request.getParameter("page"));
			// map.put("page", page);
			PageComponent<Cash> pageC = service.pageService(page, 15, map);
			context = pageC.getContext();
			context.put("list", pageC.getList());
			context.put("cardList", cardList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/cash", context);
	}

	@RequestMapping("/mobile/cash/add")
	public ModelAndView add(HttpServletRequest request) {
		Map<String, Object> context = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Card> cardList = cardService.query(map);
			context.put("cardList", cardList);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/cashAdd", context);
	}

	@RequestMapping("/mobile/cash/save")
	@ResponseBody
	public PageResult mobilesave(HttpServletRequest request, Cash cash) {
		PageResult pr = null;
		try {
			if (!StringUtils.isEmpty(cash.getCashId())) {
				cash.setCashDate(new Date());
				service.update(cash);
			} else {
				cash.setCashDate(new Date());
				service.insert(cash);
			}
			pr = new PageResult("0", "数据写入成功", null);
		} catch (Exception ex) {
			pr = new PageResult("1", "数据写入失败：内部程序错误", null);
			ex.printStackTrace();
		}
		return pr;
	}

}
