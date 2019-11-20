package com.meetogether.eeit10936.friends.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "addFriend")
public class AddFriend implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "addFriendId")
	private Integer addFriendId;
	@Column(name = "f1Id")
	private Integer f1Id;
	@Column(name = "f2Id")
	private Integer f2Id;
	@Column(name = "f1IdAllow")
	private Integer f1IdAllow;
	@Column(name = "f2IdAllow")
	private Integer f2IdAllow;
	
	public Integer getAddFriendId() {
		return addFriendId;
	}
	public void setAddFriendId(Integer addFriendId) {
		this.addFriendId = addFriendId;
	}
	public Integer getF1Id() {
		return f1Id;
	}
	public void setF1Id(Integer f1Id) {
		this.f1Id = f1Id;
	}
	public Integer getF2Id() {
		return f2Id;
	}
	public void setF2Id(Integer f2Id) {
		this.f2Id = f2Id;
	}
	public Integer getF1IdAllow() {
		return f1IdAllow;
	}
	public void setF1IdAllow(Integer f1IdAllow) {
		this.f1IdAllow = f1IdAllow;
	}
	public Integer getF2IdAllow() {
		return f2IdAllow;
	}
	public void setF2IdAllow(Integer f2IdAllow) {
		this.f2IdAllow = f2IdAllow;
	}
}
