package com.meetogether.eeit10927.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.meetogether.eeit10901.model.MemberBean;

@Entity
@Table(name = "msgtag")
@DynamicInsert
@DynamicUpdate
public class Msgtag implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer tagId;
	private String tagName;
	private Message message;
	private Integer messageId;
	private MemberBean member;
	private Integer memberId;
	private Boolean deleteTag;
	
	public Msgtag() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}
	
	public String getTagName() {
		return tagName;
	}


	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "msgId")
	public Message getMessage() {
		return message;
	}
	
	public void setMessage(Message message) {
		this.message = message;
	}
	
	@Transient
	public Integer getMessageId() {
		return messageId;
	}
	
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "mId")
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	@Transient
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Boolean getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(Boolean deleteTag) {
		this.deleteTag = deleteTag;
	}

}
