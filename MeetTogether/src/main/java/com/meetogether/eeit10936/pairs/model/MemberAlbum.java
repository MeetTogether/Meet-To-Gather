package com.meetogether.eeit10936.pairs.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "album")
public class MemberAlbum implements Serializable {

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
	@Column(name = "photo")
	private Blob photo;
	
	@Transient
    MultipartFile albumImage;
	
	
	
 
	public MultipartFile getAlbumImage() {
		return albumImage;
	}
	public void setAlbumImage(MultipartFile albumImage) {
		this.albumImage = albumImage;
	}
	MemberAlbum(){
		
	}
	public MemberAlbum(MemberAlbumPk pk){
		this.pk=pk;
	}

	


	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

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

