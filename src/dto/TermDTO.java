package dto;

import java.util.Date;

//정기보험정의
public class TermDTO {

	private String term_name;
	private String instype;
	private String paytime;
	private String instime;
	private String rprem;
	private String deathben;
	private String monthpay;
	private Date regidate;
	private String attfile;
	
	
	//기본 생성자
	public TermDTO() {
		super();
	}
	
	//인자 생성자

	public String getTerm_name() {
		return term_name;
	}
	public TermDTO(String term_name, String instype, String paytime, String instime, String rprem, String deathben,
			String monthpay, Date regidate, String attfile) {
		super();
		this.term_name = term_name;
		this.instype = instype;
		this.paytime = paytime;
		this.instime = instime;
		this.rprem = rprem;
		this.deathben = deathben;
		this.monthpay = monthpay;
		this.regidate = regidate;
		this.attfile = attfile;
	}

	public String getAttfile() {
		return attfile;
	}

	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}

	public void setTerm_name(String term_name) {
		this.term_name = term_name;
	}
	public String getInstype() {
		return instype;
	}
	public void setInstype(String instype) {
		this.instype = instype;
	}
	public String getPaytime() {
		return paytime;
	}
	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}
	public String getInstime() {
		return instime;
	}
	public void setInstime(String instime) {
		this.instime = instime;
	}
	public String getRprem() {
		return rprem;
	}
	public void setRprem(String rprem) {
		this.rprem = rprem;
	}
	public String getDeathben() {
		return deathben;
	}
	public void setDeathben(String deathben) {
		this.deathben = deathben;
	}
	public String getMonthpay() {
		return monthpay;
	}
	public void setMonthpay(String monthpay) {
		this.monthpay = monthpay;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
}
