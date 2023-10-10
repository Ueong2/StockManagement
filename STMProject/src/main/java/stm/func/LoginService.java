package stm.func;

import java.sql.SQLException;

public class LoginService {
	private String result;
	private LoginDAO db;
	
	public LoginService() throws ClassNotFoundException, SQLException {
		super();
		db = new LoginDAO(); 
	}
	
	public LoginService(LoginDAO db) {
		super();
		this.db = db;
	}
	
	public String getResult() {
		return result;
	}

	public void setDb(LoginDAO db) {
		this.db = db;
	}

	public String login(LoginDTO member) throws SQLException, ClassNotFoundException {
		LoginDTO comguest = new LoginDTO();
		//if (guestDAO.select(guest) != null) {
		comguest = db.select(member);
		//}
		System.out.println("갖고 있는 데이터 : "+member);
		System.out.println("DB로부터 가져온 데이터 : "+comguest);
		return ((comguest != null) && member.getPwd().equals(comguest.getPwd())) ? "login" : "fail";
	}
	
	public String registerlogin(LoginDTO member) throws SQLException, ClassNotFoundException {
		LoginDTO comguest = new LoginDTO();
		
		comguest = db.select(member);
		System.out.println("DB로부터 가져온 데이터 : "+comguest);
		if(comguest==null) {
			int result1 = db.insert(member);
			System.out.println("갖고 있는 데이터 : "+member);
			System.out.println("insert 처리결과 : "+result1);
			result = "success";
		}
		else result = "fail";
		return result;
	}
	
	public String getName(LoginDTO member) throws SQLException, ClassNotFoundException {
		LoginDTO comguest = new LoginDTO();
		//if (guestDAO.select(guest) != null) {
		comguest = db.select(member);
		//}
		System.out.println("갖고 있는 데이터 : "+member);
		System.out.println("DB로부터 가져온 데이터 : "+comguest);
		return ((comguest != null) && member.getPwd().equals(comguest.getPwd())) ? comguest.getName() : "fail";
	}
	
	public String getDist(LoginDTO member) throws SQLException, ClassNotFoundException {
		LoginDTO comguest = new LoginDTO();
		//if (guestDAO.select(guest) != null) {
		comguest = db.select(member);
		//}
		System.out.println("갖고 있는 데이터 : "+member);
		System.out.println("DB로부터 가져온 데이터 : "+comguest);
		return ((comguest != null) && member.getPwd().equals(comguest.getPwd())) ? comguest.getDist() : "fail";
	}
}
