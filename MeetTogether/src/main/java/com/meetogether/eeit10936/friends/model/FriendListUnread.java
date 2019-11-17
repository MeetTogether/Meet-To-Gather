package com.meetogether.eeit10936.friends.model;

import java.io.Serializable;

public class FriendListUnread implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private String unRead;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnRead() {
		return unRead;
	}
	public void setUnRead(String unRead) {
		this.unRead = unRead;
	}

}
