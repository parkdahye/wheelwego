package org.asechs.wheelwego.model.vo;

public class CustomerVO extends MemberVO{
	public CustomerVO() {
		super();
	}

	public CustomerVO(String id, String password, String memberName, String address, String phoneNumber, String memberType) {
		super(id, password, memberName, address, phoneNumber, memberType);
	}

	@Override
	public String toString() {
		return super.toString() + "]";
	}
	
	
}
