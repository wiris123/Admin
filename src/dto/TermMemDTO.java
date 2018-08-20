package dto;

import java.util.Date;

//정기보험가입 폼
public class TermMemDTO {

	private String id;
	private String pass;
	private String name;
	private String phone;
	private String mobile;
	private String email;
	private String drive;
	private String cigar;
	private String drink;
	private String height;
	private String weight;
	private String danhobby;
	private String income;
	private String hospit1;
	private String hospit2;
	private String hospit3;
	private String enabled;
	private String instype;
	private String ins_name;
	
	//기본 생성자
	public TermMemDTO() {
		super();
	}
	
	//인자 생성자
	public TermMemDTO(String id, String pass, String name, String phone, String mobile, String email, String drive,
			String cigar, String drink, String height, String weight, String danhobby, String income, String hospit1,
			String hospit2, String hospit3, String enabled, String instype, String ins_name) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.phone = phone;
		this.mobile = mobile;
		this.email = email;
		this.drive = drive;
		this.cigar = cigar;
		this.drink = drink;
		this.height = height;
		this.weight = weight;
		this.danhobby = danhobby;
		this.income = income;
		this.hospit1 = hospit1;
		this.hospit2 = hospit2;
		this.hospit3 = hospit3;
		this.enabled = enabled;
		this.instype = instype;
		this.ins_name = ins_name;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDrive() {
		return drive;
	}
	public void setDrive(String drive) {
		this.drive = drive;
	}
	public String getCigar() {
		return cigar;
	}
	public void setCigar(String cigar) {
		this.cigar = cigar;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getDanhobby() {
		return danhobby;
	}
	public void setDanhobby(String danhobby) {
		this.danhobby = danhobby;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getHospit1() {
		return hospit1;
	}
	public void setHospit1(String hospit1) {
		this.hospit1 = hospit1;
	}
	public String getHospit2() {
		return hospit2;
	}
	public void setHospit2(String hospit2) {
		this.hospit2 = hospit2;
	}
	public String getHospit3() {
		return hospit3;
	}
	public void setHospit3(String hospit3) {
		this.hospit3 = hospit3;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getInstype() {
		return instype;
	}
	public void setInstype(String instype) {
		this.instype = instype;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	
	
	
	
}
