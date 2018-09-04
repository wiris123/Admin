package dto;

import java.util.Date;

//게시판
public class BoardDTO {

	private String num;
	private String id;
	private String name;
	private String title;
	private String contents;
	private Date regidate;
	private String viewcnt;
	private String attfile;
	private String b_id;
	private int reply;
	
	
	//기본 생성자
	public BoardDTO() {
		super();
	}


	
	//인자 생성자
	public BoardDTO(String num, String id, String name, String title, String contents, Date regidate, String viewcnt,
			String attfile, String b_id, int reply) {
		super();
		this.num = num;
		this.id = id;
		this.name = name;
		this.title = title;
		this.contents = contents;
		this.regidate = regidate;
		this.viewcnt = viewcnt;
		this.attfile = attfile;
		this.b_id = b_id;
		this.reply = reply;
	}



	public int getReply() {
		return reply;
	}



	public void setReply(int reply) {
		this.reply = reply;
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



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContents() {
		return contents;
	}



	public void setContents(String contents) {
		this.contents = contents;
	}



	public Date getRegidate() {
		return regidate;
	}



	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}



	public String getViewcnt() {
		return viewcnt;
	}



	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}



	public String getAttfile() {
		return attfile;
	}



	public void setAttfile(String attfile) {
		this.attfile = attfile;
	}



	public String getB_id() {
		return b_id;
	}



	public void setB_id(String b_id) {
		this.b_id = b_id;
	}
	
	
	
}
