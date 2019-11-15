package com.meetogether.eeit10901.controller;

import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.AlbumService;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;

public class AlbumController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	

	AlbumService service;

	@Autowired
	public void setService(AlbumService service) {
		this.service = service;
	}
//	
//	@RequestMapping(value = "/addAlbum", method = RequestMethod.GET)
//	public String getaddAlbum(Model model) {
//		MemberAlbum mm = new MemberAlbum();
//		model.addAttribute("albumbean", mm);
//		return "eeit10901/album";
//	}
	
	@RequestMapping(value = "/addAlbum", method = RequestMethod.POST)
	public String addAlbum(@ModelAttribute("albumbean") MemberAlbum album, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		MultipartFile picture = album.getAlbumImage();

		String originalFilename = picture.getOriginalFilename();
//		album.setFileName(originalFilename);
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				album.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}

		}
		service.addAlbum(album);
		return "eeit10901/album";
}

}
