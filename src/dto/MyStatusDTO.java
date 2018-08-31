package dto;

public class MyStatusDTO 
{
	private	String	num;
	private	String	id;
	private	String	insname;
	private	String	insnum;
	private	String	remainpay;
	private	String	paidprem;
	private	String	prem;
	private	String	contstat;
	
	public MyStatusDTO() 
	{
	
	}

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
