import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBMain02 {

	public static final String DRIVER 	= "oracle.jdbc.driver.OracleDriver";
	public static final String URL		= "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final String USER 	= "hr";
	public static final String PWD		= "hr";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSql = "SELECT PDSUBNAME, PDCOST, PDPRICE "
				+ "FROM PRODUCT "
				+ "WHERE PDCOST > (SELECT MIN(PDCOST) FROM PRODUCT WHERE PDNAME = ?)"
				+ "AND PDCOST < (SELECT MAX(PDCOST) FROM PRODUCT WHERE PDNAME = ?)";
		try {
			Class.forName(DRIVER);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(selectSql);
			pstmt.setString(1, "TV");
			pstmt.setString(2, "CELLPHONE");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getString(1) + "\t"
						+ rs.getString(2) + "\t"
						+ rs.getString(3));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
