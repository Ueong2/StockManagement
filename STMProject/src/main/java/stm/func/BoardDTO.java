package stm.func;

import java.util.Date;
import java.util.Objects;

public class BoardDTO {
	private String dist;
	private String id;
	private String pwd;
	private String name;	
	private String email;	// web id 데이터와 매핑.	
	private Date regdate;
	private String address;
	
	public BoardDTO(String dist, String id, String pwd, String name, String email, Date regdate, String address) {
		super();
		this.dist = dist;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.regdate = regdate;
		this.address = address;
	}

	// usebean때문에 만들어 주는 생성자. usebean의 경우 임의로 객체를 불러오기 때문에 인스턴스가 몇 개인지 모른다. 이에 따라 null 형식의 생성자 필요.
	public BoardDTO() {
	}

	public BoardDTO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public String getDist() {
		return dist;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "BoardDTO [dist=" + dist + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", regdate=" + regdate + ", address=" + address + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, dist, email, id, name, pwd, regdate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDTO other = (BoardDTO) obj;
		return Objects.equals(address, other.address) && Objects.equals(dist, other.dist)
				&& Objects.equals(email, other.email) && Objects.equals(id, other.id)
				&& Objects.equals(name, other.name) && Objects.equals(pwd, other.pwd)
				&& Objects.equals(regdate, other.regdate);
	}
	
	
}
