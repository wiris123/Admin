package dto;

public class VisitorDTO {
	String visit_date;
	double val;
	public VisitorDTO() {}
	public VisitorDTO(String visit_date, double val) {
		super();
		this.visit_date = visit_date;
		this.val = val;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public double getVal() {
		return val;
	}
	public void setVal(double val) {
		this.val = val;
	};
	
}
