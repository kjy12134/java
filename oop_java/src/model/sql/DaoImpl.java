package model.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import model.util.Dao;
import model.vo.DeptVO;

public class DaoImpl implements Dao {

	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final String USER = "hr";
	public static final String PASSWD = "hr";

	public DaoImpl() { // 1. Driver Loading
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Object> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		String selectSQL = "SELECT DEPT_ID, DEPT_NAME, LOC_ID FROM DEPARTMENT";
		List<Object> vec = new Vector<Object>(); // Vector<DeptVO> 로 하면 안됨...

		try {
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			pstmt = conn.prepareStatement(selectSQL);
			rest = pstmt.executeQuery();

			while (rest.next()) {
				DeptVO entity = new DeptVO(rest.getString(1), rest.getString(2), rest.getString(3));
				vec.add(entity);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vec;
	}

	@Override
	public Object selectOne(Object key) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		String selectSQL = "SELECT DEPT_ID, DEPT_NAME, LOC_ID FROM DEPARTMENT WHERE DEPT_ID = ? ";
		DeptVO entity = null;

		try {
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setString(1, (String) key);
			rest = pstmt.executeQuery();
			if (rest.next()) {
				entity = new DeptVO(rest.getString(1), rest.getString(2), rest.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return entity;
	}

	@Override
	public int insert(Object obj) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String insertSQL = "INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME, LOC_ID) VALUES (?, ?, ?) ";
		int flag = 0;

		try {
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			pstmt = conn.prepareStatement(insertSQL);
			pstmt.setString(1, ((DeptVO) obj).getDept_id());
			pstmt.setString(2, ((DeptVO) obj).getDept_name());
			pstmt.setString(3, ((DeptVO) obj).getLoc_id());
			flag = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public int update(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

}
