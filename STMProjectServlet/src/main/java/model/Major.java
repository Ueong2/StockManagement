package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Major {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@JoinColumn(name = "MAJOR_ID")
	private int id;
	
	private String majorName;

	public Major(int id, String majorName) {
		super();
		this.id = id;
		this.majorName = majorName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	@Override
	public String toString() {
		return "Major [id=" + id + ", majorName=" + majorName + "]";
	}
	
	
}
