package com.ez.peoplejob.resume.model;


public class ResumeManagerVO {
	private int resumeCode;
	private String resumeTitle;
	private String resumeRegdate;
	private String introduce;
	private String award;
	private int langlicenceCode;
	private int lNo;
	private int dvCode;
	private int academicCode;
	private int hopeworkCode;
	private String opencheck;
	private int memberCode;
	private String picture;
	public int getResumeCode() {
		return resumeCode;
	}
	public void setResumeCode(int resumeCode) {
		this.resumeCode = resumeCode;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getResumeRegdate() {
		return resumeRegdate;
	}
	public void setResumeRegdate(String resumeRegdate) {
		this.resumeRegdate = resumeRegdate;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public int getLanglicenceCode() {
		return langlicenceCode;
	}
	public void setLanglicenceCode(int langlicenceCode) {
		this.langlicenceCode = langlicenceCode;
	}
	public int getlNo() {
		return lNo;
	}
	public void setlNo(int lNo) {
		this.lNo = lNo;
	}
	public int getDvCode() {
		return dvCode;
	}
	public void setDvCode(int dvCode) {
		this.dvCode = dvCode;
	}
	public int getAcademicCode() {
		return academicCode;
	}
	public void setAcademicCode(int academicCode) {
		this.academicCode = academicCode;
	}
	public int getHopeworkCode() {
		return hopeworkCode;
	}
	public void setHopeworkCode(int hopeworkCode) {
		this.hopeworkCode = hopeworkCode;
	}
	public String getOpencheck() {
		return opencheck;
	}
	public void setOpencheck(String opencheck) {
		this.opencheck = opencheck;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "ResumeManagerVO [resumeCode=" + resumeCode + ", resumeTitle=" + resumeTitle + ", resumeRegdate="
				+ resumeRegdate + ", introduce=" + introduce + ", award=" + award + ", langlicenceCode="
				+ langlicenceCode + ", lNo=" + lNo + ", dvCode=" + dvCode + ", academicCode=" + academicCode
				+ ", hopeworkCode=" + hopeworkCode + ", opencheck=" + opencheck + ", memberCode=" + memberCode
				+ ", picture=" + picture + "]";
	}
	
	
}
