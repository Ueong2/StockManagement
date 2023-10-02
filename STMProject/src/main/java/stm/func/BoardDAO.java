package stm.func;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDAO {
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe"; // database 접속 url, 각 DB회사 홈페이지에서 찾아야 함(회사마다 다름).
	private static String user = "system";
	private static String password = "ekseh123";
	private static final String jdbcclass = "oracle.jdbc.OracleDriver"; //ojdbc8.jar 안에 있는 클래스
	private ConnectionPool pool; // db연결 풀 객체
	
	public BoardDAO() throws ClassNotFoundException, SQLException {
		Class.forName(jdbcclass);
		pool = ConnectionPool.getInstance(url, user, password, 3, 5, true, 500); // 데이터베이스 연결 풀을 초기화합니다.
	}
	
	public BoardDTO select(BoardDTO input) throws SQLException, ClassNotFoundException {
        Connection conn = pool.getConnection(); // 연결 풀에서 연결을 가져옵니다.
        Statement stmt = conn.createStatement(); // SQL 문을 실행하기 위한 Statement 객체 생성
		String sql = "select * from registers where id = '" + input.getId() + "' and pwd = '" + input.getPwd() + "'";
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql); // SQL 쿼리를 실행하고 결과를 ResultSet에 저장합니다.
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL)
		BoardDTO board = null;	// a. BoardDTO 객체의 초기화 후
		// * 5. result ( , int, recordset)
		// * 6. get data
		while (result.next()) { // b. ResultSet에서 데이터를 읽어와서 BoardDTO 객체에 저장합니다.
			board  = new BoardDTO(result.getString(1), result.getString(2), result.getString(3), result.getString(4), 
					result.getString(5), result.getDate(6), result.getString(7));
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return board;
	}
	
	
	public BoardDTO select(int id) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "select * from registers where id = " + id;
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		BoardDTO board = null;
		// * 5. result ( , int, recordset)
		// * 6. get data
		while (result.next()) {
			board  = new BoardDTO(result.getString(1), result.getString(2), result.getString(3), result.getString(4), 
					result.getString(5), result.getDate(6), result.getString(7));
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return board;
	}
	
	public int insert(BoardDTO board) throws SQLException, ClassNotFoundException {
		//jdbc 2~ 7단계(connection 반납)
		Connection conn = pool.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "insert into registers(id, name, email, pwd, subject, content, regdate, hit, "
				+ "parent, sort, tab, originalfile)\r\n" + 
				"	values( (select NVL(max(id),0)+1 from board), "
				+ "'"+board.getName()+"',"
				+ "'"+board.getEmail()+"', "
				+ "'"+board.getPwd()+"'";
		System.out.println(sql);
		System.out.println(board);
		
		// * 4. execute Update(sql) : insert, delete, update
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	public int update(int id, BoardDTO board) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "update registers set name="
				+ "'"+board.getName()+"',"
				+ "email="
				+ "'"+board.getEmail()+"', "
				+ "     where id = "+id;
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	public int delete(int id) throws SQLException {
		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "delete from registers where id ="+id;
		int result = stmt.executeUpdate(sql);
		stmt.close();
		pool.releaseConnection(conn);
		return result;
	}
	
	
	
	public ArrayList<BoardDTO> selectAll() throws SQLException {

		Connection conn = pool.getConnection(); 
		Statement stmt = conn.createStatement();
		String sql = "select * from registers order by regdate";
		
		// * 4. execute (sql)
		ResultSet result = stmt.executeQuery(sql);
		//execute : execute(anySQL-callableSQL), executeUpdate(otherSQL), executeQuery(selectSQL) 
		BoardDTO board = null;
		ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
		// * 5. result ( , int, recordset)
		// * 6. get data
		while (result.next()) {
			board  = new BoardDTO(result.getString(1), result.getString(2), result.getString(3), result.getString(4), 
					result.getString(5), result.getDate(6), result.getString(7));
			boards.add(board);
		}
		System.out.println(board);
		result.close();
		stmt.close();
		pool.releaseConnection(conn);
		return boards;
	}
}
