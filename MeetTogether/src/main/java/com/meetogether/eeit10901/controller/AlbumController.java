package com.meetogether.eeit10901.controller;

import java.sql.Blob;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.service.AlbumService;
import com.meetogether.eeit10936.pairs.model.MemberAlbum;
import com.meetogether.eeit10936.pairs.model.MemberAlbumPk;
@Controller
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
	
	@RequestMapping(value = "/addAlbum", method = RequestMethod.GET)
	public String getaddRegister(Model model) {
		MemberAlbumPk mapk= new MemberAlbumPk();
		MemberAlbum ma =new MemberAlbum(mapk);
		model.addAttribute("ma", ma);
		return "eeit10901/addAlbum";
	}

	@RequestMapping(value = "/addAlbum", method = RequestMethod.POST)
	public String addRegister(@ModelAttribute("ma") MemberAlbum ma, BindingResult result,
			HttpServletRequest request) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		MultipartFile picture = ma.getAlbumImage();
		String originalFilename = picture.getOriginalFilename();
		ma.getPk().setFileName(originalFilename);
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				ma.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}

		}
		service.addAlbum(ma);
		return "eeit10901/addAlbum";
	}

	

}
