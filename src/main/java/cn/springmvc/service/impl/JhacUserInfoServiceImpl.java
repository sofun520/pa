package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacUserInfoMapper;
import cn.springmvc.model.JhacUserInfo;
import cn.springmvc.service.JhacUserInfoService;
import cn.springmvc.util.PageComponent;

@Service
public class JhacUserInfoServiceImpl implements JhacUserInfoService {

	@Autowired
	private JhacUserInfoMapper dao;

	public void insert(JhacUserInfo t) {
		dao.insert(t);
	}

	public void update(JhacUserInfo t) {
		dao.update(t);
	}

	public List<JhacUserInfo> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacUserInfo find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public PageComponent<JhacUserInfo> pageService(int page, int pageSize,
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
