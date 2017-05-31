package org.asechs.wheelwego.model.vo;

public class FileVO {
	private String no;
	private String filepath;
	public FileVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileVO(String no, String filepath) {
		super();
		this.no = no;
		this.filepath = filepath;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", filepath=" + filepath + "]";
	}
	
}
