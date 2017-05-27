package org.asechs.wheelwego.model.vo;

public class SellerVO extends MemberVO{
	private String businessNumber;
	
	public SellerVO() {
		super();
	}

	public SellerVO(String id, String password, String memberName, String address, String phoneNumber, String memberType, String businessNumber) {
		super(id, password, memberName, address, phoneNumber, memberType);
		this.businessNumber = businessNumber;
	}

	public String getBusinessNumber() {
		return businessNumber;
	}

	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	@Override
	public String toString() {
		return super.toString() + ", " + "businessNumber=" + businessNumber + "]";
	}
}
