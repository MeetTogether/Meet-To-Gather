package com.meetogether.eeit10936.chat.model;

import java.util.Date;

public class InMessage {

	private Integer from;

	private Integer to;

	private String content;

	private Date time;

	InMessage() {

	}

	InMessage(String content) {
		this.content = content;

	}

	public Integer getFrom() {
		return from;
	}

	public void setFrom(Integer from) {
		this.from = from;
	}

	public Integer getTo() {
		return to;
	}

	public void setTo(Integer to) {
		this.to = to;
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