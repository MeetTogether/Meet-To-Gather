package com.meetogether.eeit10936.friends.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "addfriend")
public class AddFriend implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="addFriendId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer addFriendId;
	@Column(name = "friendOne")
	private Integer friendOne;
	@Column(name = "friendTwo")
	private Integer friendTwo;
	@Column(name = "oneAllow")
	private Integer oneAllow;
	@Column(name = "twoAllow")
	private Integer twoAllow;

	public Integer getFriendOne() {
		return friendOne;
	}

	public void setFriendOne(Integer friendOne) {
		this.friendOne = friendOne;
	}

	public Integer getFriendTwo() {
		return friendTwo;
	}

	public void setFriendTwo(Integer friendTwo) {
		this.friendTwo = friendTwo;
	}

	public Integer getOneAllow() {
		return oneAllow;
	}

	public void setOneAllow(Integer oneAllow) {
		this.oneAllow = oneAllow;
	}

	public Integer getTwoAllow() {
		return twoAllow;
	}

	public void setTwoAllow(Integer twoAllow) {
		this.twoAllow = twoAllow;
	}

}
