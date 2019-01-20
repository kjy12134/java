package com.sinc.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class FactoryDAO {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String USER = "hr";
	private static final String PWD = "hr";

	public FactoryDAO() {

	}

	public List<Object> getFactoryAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSql = "SELECT FACTNO, FACNAME, FACLOC FROM FACTORY";
		List<Object> obj = new Vector<>();

		try {
			Class.forName(DRIVER);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(selectSql);
			rs = pstmt.executeQuery();
			FactoryVO vo = null;

			while (rs.next()) {
				vo = new FactoryVO(rs.getString(1), rs.getString(2), rs.getString(3));
				obj.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}
}
