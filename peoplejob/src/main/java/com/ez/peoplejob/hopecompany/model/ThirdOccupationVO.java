package com.ez.peoplejob.hopecompany.model;

public class ThirdOccupationVO {
	
	private int thirdCode; //3차직종코드
	private String thirdname; // 3차직종명
	private int secondCode;	//2차 직종코드
	
	
	public int getSecondCode() {
		return secondCode;
	}
	public void setSecondCode(int secondCode) {
		this.secondCode = secondCode;
	}
	public int getThirdCode() {
		return thirdCode;
	}
	public void setThirdCode(int thirdCode) {
		this.thirdCode = thirdCode;
	}
	public String getThirdname() {
		return thirdname;
	}
	public void setThirdname(String thirdname) {
		this.thirdname = thirdname;
	}
	@Override
	public String toString() {
		return "ThirdOccupationVO [thirdCode=" + thirdCode + ", thirdname=" + thirdname + ", secondCode=" + secondCode
				+ "]";
	}
	
	
}
