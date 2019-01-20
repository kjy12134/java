package com.sinc.factory;

public class FactoryVO {

	private String facno, facname, facloc;

	public FactoryVO() {

	}

	public FactoryVO(String facno, String facname, String facloc) {
		this.facno = facno;
		this.facname = facname;
		this.facloc = facloc;
	}

	public String getFacno() {
		return facno;
	}

	public String getFacname() {
		return facname;
	}

	public String getFacloc() {
		return facloc;
	}

}
