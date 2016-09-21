package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.AccountMapper;
import cn.springmvc.model.Account;
import cn.springmvc.service.AccountService;
import cn.springmvc.util.PageComponent;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountMapper dao;

	public void insert(Account t) {
		dao.insert(t);
	}

	public void update(Account t) {
		dao.update(t);
	}

	public List<Account> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public Account find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public PageComponent<Account> pageService(int page, int pageSize,
			Map<String, Object> map) {
		int total = dao.count(map);
		PageComponent.init(page, pageSize, map);
		return new PageComponent<Account>(page, total, pageSize, dao.query(map));
	}

}
