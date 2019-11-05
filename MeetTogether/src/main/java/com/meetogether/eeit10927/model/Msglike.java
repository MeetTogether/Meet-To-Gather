package com.meetogether.eeit10927.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.meetogether.eeit10901.model.MemberBean;

@Entity
@Table(name = "msglike")
@DynamicInsert
@DynamicUpdate
public class Msglike implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer msglikeId;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	private String deleteTag;
	private Message message;
	private Integer messageId;
	private MemberBean member;
	private Integer memberId;
	
	public Msglike() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMsglikeId() {
		return msglikeId;
	}

	public void setMsglikeId(Integer msglikeId) {
		this.msglikeId = msglikeId;
	}
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(String deleteTag) {
		this.deleteTag = deleteTag;
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

}
