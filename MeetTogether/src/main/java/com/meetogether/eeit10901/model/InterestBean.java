package com.meetogether.eeit10901.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.web.multipart.MultipartFile;

//@Entity
@Table(name = "interest")
public class InterestBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "interestId")
	Integer interestId;
	String interestName;

	public InterestBean(Integer interestId, String interestName) {

		this.interestId = interestId;
		this.interestName = interestName;

	}

	public Integer getInterestId() {
		return interestId;
	}

	public void setInterestId(Integer interestId) {
		this.interestId = interestId;
	}

	public String getInterestName() {
		return interestName;
	}

	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
