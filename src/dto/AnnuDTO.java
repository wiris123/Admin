package dto;
import java.util.Date;

//연금보험정의
public class AnnuDTO {

	private String ann_name;
	private String instype;
	private String instart;
	private String paytime;
	private String payment;
	private String rprem;
	private String interest;
	private String monthann;
	private Date  regidate;
	private String submit;
	private String attfile;
	
	//기본 생성자
	public AnnuDTO() {}

	//인자 생성자


	public String getAnn_name() {
		return ann_name;
	}

	public AnnuDTO(String ann_name, String instype, String instart, String paytime, String payment, String rprem,
			String interest, String monthann, Date regidate, String submit, String attfile) {
		super();
		this.ann_name = ann_name;
		this.instype = instype;
		this.instart = instart;
		this.paytime = paytime;
		this.payment = payment;
		this.rprem = rprem;
		this.interest = interest;
		this.monthann = monthann;
		this.regidate = regidate;
		this.submit = submit;
		this.attfile = attfile;
	}

	public String getAttfile() {
		return attfile;
	}

	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}

	public void setAnn_name(String ann_name) {
		this.ann_name = ann_name;
	}

	public String getInstype() {
		return instype;
	}

	public void setInstype(String instype) {
		this.instype = instype;
	}

	public String getInstart() {
		return instart;
	}

	public void setInstart(String instart) {
		this.instart = instart;
	}

	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getRprem() {
		return rprem;
	}

	public void setRprem(String rprem) {
		this.rprem = rprem;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getMonthann() {
		return monthann;
	}

	public void setMonthann(String monthann) {
		this.monthann = monthann;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}
	
	
	
	
}
