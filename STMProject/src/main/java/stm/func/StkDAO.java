package stm.func;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class StkDAO{
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사 홈페이지에서 찾아야 함.
	private String user = "system";
	private String password = "ekseh123";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";   
	private ConnectionPool pool;
	private StkDTO stk;
	private int result;
	

	public StkDAO() {
		super();
		//jdbc 1단계
		try {
			Class.forName(jdbcclass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//jdbc Connection 관리 -> ConnectionPool이 관리
		try {
			pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * web request data에 아래와 같은 데이터 필요	
	 * 	: item_code(변경 후 코드), old_item_code(변경 전 코드) 
	 * @param stk : 변경할 데이터 객체
	 * @param oldStkCode : 변경전 코드(키값)
	 * @return : 변경된 레코드 갯수
	 * @throws SQLException
	 */
	public int update(StkDTO stk, String oldStkCode) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "UPDATE PRODUCTS SET CATEGORY="
				+ "'"+stk.getCategory()+"',"
				+ " ITEM_CODE="
				+ "'"+stk.getItem_code()+"', "
				+ " ITEM_NAME="
				+ "'"+stk.getItem_name()+"', "
				+ " MANUFACTURER="
				+ "'"+stk.getManufacturer()+"', "
				+ " ITEM_DESC="
				+ "'"+stk.getItem_desc()+"'"
				+ " WHERE ITEM_CODE = '" + oldStkCode +"' ";
		result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	

	
	public int insert(StkDTO stk) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO PRODUCTS(CATEGORY, ITEM_CODE, ITEM_NAME, MANUFACTURER, MIN_STOCKS, CUR_STOCKS, ITEM_DESC, REG_DATE) "
				+ " VALUES (?, ?, ?, ?, ?, 0, NVL(?,' '), sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		System.out.println(stk.getCategory());
		System.out.println(stk.getItem_code());
		System.out.println(stk.getItem_name());
		System.out.println(stk.getManufacturer());
		System.out.println(stk.getMin_stocks());
		System.out.println(stk.getItem_desc());
		
		stmt.setString(1, stk.getCategory());
		stmt.setString(2, stk.getItem_code());
		stmt.setString(3, stk.getItem_name());
		stmt.setString(4, stk.getManufacturer());
		stmt.setInt(5, stk.getMin_stocks());
		stmt.setString(6, stk.getItem_desc());

		// * 4. execute Update(sql) : insert, delete, update
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	
	public int delete(String item_code) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "DELETE FROM PRODUCTS WHERE ITEM_CODE = '"+ item_code+"' "; 
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	

	public StkDTO select(StkDTO stk) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT  CATEGORY"
				+ "        ,A.ITEM_CODE ITEM_CODE" 
				+ "        ,A.ITEM_NAME ITEM_NAME"
				+ "        ,A.MANUFACTURER MANUFACTURER"
				+ "        ,ROUND(B.PRICE/B.CNT,2) IN_AVG_PRICE"
				+ "        ,ROUND(C.PRICE/C.CNT,2) OUT_AVG_PRICE"
				+ "        ,A.MIN_STOCKS MIN_STOCKS"
				+ "        ,A.CUR_STOCKS CUR_STOCKS"
				+ "        ,A.ITEM_DESC ITEM_DESC"
				+ " FROM    PRODUCTS A"
				+ " LEFT OUTER JOIN     ("
				+ "                        SELECT  ITEM_CODE"
				+ "                                ,SUM(PRICE*AMOUNT) PRICE"
				+ "                                ,SUM(AMOUNT) CNT"		
				+ "                        FROM    INVENTORY"
				+ "                        WHERE DIST = '1'"
				+ "                        GROUP BY ITEM_CODE"
				+ "                    ) B"
				+ " ON A.ITEM_CODE = B.ITEM_CODE"
				+ " LEFT OUTER JOIN     ("
				+ "                        SELECT  ITEM_CODE"
				+ "                                ,SUM(PRICE*AMOUNT) PRICE"
				+ "                                ,SUM(AMOUNT) CNT"		
				+ "                                FROM    INVENTORY"
				+ "                                WHERE DIST = '2'"
				+ "                                GROUP BY ITEM_CODE"
				+ "                    ) C"
				+ " ON A.ITEM_CODE = C.ITEM_CODE"
				+ " WHERE   A.ITEM_CODE = '" + stk.getItem_code()+"'";
		System.out.println("select()::" + sql);
		System.out.println("Parameter :: " + stk);
		
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		StkDTO board = null;
		// * 5. result ( , int, recordset)
		// * 6. get data
		System.out.println(result);   // System.out.println(result.next()); result.next()는 두 번 부르면 안 된다.(데이터가 넘어가버림)
		while (result.next()) {
			board  = new StkDTO(result.getString("CATEGORY"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME"), result.getString("MANUFACTURER"), 
					result.getInt("IN_AVG_PRICE"), result.getInt("OUT_AVG_PRICE"), result.getInt("MIN_STOCKS"), result.getInt("CUR_STOCKS"), result.getString("ITEM_DESC"));
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return board;
	}
	
	
	public ArrayList<StkDTO> selectAll() throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM PRODUCTS ORDER BY REG_DATE DESC";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		StkDTO board = null;
		ArrayList<StkDTO> boards = new ArrayList<StkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new StkDTO(result.getString("CATEGORY"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME"), result.getString("MANUFACTURER"), 
				 result.getInt("MIN_STOCKS"), result.getInt("CUR_STOCKS"), result.getString("ITEM_DESC"));
			boards.add(board);
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}
	
	public ArrayList<StkDTO> selectSearch(String searchText) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM PRODUCTS WHERE ITEM_NAME LIKE '%" + searchText + "%'";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		StkDTO board = null;
		ArrayList<StkDTO> boards = new ArrayList<StkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new StkDTO(result.getString("CATEGORY"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME"), result.getString("MANUFACTURER"), 
				 result.getInt("MIN_STOCKS"), result.getInt("CUR_STOCKS"), result.getString("ITEM_DESC"));
			boards.add(board);
		}
		System.out.println("selectSearch():: " +board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}
	
	
	public ArrayList<StkDTO> selectOut() throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM PRODUCTS WHERE CUR_STOCKS <> 0";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		StkDTO board = null;
		ArrayList<StkDTO> boards = new ArrayList<StkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new StkDTO(result.getString("CATEGORY"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME"), result.getString("MANUFACTURER"), 
					result.getInt("IN_AVG_PRICE"), result.getInt("OUT_AVG_PRICE"), result.getInt("MIN_STOCKS"), result.getInt("CUR_STOCKS"), result.getString("ITEM_DESC"));
			boards.add(board);
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}

	public void setStk(StkDTO stk) {
		this.stk = stk;
	}
	
	public int getResult() {
		return result;
	}
	
	
}