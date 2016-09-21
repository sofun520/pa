package cn.springmvc.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonIgnore;

public class PageComponent<T> {

	private int page;
	private int total;
	private int pageCount;
	private int pageSize;

	@JsonIgnore
	private List<T> list;
	@JsonIgnore
	public Map<String, Object> context = null;

	public PageComponent(int page, int total, int pageSize, List<T> list) {
		this.page = page;
		this.total = total;
		this.pageSize = pageSize;
		this.pageCount = (total + pageSize - 1) / pageSize;
		context = new HashMap<String, Object>();
		context.put("page", page);
		context.put("total", total);
		context.put("pageCount", pageCount);
		this.list = list;
	}

	public static void init(int page, int pageSize, Map<String, Object> map) {
		map.put("startIndex", (page - 1) * pageSize);
		map.put("pageSize", pageSize);
	}

	public Map<String, Object> getContext() {
		return context;
	}

	public void setContext(Map<String, Object> context) {
		this.context = context;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
