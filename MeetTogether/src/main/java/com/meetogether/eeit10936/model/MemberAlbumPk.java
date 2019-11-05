package com.meetogether.eeit10936.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class MemberAlbumPk implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(name = "memberId")
	private Integer memberId;
	@Column(name = "fileName")
	private String fileName;

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof MemberAlbumPk))
			return false;
		MemberAlbumPk that = (MemberAlbumPk) o;
		return Objects.equals(getMemberId(), that.getMemberId()) && Objects.equals(getFileName(), that.getFileName());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getMemberId(), getFileName());
	}

}
