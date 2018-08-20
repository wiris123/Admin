package dto;

public class InsuDescDTO {

	private String name;
	private String insure;
	private String age;
	private String insutime;
	private String paytime;
	private String payperiod;
	private String paylimit;
	private String claptype;
	private String penstart;
	private String pentype;
	private String instype;
	
	//기본 생성자
	public InsuDescDTO() {
		super();
	}
	
	//인자 생성자
	public InsuDescDTO(String name, String insure, String age, String insutime, String paytime, String payperiod,
			String paylimit, String claptype, String penstart, String pentype, String instype) {
		super();
		this.name = name;
		this.insure = insure;
		this.age = age;
		this.insutime = insutime;
		this.paytime = paytime;
		this.payperiod = payperiod;
		this.paylimit = paylimit;
		this.claptype = claptype;
		this.penstart = penstart;
		this.pentype = pentype;
		this.instype = instype;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInsure() {
		return insure;
	}
	public void setInsure(String insure) {
		this.insure = insure;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getInsutime() {
		return insutime;
	}
	public void setInsutime(String insutime) {
		this.insutime = insutime;
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public String getPayperiod() {
		return payperiod;
	}
	public void setPayperiod(String payperiod) {
		this.payperiod = payperiod;
	}
	public String getPaylimit() {
		return paylimit;
	}
	public void setPaylimit(String paylimit) {
		this.paylimit = paylimit;
	}
	public String getClaptype() {
		return claptype;
	}
	public void setClaptype(String claptype) {
		this.claptype = claptype;
	}
	public String getPenstart() {
		return penstart;
	}
	public void setPenstart(String penstart) {
		this.penstart = penstart;
	}
	public String getPentype() {
		return pentype;
	}
	public void setPentype(String pentype) {
		this.pentype = pentype;
	}
	public String getInstype() {
		return instype;
	}
	public void setInstype(String instype) {
		this.instype = instype;
	}
	
	
}
