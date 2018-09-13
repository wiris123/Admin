package dto;

import java.sql.Date;

public class MyStatusDTO 
{	
	//멤버변수
	private	String	num;
	private	String	id;
	private	String	insname;
	private	String	insnum;
	private	String	remainpay;
	private	String	paidprem;
	private	String	prem;
	private	String	contstat;
	private Date regidate;
	private String inssort;
	private String death_ins;
	private String paytime;
	private String instart;
	private String monthann;
	
	
	public String getPaytime() {
		return paytime;
	}

	public void setPaytime(String paytime) {
		this.paytime = paytime;
	}

	public String getInstart() {
		return instart;
	}

	public void setInstart(String instart) {
		this.instart = instart;
	}

	public String getMonthann() {
		return monthann;
	}

	public void setMonthann(String monthann) {
		this.monthann = monthann;
	}

	public MyStatusDTO(String num, String id, String insname, String insnum, String remainpay, String paidprem,
			String prem, String contstat, Date regidate, String inssort, String death_ins, String paytime,
			String instart) 
	{
		super();
		this.num = num;
		this.id = id;
		this.insname = insname;
		this.insnum = insnum;
		this.remainpay = remainpay;
		this.paidprem = paidprem;
		this.prem = prem;
		this.contstat = contstat;
		this.regidate = regidate;
		this.inssort = inssort;
		this.death_ins = death_ins;
		this.paytime = paytime;
		this.instart = instart;
	}

	public MyStatusDTO(String num, String id, String insname, String insnum, String remainpay, String paidprem,
			String prem, String contstat, Date regidate, String inssort, String death_ins) 
	{
		this.num = num;
		this.id = id;
		this.insname = insname;
		this.insnum = insnum;
		this.remainpay = remainpay;
		this.paidprem = paidprem;
		this.prem = prem;
		this.contstat = contstat;
		this.regidate = regidate;
		this.inssort = inssort;
		this.death_ins = death_ins;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}

	public String getInssort() {
		return inssort;
	}

	public void setInssort(String inssort) {
		this.inssort = inssort;
	}

	public String getDeath_ins() {
		return death_ins;
	}

	public void setDeath_ins(String death_ins) {
		this.death_ins = death_ins;
	}

	public MyStatusDTO() {}

	public MyStatusDTO(String num, String id, String insname, String insnum, String remainpay, String paidprem,
			String prem, String contstat) {
		super();
		this.num = num;
		this.id = id;
		this.insname = insname;
		this.insnum = insnum;
		this.remainpay = remainpay;
		this.paidprem = paidprem;
		this.prem = prem;
		this.contstat = contstat;
		
	}

	public MyStatusDTO(String id, String insname, String insnum, String remainpay, String paidprem, String prem,
			String contstat) {
		super();
		this.id = id;
		this.insname = insname;
		this.insnum = insnum;
		this.remainpay = remainpay;
		this.paidprem = paidprem;
		this.prem = prem;
		this.contstat = contstat;
	}

	public String getNum() {
		return num;
	}
	
	public void setNum(String num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getInsname() {
		return insname;
	}

	public void setInsname(String insname) {
		this.insname = insname;
	}

	public String getInsnum() {
		return insnum;
	}

	public void setInsnum(String insnum) {
		this.insnum = insnum;
	}

	public String getRemainpay() {
		return remainpay;
	}

	public void setRemainpay(String remainpay) {
		this.remainpay = remainpay;
	}

	public String getPaidprem() {
		return paidprem;
	}

	public void setPaidprem(String paidprem) {
		this.paidprem = paidprem;
	}

	public String getPrem() {
		return prem;
	}

	public void setPrem(String prem) {
		this.prem = prem;
	}

	public String getContstat() {
		return contstat;
	}

	public void setContstat(String contstat) {
		this.contstat = contstat;
	}
}
