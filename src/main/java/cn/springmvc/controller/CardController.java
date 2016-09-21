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
import cn.springmvc.model.PageResult;
import cn.springmvc.service.CardService;
import cn.springmvc.util.PageComponent;

import com.alibaba.fastjson.JSONObject;

@Controller
public class CardController {

	@Autowired
	private CardService service;

	@RequestMapping("/mvc/card/query")
	public ModelAndView query(HttpServletRequest request) {

		Map<String, Object> context = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			int page = Integer
					.parseInt(request.getParameter("page") == null ? "1"
							: request.getParameter("page"));
			// map.put("page", page);
			PageComponent<Card> pageC = service.pageService(page, 15, map);
			context = pageC.getContext();

			context.put("list", pageC.getList());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("card/query", context);
	}

	@RequestMapping("/mvc/card/save")
	@ResponseBody
	public ModelAndView save(HttpServletRequest request, Card card) {
		// JSONObject data = new JSONObject();
		// PageResult pr = null;
		try {
			if (card.getCardId() == null) {
				card.setCardAddDate(new Date());
				service.insert(card);
			} else {
				service.update(card);
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

	@RequestMapping("/mvc/card/delete")
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

	@RequestMapping("/api/card/query")
	@ResponseBody
	public PageResult apiquery(HttpServletRequest request) {
		PageResult pr = null;
		JSONObject data = new JSONObject();
		try {
			int page = request.getParameter("page") == null ? 1 : Integer
					.parseInt(request.getParameter("page"));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			PageComponent<Card> pageC = service.pageService(page, 10, map);
			data.put("datas", pageC.getList());
			data.put("pageBean", pageC);

			pr = new PageResult(PageResult.SUCCESS, "查询成功", data);
		} catch (Exception ex) {
			ex.printStackTrace();
			pr = new PageResult(PageResult.FAILED, "内部错误", null);
		}
		return pr;
	}

	@RequestMapping("/api/card/save")
	@ResponseBody
	public PageResult apisave(HttpServletRequest request, Card card) {
		PageResult pr = null;
		try {
			if (card.getCardId() != null) {
				service.insert(card);
			} else {
				service.update(card);
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

	@RequestMapping("/mobile/card/query")
	public ModelAndView test(HttpServletRequest request) {

		Map<String, Object> context = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Card> list = service.query(map);
			context.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/card", context);
	}

	@RequestMapping("/mobile/card/add")
	public ModelAndView add(HttpServletRequest request) {

		Map<String, Object> context = new HashMap<String, Object>();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Card> list = service.query(map);
			context.put("list", list);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return new ModelAndView("mobile/cardAdd", context);
	}

	@RequestMapping("/mobile/card/save")
	@ResponseBody
	public PageResult mobilesave(HttpServletRequest request, Card card) {
		PageResult pr = null;
		try {
			if (!StringUtils.isEmpty(card.getCardId())) {
				card.setCardAddDate(new Date());
				service.update(card);
			} else {
				card.setCardAddDate(new Date());
				service.insert(card);
			}
			pr = new PageResult("0", "数据写入成功", null);
		} catch (Exception ex) {
			pr = new PageResult("1", "数据写入失败：程序内部错误", null);
			ex.printStackTrace();
		}
		return pr;
	}
}
