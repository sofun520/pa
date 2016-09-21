package cn.springmvc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.MaxCodeMapper;
import cn.springmvc.model.MaxCode;
import cn.springmvc.service.MaxCodeService;
import cn.springmvc.util.PageComponent;

@Service
public class MaxCodeServiceImpl implements MaxCodeService {

	@Autowired
	private MaxCodeMapper dao;

	public void insert(MaxCode t) {

	}

	public void update(MaxCode t) {

	}

	public List<MaxCode> query(Map<String, Object> map) {
		return null;
	}

	public void delete(Integer id) {

	}

	public MaxCode find(Integer id) {
		return null;
	}

	public int count(Map<String, Object> map) {
		return 0;
	}

	public void queryCode(Map<String, Object> map) {
		dao.queryCode(map);
	}

	public String getCode(String prefix) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", prefix);
		map.put("xcode", "");
		dao.queryCode(map);
		return (String) map.get("xcode");
	}

	public PageComponent<MaxCode> pageService(int page, int pageSize,
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}
