package dto;


import java.util.Date;

//실손보험정의
public class PropDTO {

	private String prop_name;
	private String instype;
	private String monthpay;
	private Date regidate;
	private String hosp;
	private String gohosp;
	private String sanghosp;
	private String sgohosp;
	private String chbedosu;
	private String chbeinje;
	private String chbemri;
	private String attfile;
	
	//기본 생성자
	public PropDTO() {
		super();
	}
	
	//인자 생성자

	
	
	public String getProp_name() {
		return prop_name;
	}
	public String getAttfile() {
		return attfile;
	}

	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}

	public PropDTO(String prop_name, String instype, String monthpay, Date regidate, String hosp,
			String gohosp, String sanghosp, String sgohosp, String chbedosu, String chbeinje, String chbemri,
			String attfile) {
		super();
		this.prop_name = prop_name;
		this.instype = instype;
		this.monthpay = monthpay;
		this.regidate = regidate;
		this.hosp = hosp;
		this.gohosp = gohosp;
		this.sanghosp = sanghosp;
		this.sgohosp = sgohosp;
		this.chbedosu = chbedosu;
		this.chbeinje = chbeinje;
		this.chbemri = chbemri;
		this.attfile = attfile;
	}

	public void setProp_name(String prop_name) {
		this.prop_name = prop_name;
	}
	public String getInstype() {
		return instype;
	}
	public void setInstype(String instype) {
		this.instype = instype;
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
	public String getHosp() {
		return hosp;
	}
	public void setHosp(String hosp) {
		this.hosp = hosp;
	}
	public String getGohosp() {
		return gohosp;
	}
	public void setGohosp(String gohosp) {
		this.gohosp = gohosp;
	}
	public String getSanghosp() {
		return sanghosp;
	}
	public void setSanghosp(String sanghosp) {
		this.sanghosp = sanghosp;
	}
	public String getSgohosp() {
		return sgohosp;
	}
	public void setSgohosp(String sgohosp) {
		this.sgohosp = sgohosp;
	}
	public String getChbedosu() {
		return chbedosu;
	}
	public void setChbedosu(String chbedosu) {
		this.chbedosu = chbedosu;
	}
	public String getChbeinje() {
		return chbeinje;
	}
	public void setChbeinje(String chbeinje) {
		this.chbeinje = chbeinje;
	}
	public String getChbemri() {
		return chbemri;
	}
	public void setChbemri(String chbemri) {
		this.chbemri = chbemri;
	}
	
}
