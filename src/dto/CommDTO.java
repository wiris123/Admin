package dto;

import java.util.Date;

//코멘트
public class CommDTO {

	private String com_idx;
	private String com_name;
	private Date com_regidate;
	private String com_content;
	private String board_idx;
	
	//기본 생성자
	public CommDTO() {
		super();
	}
	
	//인자 생성자
	public CommDTO(String com_idx, String com_name, Date com_regidate, String com_content, String board_idx) {
		super();
		this.com_idx = com_idx;
		this.com_name = com_name;
		this.com_regidate = com_regidate;
		this.com_content = com_content;
		this.board_idx = board_idx;
	}
	public String getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(String com_idx) {
		this.com_idx = com_idx;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public Date getCom_regidate() {
		return com_regidate;
	}
	public void setCom_regidate(Date com_regidate) {
		this.com_regidate = com_regidate;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}


	
}

