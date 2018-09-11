package dto;

public class VisitorDTO {
	String visit_date;
	int val;
	public VisitorDTO() {};
	public VisitorDTO(String visit_date, int val) {
		this.visit_date = visit_date;
		this.val = val;
	}
	//getter/setter
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
	
	
}
