package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.RoleMapper;
import cn.springmvc.model.Role;
import cn.springmvc.service.RoleService;
import cn.springmvc.util.PageComponent;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper dao;

	public void insert(Role t) {
		dao.insert(t);
	}

	public void update(Role t) {
		dao.update(t);
	}

	public List<Role> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public Role find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public PageComponent<Role> pageService(int page, int pageSize,
			Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
