package com.meetogether.eeit10936.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class MemberBasic implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "memberid")
	private Integer memberId;
	@Column(name = "memberemail")
	private String memberEmail;
	@Column(name = "memberpassword")
	private String memberPassword;
	@Column(name = "membername")
	private String memberName;
	@Column(name = "memberbirth")
	private Date memberBirth;
	@Column(name = "membersex")
	private Integer memberSex;
	@Column(name = "membercity")
	private String memberCity;
	@Column(name = "memberdist")
	private String memberDist;
	@Column(name = "filename")
	private String fileName;
	@Column(name = "admintag")
	private Integer adminTag;
	@Column(name = "deletetag")
	private Integer deleteTag;
	@Column(name = "vipstatus")
	private Integer vipStatus;
//	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "member")
//	private MemberHope mh;
//	@OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "member")
//	private MemberInfo mi;

//	
//	public MemberHope getMh() {
//		return mh;
//	}
//
//	public void setMh(MemberHope mh) {
//		this.mh = mh;
//	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(Date memberBirth) {
		this.memberBirth = memberBirth;
	}

	public Integer getMemberSex() {
		return memberSex;
	}

	public void setMemberSex(Integer memberSex) {
		this.memberSex = memberSex;
	}

	public String getMemberCity() {
		return memberCity;
	}

	public void setMemberCity(String memberCity) {
		this.memberCity = memberCity;
	}

	public String getMemberDist() {
		return memberDist;
	}

	public void setMemberDist(String memberDist) {
		this.memberDist = memberDist;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getAdminTag() {
		return adminTag;
	}

	public void setAdminTag(Integer adminTag) {
		this.adminTag = adminTag;
	}

	public Integer getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(Integer deleteTag) {
		this.deleteTag = deleteTag;
	}

	public Integer getVipStatus() {
		return vipStatus;
	}

	public void setVipStatus(Integer vipStatus) {
		this.vipStatus = vipStatus;
	}
//
//	public MemberInfo getMi() {
//		return mi;
//	}
//
//	public void setMi(MemberInfo mi) {
//		this.mi = mi;
//	}

}