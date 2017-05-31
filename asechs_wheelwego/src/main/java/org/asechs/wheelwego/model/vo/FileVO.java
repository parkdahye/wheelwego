package org.asechs.wheelwego.model.vo;

public class FileVO {
	//강정호. BoardVO에서 쓰기 위해 만들었음
	private String no;
	private String filePath;
	public FileVO() {
		super();
	}
	public FileVO(String no, String filePath) {
		super();
		this.no = no;
		this.filePath = filePath;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", filePath=" + filePath + "]";
	}
	
}
