package stm.func;

import java.util.Date;
import java.util.Objects;

public class LoginDTO {
	private String dist;
	private String id;
	private String pwd;
	private String name;	
	private String email;	// web id 데이터와 매핑.	
	private String phone;
	private Date regdate;
	private String address;
	
	public LoginDTO(String dist, String id, String pwd, String name, String email, String phone, Date regdate,
			String address) {
		super();
		this.dist = dist;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
		this.address = address;
	}

	// usebean때문에 만들어 주는 생성자. usebean의 경우 임의로 객체를 불러오기 때문에 인스턴스가 몇 개인지 모른다. 이에 따라 null 형식의 생성자 필요.
	public LoginDTO() {
	}

	public LoginDTO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	

	public String getDist() {
		return dist;
	}

	public String getId() {
		return id;
	}

	public String getPwd() {
		return pwd;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public Date getRegdate() {
		return regdate;
	}

	public String getAddress() {
		return address;
	}

	public void setDist(String dist) {
		this.dist = dist;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

	@Override
	public String toString() {
		return "LoginDTO [dist=" + dist + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", regdate=" + regdate + ", address=" + address + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		LoginDTO other = (LoginDTO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		return true;
	}
	
	

	
	
	
}
