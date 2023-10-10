package stm.func;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LoginDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database 접속 url, 각 DB회사 홈페이지에서 찾아야 함(회사마다 다름).
	private static String user = "system";
	private static String password = "ekseh123";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver"; //ojdbc8.jar 안에 있는 클래스
	private ConnectionPool pool; // db연결 풀 객체
	private LoginDTO input;
	private int result;
	
	public LoginDAO() throws ClassNotFoundException, SQLException {
		Class.forName(jdbcclass);
		pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500); // 데이터베이스 연결 풀을 초기화합니다.
	}
	
	public LoginDTO select(LoginDTO input) throws SQLException, ClassNotFoundException {
        Connection conn = pool.getConnection(); // 연결 풀에서 연결을 가져옵니다.
        Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
		String sql = "select * from registers where id = '" + input.getId() + "' and pwd = '" + input.getPwd() + "'";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql); // SQL 쿼리를 실행하고 결과를 ResultSet에 저장합니다.
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL)
		LoginDTO login = null;	// a. LoginDTO 객체의 초기화 후
		// * 5. result ( , int, recordset)
		// * 6. get data
		while (result.next()) { // b. ResultSet에서 데이터를 읽어와서 LoginDTO 객체에 저장합니다.
			login  = new LoginDTO(result.getString(1), result.getString(2), result.getString(3), result.getString(4), 
					result.getString(5), result.getString(7), result.getDate(6), result.getString(8));
		}
		System.out.println(login);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return login;
	}
	
	public int insert(LoginDTO input) throws SQLException {
		
		Connection conn = pool.getConnection();
		
		String sql = "insert into registers(dist, id, pwd, name, email, regdate, address) "
				+" values(2, ?, ?, ?, ?, ?, sysdate, ?)";
	
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println(sql);
		
		stmt.setString(1, input.getId());
		stmt.setString(2, input.getPwd());
		stmt.setString(3, input.getName());
		stmt.setString(4, input.getEmail());
		stmt.setString(5, input.getPhone());
		stmt.setString(6, input.getAddress());
		
		result = stmt.executeUpdate();
		stmt.close();
		
        pool.releaseConnection(conn);    
        return result;
	}

	public ArrayList<LoginDTO> selectAll() throws SQLException {
		Connection conn = pool.getConnection();
		
		Statement stmt = conn.createStatement();

		String sql = "select * from INV_BOARD";
		
		ResultSet result = stmt.executeQuery(sql);
	
		LoginDTO board = null;
		
		ArrayList<LoginDTO> boards = new ArrayList<LoginDTO>();
		
		while(result.next())
		{
			board = new LoginDTO(result.getString("dist"), result.getString("id"), result.getString("pwd"),
					result.getString("name"), result.getString("email"), result.getString("phone"),result.getDate("regdate"), result.getString("address"));
			boards.add(board);
		}

		result.close();

		stmt.close();

		pool.releaseConnection(conn);
		
		return boards;
	}

	public void setGuest(LoginDTO input) {
		this.input = input;
	}
		
	public int getResult() {
		return result;
	}

//	
//	
//	public LoginDTO select(int id) throws SQLException {
//		Connection conn = pool.getConnection(); 
//		Statement stmt = conn.createStatement();
//		String sql = "select * from registers where id = " + id;
//		// * 4. execute (sql)
//		ResultSet result = stmt.executeQuery(sql);
//		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
//		LoginDTO login = null;
//		// * 5. result ( , int, recordset)
//		// * 6. get data
//		while (result.next()) {
//			login  = new LoginDTO(result.getString(1), result.getString(2), result.getString(3), result.getString(4), 
//					result.getString(5), result.getDate(6), result.getString(7));
//		}
//		System.out.println(login);
//		result.close();
//		stmt.close();
//		pool.releaseConnection(conn);
//		return login;
//	}

}
