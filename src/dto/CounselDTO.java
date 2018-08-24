package dto;
import java.util.Date;

//상담예약
public class CounselDTO {

	private String idx;
	private String name;
	private String mobile;
	private Date regidate;
	private String email;
	private String contents;
	private String flag;
	
	//기본 생성자
	public CounselDTO() {
		super();
	}
	
	//인자 생성자
	public CounselDTO(String idx, String name, String mobile, Date regidate, String email, String contents,
			String flag) {
		super();
		this.idx = idx;
		this.name = name;
		this.mobile = mobile;
		this.regidate = regidate;
		this.email = email;
		this.contents = contents;
		this.flag = flag;
	}
	
	public String getIdx() {
		return idx;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
