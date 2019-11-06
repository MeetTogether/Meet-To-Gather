package com.meetogether.eeit10936.friends.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "friendList")
public class FriendList implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Transient
	public static final String allow = "Y";
	@Transient
	public static final String disAllow = "N";
	
	@Id
	@Column(name="friendListId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer friendListId;
	@Column(name = "memberId")
	private Integer memberId;

	@Column(name = "friendId")
	private Integer friendId;

	@Column(name = "friendStatus")
	private Integer friendStatus;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getFriendId() {
		return friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}

	public Integer getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(Integer friendStatus) {
		this.friendStatus = friendStatus;
	}

}
