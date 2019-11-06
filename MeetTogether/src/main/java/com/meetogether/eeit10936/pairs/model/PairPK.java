package com.meetogether.eeit10936.pairs.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PairPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Column(name = "memberid")
	private Integer memberId;
	@Column(name = "pairmemberid")
	private Integer pairMemberId;

	public PairPK() {

	}

	public PairPK(Integer memberId, Integer pairMemberId) {
		this.memberId = memberId;
		this.pairMemberId = pairMemberId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getPairMemberId() {
		return pairMemberId;
	}

	public void setPairMemberId(Integer pairMemberId) {
		this.pairMemberId = pairMemberId;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (!(o instanceof PairPK))
			return false;
		PairPK that = (PairPK) o;
		return Objects.equals(getMemberId(), that.getMemberId())
				&& Objects.equals(getPairMemberId(), that.getPairMemberId());
	}

	@Override
	public int hashCode() {
		return Objects.hash(getMemberId(), getPairMemberId());
	}

}
