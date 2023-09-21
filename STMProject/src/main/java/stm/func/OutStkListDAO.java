package stm.func;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class OutStkListDAO{
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database마다 url은 모두 다르다. 각 DB회사 홈페이지에서 찾아야 함.
	private String user = "system";
	private String password = "ekseh123";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver";   
	private ConnectionPool pool;
	private OutStkDTO stk;
	private int result;
	

	public OutStkListDAO() {
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

	public int insert(OutStkDTO stk) throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		String sql = "INSERT INTO INVENTORY_OUT(INV_OUT_CODE, ITEM_CODE, ITEM_NAME, JOB_CHARGER, INV_OUT_DATE, MADE_DATE, "
				+ "OUT_PRICE, OUT_AMOUNT) " + 
				" VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println("dd" + stk.getInv_out_code());
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		stmt.setString(1, stk.getInv_out_code());
		stmt.setString(2, stk.getItem_code());
		stmt.setString(3, stk.getItem_name());
		stmt.setString(4, stk.getJob_charger());
		stmt.setString(5, stk.getInv_out_date());
		stmt.setString(6, stk.getMade_date());
		stmt.setInt(7, stk.getOut_price());
		stmt.setInt(8, stk.getOut_amount());
		
		// * 4. execute Update(sql) : insert, delete, update
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	public int getInsert() throws SQLException, ClassNotFoundException {
		Connection conn = pool.getConnection();
		System.out.println("dd" + stk.getInv_out_code());
		String sql = "INSERT INTO INVENTORY_OUT(INV_OUT_CODE, ITEM_CODE, ITEM_NAME, JOB_CHARGER, INV_OUT_DATE, MADE_DATE, "
				+ "OUT_PRICE, OUT_AMOUNT) " + 
				" VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(sql);
		stmt.setString(1, stk.getInv_out_code());
		stmt.setString(2, stk.getItem_code());
		stmt.setString(3, stk.getItem_name());
		stmt.setString(4, stk.getJob_charger());
		stmt.setString(5, stk.getInv_out_date());
		stmt.setString(6, stk.getMade_date());
		stmt.setInt(7, stk.getOut_price());
		stmt.setInt(8, stk.getOut_amount());
		
		// * 4. execute Update(sql) : insert, delete, update
		result = stmt.executeUpdate();
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}

	public void setStk(OutStkDTO stk) {
		this.stk = stk;
	}
	
	public int getResult() {
		return result;
	}
}