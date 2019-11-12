package com.meetogether.eeit10927.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.web.multipart.MultipartFile;

//@Entity
@Table(name="member")
@DynamicInsert
public class Member implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Integer memberId;	
	private String memberEmail;
	private String memberPassword;
	private String memberPassword2;
	private String memberName;
	private Date memberBirth;
	private String memberSex;
	private String memberDist;
	private String fileName;
	private MultipartFile uploadphoto;
	private Blob photo;
	private String adminTag;
	private String deleteTag;
	private String mChecksum;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	
	public Member() {
	};
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
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

	public String getMemberSex() {
		return memberSex;
	}

	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
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

	public String getAdminTag() {
		return adminTag;
	}

	public void setAdminTag(String adminTag) {
		this.adminTag = adminTag;
	}

	public String getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(String deleteTag) {
		this.deleteTag = deleteTag;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Transient
	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	
	@Transient
	public MultipartFile getUploadphoto() {
		return uploadphoto;
	}

	public void setUploadphoto(MultipartFile uploadphoto) {
		this.uploadphoto = uploadphoto;
	}

	@Transient
	public String getMemberPassword2() {
		return memberPassword2;
	}

	public void setMemberPassword2(String memberPassword2) {
		this.memberPassword2 = memberPassword2;
	}

	@Transient
	public String getmChecksum() {
		return mChecksum;
	}

	public void setmChecksum(String mChecksum) {
		this.mChecksum = mChecksum;
	}

//	@OneToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name = "mId", referencedColumnName = "memberId")
//	public Set<Message> getMessage() {
//		return message;
//	}
//
//	public void setMessage(Set<Message> message) {
//		this.message = message;
//	}


}
