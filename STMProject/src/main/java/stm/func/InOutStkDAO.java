package stm.func;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class InOutStkDAO{
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사 홈페이지에서 찾아야 함.
	private String user = "system";
	private String password = "ekseh123";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";   
	private ConnectionPool pool;
	private InOutStkDTO stk;
	private int result;
	

	public InOutStkDAO() {
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

	public Date stringToDate(InOutStkDTO stk) {
		String inv_date = stk.getInv_date();
		Date trans_date = Date.valueOf(inv_date);
		return trans_date;
	}
	
	public Date stringToDate2(InOutStkDTO stk) {
		String inv_date = stk.getMade_date();
		Date trans_date = Date.valueOf(inv_date);
		return trans_date;
	}

	
	public int insertin(InOutStkDTO stk) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO INVENTORY(DIST, INV_CODE, ITEM_CODE, ITEM_NAME, JOB_CHARGER, INV_DATE, MADE_DATE, "
				+ "PRICE, AMOUNT, INV_DESC, REG_DATE) VALUES ('1', ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		stmt.setString(1, stk.getInv_code());
		stmt.setString(2, stk.getItem_code());
		stmt.setString(3, stk.getItem_name());
		stmt.setString(4, stk.getJob_charger());
		stmt.setDate(5, stringToDate(stk));
		stmt.setDate(6, stringToDate2(stk));
		stmt.setInt(7, stk.getPrice());
		stmt.setInt(8, stk.getAmount());
		stmt.setString(9, stk.getInv_desc());
		
		// * 4. execute Update(sql) : insert, delete, update
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public int insertout(InOutStkDTO stk) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO INVENTORY(DIST, INV_CODE, ITEM_CODE, ITEM_NAME, JOB_CHARGER, INV_DATE, MADE_DATE, "
				+ "PRICE, AMOUNT, INV_DESC, REG_DATE) VALUES ('2', ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		stmt.setString(1, stk.getInv_code());
		stmt.setString(2, stk.getItem_code());
		stmt.setString(3, stk.getItem_name());
		stmt.setString(4, stk.getJob_charger());
		stmt.setDate(5, stringToDate(stk));
		stmt.setDate(6, stringToDate2(stk));
		stmt.setInt(7, stk.getPrice());
		stmt.setInt(8, stk.getAmount());
		stmt.setString(9, stk.getInv_desc());
		
		// * 4. execute Update(sql) : insert, delete, update
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public int updatein(InOutStkDTO stk) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "UPDATE PRODUCTS SET CUR_STOCKS= ((SELECT CUR_STOCKS FROM PRODUCTS WHERE ITEM_CODE = '" 
				+ stk.getItem_code()+"') +" +stk.getAmount() + ") WHERE ITEM_CODE = '" + stk.getItem_code() +"' ";
		result = stmt.executeUpdate(sql);
		System.out.println(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public int updateout(InOutStkDTO stk) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "UPDATE PRODUCTS SET CUR_STOCKS= ((SELECT CUR_STOCKS FROM PRODUCTS WHERE ITEM_CODE = '" 
				+ stk.getItem_code()+"') -" +stk.getAmount() + ") WHERE ITEM_CODE = '" + stk.getItem_code() +"' ";
		System.out.println(sql);
		result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public ArrayList<InOutStkDTO> selectSearch(String searchText, String searchDate) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT CASE WHEN A.DIST = '1' THEN '입고' ELSE '출고' END AS DIST "
				+ "        ,A.INV_CODE "
				+ "        ,A.ITEM_CODE "
				+ "        ,A.ITEM_NAME "
				+ "        ,A.JOB_CHARGER "
				+ "        ,TO_CHAR(A.INV_DATE,'YYYY-MM-DD') AS INV_DATE "
				+ "        ,TO_CHAR(A.MADE_DATE,'YYYY-MM-DD') AS MADE_DATE "
				+ "        ,A.PRICE "
				+ "        ,A.AMOUNT "
				+ "        ,A.PRICE*A.AMOUNT TOT_PRICE "
				+ "        ,NVL(A.INV_DESC, ' ') INV_DESC "
				+ " FROM    INVENTORY A"
				+ " RIGHT OUTER JOIN ("
				+ "                    SELECT  INV_CODE"
				+ "                    FROM    INVENTORY"
				+ "                    WHERE   INV_DATE = TO_DATE('" + searchDate + "','YYYY-MM-DD')"
				+ "                ) B"
				+ " ON A.INV_CODE = B.INV_CODE"
				+ " WHERE   A.ITEM_NAME LIKE '%" + searchText + "%' "
				+ " OR A.INV_CODE LIKE '%" + searchText + "%' "
				+ " OR A.ITEM_CODE LIKE '%" + searchText + "%' "
				+ " OR A.JOB_CHARGER LIKE '%" + searchText + "%' "
				+ " ORDER BY A.REG_DATE DESC";
				
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		InOutStkDTO board = null;
		ArrayList<InOutStkDTO> boards = new ArrayList<InOutStkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new InOutStkDTO(result.getString("DIST"), result.getString("INV_CODE"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME") ,result.getString("JOB_CHARGER")
					,result.getString("INV_DATE"), result.getString("MADE_DATE"), result.getInt("PRICE"), result.getInt("AMOUNT"), result.getInt("TOT_PRICE"), result.getString("INV_DESC"));
			boards.add(board);
		}
		System.out.println("selectSearch():: " +board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}

	
	public ArrayList<InOutStkDTO> selectAll() throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT  CASE WHEN DIST = '1' THEN '입고' ELSE '출고' END AS DIST "
				+ "        ,INV_CODE"
				+ "        ,ITEM_CODE"
				+ "        ,ITEM_NAME"
				+ "        ,JOB_CHARGER"
				+ "        ,TO_CHAR(INV_DATE,'YYYY-MM-DD') AS INV_DATE"
				+ "        ,TO_CHAR(MADE_DATE,'YYYY-MM-DD') AS MADE_DATE"
				+ "        ,PRICE"
				+ "        ,AMOUNT"
				+ "        ,PRICE*AMOUNT TOT_PRICE"
				+ "        ,NVL(INV_DESC, ' ') INV_DESC"
				+ " FROM    INVENTORY"
				+ " ORDER BY REG_DATE DESC ";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		InOutStkDTO board = null;
		ArrayList<InOutStkDTO> boards = new ArrayList<InOutStkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new InOutStkDTO(result.getString("DIST"), result.getString("INV_CODE"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME") ,result.getString("JOB_CHARGER")
					,result.getString("INV_DATE"), result.getString("MADE_DATE"), result.getInt("PRICE"), result.getInt("AMOUNT"), result.getInt("TOT_PRICE"), result.getString("INV_DESC"));
			boards.add(board);
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}
	
	public ArrayList<InOutStkDTO> selectDetail(String item_code) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "SELECT  CASE WHEN DIST = '1' THEN '입고' ELSE '출고' END AS DIST "
				+ "        ,INV_CODE"
				+ "        ,ITEM_CODE"
				+ "        ,ITEM_NAME"
				+ "        ,JOB_CHARGER"
				+ "        ,TO_CHAR(INV_DATE,'YYYY-MM-DD') AS INV_DATE"
				+ "        ,TO_CHAR(MADE_DATE,'YYYY-MM-DD') AS MADE_DATE"
				+ "        ,PRICE"
				+ "        ,AMOUNT"
				+ "        ,PRICE*AMOUNT TOT_PRICE"
				+ "        ,NVL(INV_DESC, ' ') INV_DESC"
				+ " FROM    INVENTORY"
				+ " WHERE ITEM_CODE = '" + item_code + "'"
				+ " ORDER BY REG_DATE DESC ";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		InOutStkDTO board = null;
		ArrayList<InOutStkDTO> boards = new ArrayList<InOutStkDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		
		while (result.next()) {
			board  = new InOutStkDTO(result.getString("DIST"), result.getString("INV_CODE"), result.getString("ITEM_CODE"), result.getString("ITEM_NAME") ,result.getString("JOB_CHARGER")
					,result.getString("INV_DATE"), result.getString("MADE_DATE"), result.getInt("PRICE"), result.getInt("AMOUNT"), result.getInt("TOT_PRICE"), result.getString("INV_DESC"));
			boards.add(board);
		}
		System.out.println("why " + board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}
	
	public StkDTO select(StkDTO stk) throws SQLException {
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT CUR_STOCKS FROM PRODUCTS WHERE ITEM_CODE = '" + stk.getItem_code()+"'";
		System.out.println("select CUR_STOCKS()::" + sql);
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

	public void setStk(InOutStkDTO stk) {
		this.stk = stk;
	}

	
	public int getResult() {
		return result;
	}
}