package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.CashMapper;
import cn.springmvc.model.Cash;
import cn.springmvc.service.CashService;
import cn.springmvc.util.PageComponent;

@Service
public class CashServiceImpl implements CashService {

	@Autowired
	private CashMapper dao;

	public void insert(Cash t) {
		dao.insert(t);
	}

	public void update(Cash t) {
		dao.update(t);
	}

	public List<Cash> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public Cash find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public PageComponent<Cash> pageService(int page, int pageSize,
			Map<String, Object> map) {
		int total = dao.count(map);
		PageComponent.init(page, pageSize, map);
		return new PageComponent<Cash>(page, total, pageSize, dao.query(map));
	}

}
