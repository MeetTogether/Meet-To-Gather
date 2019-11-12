package com.meetogether.eeit10936.chat.model;

import java.util.Date;

public class OutMessage {

	private Integer from;

	private String content;

	private Date time = new Date();

	public OutMessage(Integer from, String content, Date time) {
		this.from = from;
		this.content = content;
		this.time = time;
	}

	public Integer getFrom() {
		return from;
	}

	public void setFrom(Integer from) {
		this.from = from;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}