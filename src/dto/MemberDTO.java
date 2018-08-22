package dto;

import java.util.Date;

//회원
public class MemberDTO {

	private String id;
	private String pass;
	private String name;
	private String email;
	private String mobile;
	private String birth;
	private Date regidate;
	
	//기본 생성자
	public MemberDTO() 
	{
		super();
	}
	
	//인자 생성자
	
	public MemberDTO(String id, String pass, String name, String email, String mobile, String birth, Date regidate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.birth = birth;
		this.regidate = regidate;
	}
	public MemberDTO(String id, String pass, String name, String email, String mobile, String birth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.birth = birth;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
	
}
