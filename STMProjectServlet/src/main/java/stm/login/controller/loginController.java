package stm.login.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class loginController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe"; // database 접속 url, 각 DB회사 홈페이지에서 찾아야 함(회사마다 다름).
		String dbUser = "system";
		String dbPwd = "ekseh123";
		
		// db 연결을 위한 코드
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
			
			String sql = "SELECT * FROM REGISTERS WHERE ID = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next()){
				String name = rs.getString("name");
				if(pwd.equals(rs.getString("pwd"))){
					System.out.println(id + " // " + pwd);
					System.out.println(name);

					request.setAttribute("name", name);
					request.setAttribute("id", id);
					request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
				}
				else{
					System.out.println("로그인 정보를 확인하세요. error1");
				}
			}
			else{
				System.out.println("로그인 정보를 확인하세요. error2");
			}

		    rs.close();
		    st.close();
		    con.close();
		    
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
