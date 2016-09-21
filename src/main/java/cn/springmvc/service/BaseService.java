package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.util.PageComponent;

public interface BaseService<T> {

	public void insert(T t);

	public void update(T t);

	public List<T> query(Map<String, Object> map);

	public void delete(Integer id);

	public T find(Integer id);

	public int count(Map<String, Object> map);

	public PageComponent<T> pageService(int page, int pageSize,
			Map<String, Object> map);

}
