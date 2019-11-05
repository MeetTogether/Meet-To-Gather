package com.meetogether.eeit10936.model;

import java.io.Serializable;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "album")
public class MemberAlbum implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	@AttributeOverrides({ @AttributeOverride(name = "memberId", column = @Column(name = "memberid")),
			@AttributeOverride(name = "fileName", column = @Column(name = "fileName")) })
	private MemberAlbumPk pk;
	@Column(name = "status")
	private Integer status;
	@Column(name = "deleteTag")
	private Integer deleteTag;
	
	public MemberAlbumPk getPk() {
		return pk;
	}
	public void setPk(MemberAlbumPk pk) {
		this.pk = pk;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getDeleteTag() {
		return deleteTag;
	}
	public void setDeleteTag(Integer deleteTag) {
		this.deleteTag = deleteTag;
	}
	
}
