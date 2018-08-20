package dto;

//메일상담
public class MailingDTO {

	private String idx;
	private String name;
	private String email;
	private String contents;
	
	//기본 생성자
	public MailingDTO() {
		super();
	}
	
	//인자 생성자
	public MailingDTO(String idx, String name, String email, String contents) {
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.contents = contents;
	}
	public String getIdx() {
		return idx;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
