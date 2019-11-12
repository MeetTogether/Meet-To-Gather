package com.meetogether.eeit10936.pairs.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.meetogether.eeit10901.model.MemberBean;
@Entity
@Table(name = "vipList")
public class VipStatus implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//	@Column(name = "vipId")
	private Integer vipId;
	
//	@Column(name = "memberId")
//	private Integer memberId;
	
//	@Column(name = "vipStatus")
	private Integer vipStatus;
	
//	@Column(name = "startTime")
	private Timestamp startTime;

//	@Column(name = "endTime")
	private Timestamp endTime;
	
//	@Column(name = "orderNumber")
	private String orderNumber;
	
	private Integer expired;

	
	private MemberBean member;
	private Integer mbId;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getVipId() {
		return vipId;
	}

	public void setVipId(Integer vipId) {
		this.vipId = vipId;
	}

//	public Integer getMemberId() {
//		return memberId;
//	}
//
//	public void setMemberId(Integer memberId) {
//		this.memberId = memberId;
//	}

	public Integer getVipStatus() {
		return vipStatus;
	}

	public void setVipStatus(Integer vipStatus) {
		this.vipStatus = vipStatus;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	
	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	
	public Integer getExpired() {
		return expired;
	}

	public void setExpired(Integer expired) {
		this.expired = expired;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "memberId")
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	@Transient
	public Integer getMbId() {
		return mbId;
	}
	
	public void setMbId(Integer mbId) {
		this.mbId = mbId;
	}
	
}
