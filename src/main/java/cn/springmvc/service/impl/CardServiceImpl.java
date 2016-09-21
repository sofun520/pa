package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.CardMapper;
import cn.springmvc.model.Card;
import cn.springmvc.service.CardService;
import cn.springmvc.util.PageComponent;

@Service
public class CardServiceImpl implements CardService {

	@Autowired
	private CardMapper dao;

	public void insert(Card t) {
		dao.insert(t);
	}

	public void update(Card t) {
		dao.update(t);
	}

	public List<Card> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public Card find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public PageComponent<Card> pageService(int page, int pageSize,
			Map<String, Object> map) {
		int total = dao.count(map);
		PageComponent.init(page, pageSize, map);
		return new PageComponent<Card>(page, total, pageSize, dao.query(map));
	}

}
