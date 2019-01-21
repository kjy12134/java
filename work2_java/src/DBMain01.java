import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
				+ "FROM PRODUCT INNER JOIN STORE USING (PDNO) INNER JOIN FACTORY USING (FACTNO) "
				+ "WHERE (STAMOUNT IS NULL OR STAMOUNT = 0) AND FACLOC = ?";
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWD);
			pstmt = conn.prepareStatement(selectSQL);
			pstmt.setString(1, "SEOUL");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1)+"\t"
						+rs.getString(2)+"\t"
						+rs.getString(3)+"\t"
						+rs.getString(4)+"\t"
						+rs.getString(5)+"\t");
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
