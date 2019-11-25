package com.meetogether.eeit10927.model;

import java.io.Serializable;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;

@Entity
@Table(name="message")
@DynamicInsert
@DynamicUpdate
public class Message implements Serializable {

	public Message(String msgTitle, String msgText, Blob msgPhoto, String createTimeFormat, String updateTimeFormat,
			Integer likeCount, Integer replyCount, MemberBean member, MsgType msgType, List<Msglike> msglike,
			List<Msgreply> msgreply, List<Msgtag> msgtag) {
		super();
		this.msgTitle = msgTitle;
		this.msgText = msgText;
		this.msgPhoto = msgPhoto;
		this.createTimeFormat = createTimeFormat;
		this.updateTimeFormat = updateTimeFormat;
		this.likeCount = likeCount;
		this.replyCount = replyCount;
		this.member = member;
		this.msgType = msgType;
		this.msglike = msglike;
		this.msgreply = msgreply;
		this.msgtag = msgtag;
	}
	// new Message(createTime, msgTitle, msgText, replyCount);
	public Message(String msgTitle, String msgText, String createTimeFormat, Integer replyCount) {
		super();
		this.msgTitle = msgTitle;
		this.msgText = msgText;
		this.createTimeFormat = createTimeFormat;
		this.replyCount = replyCount;
	}

	private static final long serialVersionUID = 1L;
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd");
	
	private Integer msgId;
	private String msgTitle;
	private String msgText;
	private String msgTextShort;
	private String msgFilename;
	private Blob msgPhoto;
	private MultipartFile msgImage;
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date createTime;
	private String createTimeFormat;
	
	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date updateTime;
	private String updateTimeFormat;
	
	private String deleteTag;
	private Integer likeCount;
	private Integer replyCount;
	private MemberBean member;
	private Integer mbId;
	private MsgType msgType;
	private Integer mtId;
	private String mtName;
	private List<Msglike> msglike = new ArrayList<>();
	private List<Msgreply> msgreply = new ArrayList<>();
	private List<Msgtag> msgtag = new ArrayList<>();
	private List<String> msgTagName;

	public Message() {
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgText() {
		return msgText;
	}

	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}
	@Transient
	public String getMsgTextShort() {
		if (msgText.length() < 50) {
			return msgText;
		} else {
			return msgText.substring(0, 50);
		}
	}

	public void setMsgTextShort(String msgTextShort) {
		this.msgTextShort = msgTextShort;
	}
	
	public String getMsgFilename() {
		return msgFilename;
	}

	public void setMsgFilename(String msgFilename) {
		this.msgFilename = msgFilename;
	}

	public Blob getMsgPhoto() {
		return msgPhoto;
	}

	public void setMsgPhoto(Blob msgPhoto) {
		this.msgPhoto = msgPhoto;
	}
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date date) {
		this.createTime = date;
	}
	
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getDeleteTag() {
		return deleteTag;
	}

	public void setDeleteTag(String deleteTag) {
		this.deleteTag = deleteTag;
	}
	
	public Integer getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(Integer likeCount) {
		this.likeCount = likeCount;
	}

	public Integer getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	
	@Transient
	public MultipartFile getMsgImage() {
		return msgImage;
	}

	public void setMsgImage(MultipartFile msgImage) {
		this.msgImage = msgImage;
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
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "msgTypeId")
	public MsgType getMsgType() {
		return msgType;
	}

	public void setMsgType(MsgType msgType) {
		this.msgType = msgType;
	}
	
	@Transient
	public Integer getMtId() {
		return mtId;
	}
	
	public void setMtId(Integer mtId) {
		this.mtId = mtId;
	}
	
	@Transient
	public String getMtName() {
		return mtName;
	}
	
	public void setMtName(String mtName) {
		this.mtName = mtName;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "message")
	public List<Msglike> getMsglike() {
		return msglike;
	}

	public void setMsglike(List<Msglike> msglike) {
		this.msglike = msglike;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "message")
	public List<Msgreply> getMsgreply() {
		return msgreply;
	}

	public void setMsgreply(List<Msgreply> msgreply) {
		this.msgreply = msgreply;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "message", fetch = FetchType.EAGER)
	public List<Msgtag> getMsgtag() {
		return msgtag;
	}

	public void setMsgtag(List<Msgtag> msgtag) {
		this.msgtag = msgtag;
	}

	@Transient
	public String getCreateTimeFormat() {
		return sdf1.format(createTime);
	}

	public void setCreateTimeFormat(String createTimeFormat) {
		this.createTimeFormat = createTimeFormat;
	}

	@Transient
	public String getUpdateTimeFormat() {
		if (updateTime == null)
			return "";
		else
			return sdf1.format(updateTime);
	}

	public void setUpdateTimeFormat(String updateTimeFormat) {
		this.updateTimeFormat = updateTimeFormat;
	}

	@Transient
	public List<String> getMsgTagName() {
		return msgTagName;
	}

	public void setMsgTagName(List<String> msgTagName) {
		this.msgTagName = msgTagName;
	}


}
