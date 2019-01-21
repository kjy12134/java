package com.sinc.factory;

import java.util.List;

public class FactoryBiz {

	private FactoryDAO dao;
	
	public FactoryBiz() {
		dao = new FactoryDAO();
	}
	
	public List<FactoryVO> getFactoryAll() {
		return dao.getFactoryAll();
	}
}
