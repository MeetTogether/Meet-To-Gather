package com.meetogether.eeit10913.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10908.model.ActBean;

@Entity
@Table(name = "eventReview")
public class ReviewBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer reviewId;
	private ActBean eventId;
	private MemberBean member;
	private String eventComment;
	private Integer eventStars;
	private Integer mbId;
	private Timestamp createTime;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reviewId")
	public Integer getReviewId() {
		return reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "eventId")
	public ActBean getEventId() {
		return eventId;
	}

	public void setEventId(ActBean eventId) {
		this.eventId = eventId;
	}

	@Column(name="createTime", insertable=false,updatable=false)
	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getEventComment() {
		return eventComment;
	}

	public void setEventComment(String eventComment) {
		this.eventComment = eventComment;
	}

	public Integer getEventStars() {
		return eventStars;
	}

	public void setEventStars(Integer eventStars) {
		this.eventStars = eventStars;
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

	public ReviewBean(Integer reviewId, ActBean eventId, Integer mbId, String eventComment, Integer eventStars,
			Timestamp createTime, MemberBean memberBean) {
		super();
		this.reviewId = reviewId;
		this.eventId = eventId;
		this.mbId = mbId;
		this.eventComment = eventComment;
		this.eventStars = eventStars;
		this.createTime = createTime;
//		this.memberBean = memberBean;

	}

	public ReviewBean() {
		// TODO Auto-generated constructor stub
	}

//json
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("ReviewBean [reviewId=");
//		builder.append(reviewId);
//		builder.append(", eventId=");
//		builder.append(eventId);
//		builder.append(", mbId=");
//		builder.append(mbId);
//		builder.append(", eventComment=");
//		builder.append(eventComment);
//		builder.append(", eventStars=");
//		builder.append(eventStars);
////		builder.append(", memberBean=");
////		builder.append(memberBean);
//		builder.append("]");
//		return builder.toString();
//	}

}
