package com.meetogether.eeit10901.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name="member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="memberId")
	
	Integer memberId;
	String memberEmail;
	String memberPassword;
	@Transient
	String memberPassword2;
	String memberName;
	Date memberBirth;
	Integer memberSex;
	String memberCity;
	
	String memberDist;
//    @Transient
    String fileName;
    Blob photo;
    
	@Transient
    MultipartFile memberImage;
	
	@Transient
	String mChecksum;
	Integer adminTag;
	Integer deleteTag;
	
	public MultipartFile getMemberImage() {
		return memberImage;
	}
	
	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}


	public MemberBean( Integer memberId, String memberEmail, String memberPassword, String memberName, Date memberBirth,
			Integer memberSex, String memberCity, String memberDist, String fileName, Integer adminTag,
			Integer deleteTag ,String mChecksum,String memberPassword2, Blob photo) {
		
		this.memberId = memberId;
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberBirth = memberBirth;
		this.memberSex = memberSex;
		this.memberCity = memberCity;
		this.memberDist = memberDist;
		this.fileName = fileName;
		this.adminTag = adminTag;
		this.fileName = fileName;
		this.deleteTag = deleteTag;
		this.memberPassword2 = memberPassword2;
		this.mChecksum = mChecksum;
		this.photo = photo;
		
		
	}


	public MemberBean() {
	}


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
	public String getMemberPassword2() {
		return memberPassword2;
	}


	public void setMemberPassword2(String memberPassword2) {
		this.memberPassword2 = memberPassword2;
	}


	public String getmChecksum() {
		return mChecksum;
	}

	public void setmChecksum(String mChecksum) {
		this.mChecksum = mChecksum;
	}
	
	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
