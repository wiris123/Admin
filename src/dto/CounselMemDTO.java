package dto;

import java.util.Date;

public class CounselMemDTO {

	private String idx;
	private String name;
	private String id;
	private String mobile;
	private Date regidate;
	private String contents;
	private String flag;
	//기본 생성자
	public CounselMemDTO() {
		super();
	}
	
	//인자 생성자
	public CounselMemDTO(String idx, String name, String id, String mobile, Date regidate, String contents,String flag) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.mobile = mobile;
		this.regidate = regidate;
		this.contents = contents;
		this.flag = flag;
	}
	public String getIdx() {
		return idx;
	}
	
	public void setflag(String flag) {
		this.flag = flag;
	}
	public String getflag() {
		return flag;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
