import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class DBMain01 {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static final String USER = "hr";
	public static final String PASSWD = "hr";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectSQL = "SELECT PDNAME, PDSUBNAME, FACNAME, STONAME, NVL(STAMOUNT, 0) "
				+ "FROM PRODUCT LEFT JOIN STORE (PDNO) LEFT JOIN FACTORY (FACTNO) "
				+ "WHERE STAMOUNT IS NULL AND FACLOC = ?";
		Vector<Object> vec = new Vector<Object>();
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setString(1, "SEOUL");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
			}
			
		} catch (Exception e) {
			
		}
		
		

		
		
	}

}

/* SELECT PDNAME, PDSUBNAME, FACTNO, STONAME, NVL(STAMOUNT, 0)
 * FROM PRODUCT
 * RIGHT JOIN STORE (PDNO)
 * WHERE 
 */
