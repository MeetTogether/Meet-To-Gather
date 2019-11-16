package com.meetogether.eeit10908.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10927.model.Member;

@Entity
@Table(name="eventList")
public class ActBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer eventId;
	
	

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "memberId")
	private MemberBean memberId;
	String eventName;
	Integer eventCat;
	String eventTime;
	String groupNum;
	Integer budget;
	String eventPlace;
	String createTime;
	String actContent;
//	private MemberBean memberId;
	
	

//	
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "memberId")
//	public MemberBean getMember() {
//		return memberId;
//	}
//	public void setMember(MemberBean member) {
//		this.memberId = member;
//	}

	private String actFilename;
	private Blob actPhoto;
	@Transient
	private MultipartFile actImage;
	
	public MultipartFile getActImage() {
		return actImage;
	}
	public String getActContent() {
		return actContent;
	}
	public void setActContent(String actContent) {
		this.actContent = actContent;
	}
	public void setActImage(MultipartFile actImage) {
		this.actImage = actImage;
	}
	public Blob getActPhoto() {
		return actPhoto;
	}
	public void setActPhoto(Blob actPhoto) {
		this.actPhoto = actPhoto;
	}
	public String getActFilename() {
		return actFilename;
	}
	public void setActFilename(String actFilename) {
		this.actFilename = actFilename;
	}
	//	@JsonIgnoreProperties("acts")
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_CatBean_Id") 	
    private CatBean catbean;
	
	
	public CatBean getCatbean() {
		return catbean;
	}
	public void setCatbean(CatBean catbean) {
		this.catbean = catbean;
	}
	public Integer getEventId() {
		return eventId;
	}
	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}
	public MemberBean getMemberId() {
		return memberId;
	}
	public void setMemberId(MemberBean memberId) {
		this.memberId = memberId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Integer getEventCat() {
		return eventCat;
	}
	public void setEventCat(Integer eventCat) {
		this.eventCat = eventCat;
	}
	public String getEventTime() {
		return eventTime;
	}
	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}
	public String getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}
	public Integer getBudget() {
		return budget;
	}
	public void setBudget(Integer budget) {
		this.budget = budget;
	}
	public String getEventPlace() {
		return eventPlace;
	}
	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	public String getCreateTime() {
		return createTime;
	}
	public ActBean() {
		
	}
	
	public ActBean(Integer eventId, MemberBean memberId, String eventName, Integer eventCat, String eventTime,
			String groupNum, Integer budget, String eventPlace, String createTime, CatBean catbean) {
		super();
		this.eventId = eventId;
		this.memberId = memberId;
		this.eventName = eventName;
		this.eventCat = eventCat;
		this.eventTime = eventTime;
		this.groupNum = groupNum;
		this.budget = budget;
		this.eventPlace = eventPlace;
		this.createTime = createTime;
		this.catbean = catbean;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	

}