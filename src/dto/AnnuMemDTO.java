package dto;

//연금보험가입 폼
public class AnnuMemDTO {

	private String id;
	private String pass;
	private String name;
	private String phone;
	private String mobile;
	private String email;
	private String address1;
	private String address2;
	private String job;
	private String drive;
	private String enabled;
	private String instype;
	private String ins_name;
	
	//기본 생성자
	public AnnuMemDTO() {
		super();
	}
	
	//인자 생성자
	public AnnuMemDTO(String id, String pass, String name, String phone, String mobile, String email, String address1,
			String address2, String job, String drive, String enabled, String instype, String ins_name) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.phone = phone;
		this.mobile = mobile;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.job = job;
		this.drive = drive;
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
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getDrive() {
		return drive;
	}
	public void setDrive(String drive) {
		this.drive = drive;
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
