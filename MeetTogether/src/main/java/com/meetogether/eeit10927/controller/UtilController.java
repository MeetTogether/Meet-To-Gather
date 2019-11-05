package com.meetogether.eeit10927.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Random;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.service.IMessageService;

@Controller
public class UtilController {

	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	IMessageService msgService;
	@Autowired
	public void setMsgService(IMessageService msgService) {
		this.msgService = msgService;
	}

	MemberService mService;
	@Autowired
	public void setMService(MemberService mService) {
		this.mService = mService;
	}

	@RequestMapping(value = "eeit10927/Captcha", method = RequestMethod.GET)
	public ModelAndView getCaptchaImage(Model model, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("image/jpeg");
		String capText = new Random(System.currentTimeMillis()).ints(0, 10).limit(4).mapToObj(String::valueOf)
				.collect(Collectors.joining());
		request.getSession().setAttribute("captcha", capText);
		try {
			ImageIO.write(getPasswdImage(capText), "JPG", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private BufferedImage getPasswdImage(String capText) {
		System.out.println("captcha: " + capText);
		BufferedImage bufferedImage = new BufferedImage(60, 25, BufferedImage.TYPE_INT_RGB);
		Graphics g = bufferedImage.getGraphics();
		g.setColor(Color.WHITE);
		g.setFont(new Font("微軟正黑體", Font.BOLD, 16));
		g.drawString(capText, 10, 15);
		return bufferedImage;
	}

	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(Model model, HttpServletRequest request,
			@RequestParam(value = "id") Integer id, 
			@RequestParam(value = "type") String type) {
		String filePath = "/resources/images/NoImage.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String fileName = "";
		int len = 0;
		Blob blob = null;

		if (type.equals("member")) {
			MemberBean member = msgService.getMemberById(id);
			fileName = member.getFileName();
			System.out.println("member filename: " + fileName);
			blob = member.getPhoto();
//			filePath = "C:/temp/images/member/" + fileName;
		} else if (type.equals("message")) {
			Message message = msgService.getMsgByMsgId(id);
			fileName = message.getMsgFilename();
			blob = message.getMsgPhoto();
//			filePath = "C:/temp/images/message/" + fileName;
		}
		if (blob != null) {
			try {
				len = (int) blob.length();
				media = blob.getBytes(1, len);
			} catch (SQLException e) {
				throw new RuntimeException("getImage()發生Exception" + e.getStackTrace());
			}
		} else {
			media = toByteArray(filePath);
			fileName = filePath;
		}
		
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(fileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType: " + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

//	private byte[] toByteArray(String filepath) {
//		byte[] b = null;
//		File file = new File(filepath);
//		try (
//			FileInputStream fis = new FileInputStream(file);
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		) {
//			b = new byte[8192];
//			int len = 0;
//			while ((len = fis.read(b)) != -1) {
//				baos.write(b, 0, len);
//			}
//			b = baos.toByteArray();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return b;
//	}

}
