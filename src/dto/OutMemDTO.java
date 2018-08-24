package dto;

import java.util.Date;

//탈퇴회원
public class OutMemDTO {

	private String id;
	private String reason;
	private Date regidate;
	
	//기본 생성자
	public OutMemDTO() {
		super();
	}
	
	//인자 생성자
	public OutMemDTO(String id, String reason, Date regidate) {
		super();
		this.id = id;
		this.reason = reason;
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	
	
}
