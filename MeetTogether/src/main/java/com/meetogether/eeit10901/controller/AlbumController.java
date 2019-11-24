package com.meetogether.eeit10901.controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

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
import com.meetogether.eeit10936.pairs.service.IPairsService;

@Controller
public class AlbumController {
	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	@Autowired
	AlbumService mlService;

	@Autowired
	private IPairsService pService;
//	@Autowired
//	public void setService(AlbumService mlService) {
//		this.mlService = mlService;
//	}
	
	@RequestMapping(value = "/addAlbum", method = RequestMethod.GET)
	public String getaddAlbum(Model model, HttpServletRequest request) {
		int memberId = (Integer) request.getSession().getAttribute("userId");
		System.out.println("userId: " + memberId);
		MemberAlbumPk albumpk = new MemberAlbumPk();
		albumpk.setMemberId(memberId);
		MemberAlbum mm = new MemberAlbum(albumpk);
		model.addAttribute("albumbean", mm);
		
		// 有幾張照片
		int photoCount = mlService.countMemberPhoto(memberId);
		List<Integer> pCount = new ArrayList<Integer>();
		for (int i = 1; i <= photoCount; i++) {
			pCount.add(i);
		}
		model.addAttribute("photoStatus", photoCount+1);
		System.out.println("photo count: " + pCount);
		model.addAttribute("photoCount", pCount);
		model.addAttribute("photoCountInt", photoCount);
		return "eeit10901/addAlbum";
	}
	
	@RequestMapping(value = "/addAlbum", method = RequestMethod.POST)
	public String addAlbum(@ModelAttribute("albumbean") MemberAlbum album, BindingResult result,
			HttpServletRequest request, Model model) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		MultipartFile picture = album.getAlbumImage();//拿到照片
		String originalFilename = picture.getOriginalFilename();//取檔名出來
		album.getPk().setFileName(originalFilename);//把檔名放到pk 再放到album裡面
//		MemberAlbumPk albumpk = new MemberAlbumPk();
//		albumpk.setFileName(originalFilename);
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = context.getRealPath("/");
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {//處理照片
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);//blog的形式寫到資料庫
				album.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}

		}
		mlService.addAlbum(album);
		// 有幾張照片
		int memberId = (Integer) request.getSession().getAttribute("userId");
		int photoCount = mlService.countMemberPhoto(memberId);
		List<Integer> pCount = new ArrayList<Integer>();
		for (int i = 1; i <= photoCount; i++) {
			pCount.add(i);
		}
		System.out.println("photo count: " + pCount);
		model.addAttribute("photoCount", pCount);
		
		return "redirect:/addAlbum";
}
//	@RequestMapping("/Album")
//	public String getAlbum(Model model) {
//	List<MemberAlbum> list = mlService.getAllAlbum();
//	System.out.println("這是"+list);
//	model.addAttribute("albums", list);
//	return "eeit10901/addAlbum";
//	
//
//}
	
//	@RequestMapping(value = "/getPicture/{memberId}", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer memberId) {
//	    String filePath = "/resources/images/NoImage.jpg";
//	    byte[] media = null;
//	    HttpHeaders headers = new HttpHeaders();
//	    String filename = "";
//	    int len = 0;
//	    MemberAlbum bean = mlService.getMemberById(memberId);
//	    if (bean != null) {
//	        Blob blob = bean.getPhoto();
//	       
//	        if (blob != null) {
//	            try {
//	                len = (int) blob.length();
//	                media = blob.getBytes(1, len); //  blob.getBytes(1, len): 是 1 開頭。Jdbc相關的類別都是1 開頭。
//	            } catch (SQLException e) {
//	                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
//	            }
//	        } else {
//	            media = toByteArray(filePath);    
//	            filename = filePath;            
//	        }
//	    } else {
//	    	media = toByteArray(filePath);    
//	        filename = filePath;            
//	    }
//	       headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//	       String mimeType = context.getMimeType(filename);
//	    MediaType mediaType = MediaType.valueOf(mimeType);
//	    System.out.println("mediaType =" + mediaType);
//	    headers.setContentType(mediaType);
//	    ResponseEntity<byte[]> responseEntity = 
//	                new ResponseEntity<>(media, headers, HttpStatus.OK);
//	    return responseEntity;
//	}
//	
//	private byte[] toByteArray(String filepath) {
//	    byte[] b = null;
//	    String realPath = context.getRealPath(filepath);
//	    try {
//	          File file = new File(realPath);
//	          long size = file.length();
//	          b = new byte[(int)size];
//	          InputStream fis = context.getResourceAsStream(filepath);
//	          fis.read(b);
//	    } catch (FileNotFoundException e) {
//	          e.printStackTrace();
//	    } catch (IOException e) {
//	          e.printStackTrace();
//	    }
//	    return b;
//	}
	
//	@GetMapping(value = "/memberPhoto/{mid}/{status}", produces = "image/png")
//	public void showPhotos(@PathVariable("mid") Integer userId, @PathVariable("status") int status,
//			HttpServletResponse response) {
//		try {
//			InputStream is = pService.getPhotosById(userId, status).getBinaryStream();
//			ServletOutputStream os = response.getOutputStream();
//			int length;
//			byte[] buf = new byte[1024];
//			while ((length = is.read(buf)) != -1) {
//				os.write(buf, 0, length);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}

		
	

