package stm.func;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Web Service 객체
 * -. Controller에서 요청한 서비스를 실제 구현하는 것.
 * -. 요청에 따라 DAO를 통해 DB의 결과를 받아오는 것
 * -. 결과값에 따라 view에 보여줄 실제 문자열 데이터를 구현하는 것.
 */
public class StkService {
	private String result;
	private StkDAO db;
	
	public String getResult() {
		return result;
	}
	
	public void setDb(StkDAO db) {
		this.db = db;
	}
	
	public StkService() {
		super();
		db = new StkDAO();
	}
	
	public StkService(StkDAO db) {
		super();
		this.db = db;
	}
	

	public int update(StkDTO stk, String oldStkCode) throws SQLException {
		int result = db.update(stk, oldStkCode);
		return result;
	}
	

	public StkDTO select(StkDTO stk) throws SQLException {
		System.out.println("StkService::select()\n" + stk);
		
		StkDTO result = db.select(stk);
		return result;
	}
	
	public ArrayList<StkDTO> selectAll() throws SQLException {
		ArrayList<StkDTO> result = db.selectAll();
		return result;
	}
}
