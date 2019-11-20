package com.meetogether.eeit10908.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.meetogether.eeit10901.model.MemberBean;
import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10908.model.ActBean;
import com.meetogether.eeit10908.model.ActJoinBean;
import com.meetogether.eeit10908.model.CatBean;
import com.meetogether.eeit10908.service.impl.ActService;
import com.meetogether.eeit10913.model.ReviewBean;
import com.meetogether.eeit10913.service.ProductService;



@Controller
public class ActController {


	ActService service;
	
	ServletContext context;
	
	MemberService mService;
	
	ProductService pService;
	
	
	@Autowired
	public void setpService(ProductService pService) {
		this.pService = pService;
	}
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	@Autowired
	public void setService(ActService service) {
		this.service = service;
	}
	
	@Autowired
	public void setmService(MemberService mService) {
		this.mService = mService;
	}
//	@RequestMapping("/eeit10908")
//	public String index(Model model) {
//		List<ActBean> beans = service.getAllAct();	
//		CatBean cc = new CatBean();
//		model.addAttribute("actBeanCat",cc);
//		model.addAttribute("actBeanList",beans);
//		return "/eeit10908/index";
//	}
	
	@RequestMapping(value = "/index/ChangeIndexCat")
	public String selectIndexCat(@RequestParam("eventCat") int catId,Model model, HttpServletRequest request) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		model.addAttribute("member",memberbean);
		if(userId == null) {
			return "redirect:/";
		}
		List<ActBean> aaa = service.getActivityByCat(catId);
		Map<Integer, String> bbb= getCompanyList(); 
		System.out.println(catId);
		ActBean aa = new ActBean();
		model.addAttribute("actBean", aa); 
		String Catclass = (String)bbb.get(catId);
		model.addAttribute("catclass",Catclass);
		model.addAttribute("actBeanCat",aaa);
		return "/eeit10908/QueryCatIndex";
	}
	
	@RequestMapping(value = "/eeit10908/index/ChangeIndexCat")
	public String selectIndexCats(@RequestParam("eventCat") int catId,Model model, HttpServletRequest request) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		model.addAttribute("member",memberbean);
		
		List<ActBean> aaa = service.getActivityByCat(catId);
		Map<Integer, String> bbb= getCompanyList(); 
		System.out.println(catId);
		ActBean aa = new ActBean();
		model.addAttribute("actBean", aa); 
		String Catclass = (String)bbb.get(catId);
		model.addAttribute("catclass",Catclass);
		model.addAttribute("actBeanCat",aaa);
		return "/eeit10908/QueryCatIndex";
	}
	
	@RequestMapping(value = "/eeit10908", method = RequestMethod.GET)
	public String getAddNewProductForm(Model model, HttpServletRequest request) {
		System.out.println("--------------+++------------");
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		MemberBean memberbean = mService.getMemberById(userId);
		List<ActJoinBean> joinBeans = service.CheckJoinPersons(userId);
		model.addAttribute("ActJoinBeans",joinBeans);
//		model.addAttribute("member",memberbean);
		List<ActBean> beans = service.getAllAct();	
	    ActBean aa = new ActBean();
	    aa.setMemberId(memberbean);
	    CatBean cc = new CatBean();
		model.addAttribute("actBeanCat",cc);
	    //aa.setGroupNum("9");
		model.addAttribute("actBeanList",beans);
	    model.addAttribute("actBean", aa); 
	    return "/eeit10908/index";
	}
	 
	@RequestMapping(value = "/eeit10908", method = RequestMethod.POST)
	public String processAddNewProductForm(@ModelAttribute("actBean") ActBean aa
			) {

		MultipartFile msgImage = aa.getActImage();
		String originalFilename = msgImage.getOriginalFilename();
		String ext = "";
		String savedFilename = "";
		boolean imageUpdate = false;
		// 將留言上傳照片寫入資料庫
		if (originalFilename.length() > 0) {	
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			imageUpdate = true;
			try {
				byte[] b = msgImage.getBytes();
				Blob blob = new SerialBlob(b);
				aa.setActPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		service.addActivity(aa);
		
		if (originalFilename.length() > 0) {
			savedFilename = "Message-" + aa.getEventId() + "-" + String.valueOf(System.currentTimeMillis()) + ext;
			service.updateActImageFilename(aa.getEventId(), savedFilename);
		}

		
		return "redirect:/eeit10908";
	}
	
	
	@RequestMapping(value = "/getPicture/{actId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer actId) {
		String filePath = "${pageContext.request.contextPath}/images/bg_2.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ActBean bean = service.getActivityById(actId);
		if (bean != null) {
			Blob blob = bean.getActPhoto();
			filename = bean.getActFilename();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
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
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	@RequestMapping(value = "/index/addActis", method = RequestMethod.GET)
	public String getAddNewProductForms(Model model,HttpServletRequest request) {
		System.out.println("--------------+++------------");
		Integer userId = (Integer) request.getSession().getAttribute("userId");
	    ActBean aa = new ActBean();
	    
	    aa.setGroupNum("9");
	    model.addAttribute("actBean", aa); 
	    return "/eeit10908/";
	}
	 
	@RequestMapping(value = "/index/addActis", method = RequestMethod.POST)
	public String processAddNewProductForms(@ModelAttribute("actBean") ActBean aa
			) {
		MultipartFile msgImage = aa.getActImage();
		String originalFilename = msgImage.getOriginalFilename();
		String ext = "";
		String savedFilename = "";
		boolean imageUpdate = false;
		// 將留言上傳照片寫入資料庫
		if (originalFilename.length() > 0) {	
			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
			imageUpdate = true;
			try {
				byte[] b = msgImage.getBytes();
				Blob blob = new SerialBlob(b);
				aa.setActPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		service.addActivity(aa);
		
		if (originalFilename.length() > 0) {
			savedFilename = "Message-" + aa.getEventId() + "-" + String.valueOf(System.currentTimeMillis()) + ext;
			service.updateActImageFilename(aa.getEventId(), savedFilename);
		}


		return "redirect:/eeit10908";
	}
	
	
	@RequestMapping(value = "/index/deleteActivity")
	public String delete(@RequestParam("getId") int ActId) {
		 service.deleteActivity(ActId);

		 return "redirect:/eeit10908";
	}
	
	@RequestMapping(value = "/index/index/deleteActivity")
	public String deletes(@RequestParam("getId") int ActId) {
		 service.deleteActivity(ActId);

		 return "redirect:/eeit10908";
	}
	
	@RequestMapping(value = "/ByActivity")
	public String getActById(@RequestParam("getId") Integer id,Model model,HttpServletRequest request) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
		List<ReviewBean> review = pService.selectALL();
		model.addAttribute("review",review);
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		
		model.addAttribute("member",memberbean);
	    return "/eeit10908/ViewOneAct";
	}
	
	@RequestMapping(value = "/index/ByActivity")
	public String getActByIds(@RequestParam("getId") Integer id,Model model,HttpServletRequest request) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
		List<ReviewBean> review = pService.selectALL();
		model.addAttribute("review",review);
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		model.addAttribute("member",memberbean);
	    return "/eeit10908/ViewOneAct";
	}
	
	@RequestMapping(value = "/eeit10908/ByActivity")
	public String getActByIds2(@RequestParam("getId") Integer id,Model model,HttpServletRequest request) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
		List<ReviewBean> review = pService.selectALL();
		model.addAttribute("review",review);
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		model.addAttribute("member",memberbean);
	    return "/eeit10908/ViewOneAct";
	}
	
	@RequestMapping(value = "/eeit10908/index/ByActivity")
	public String getActByIds3(@RequestParam("getId") Integer id,Model model,HttpServletRequest request) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
		List<ReviewBean> review = pService.selectALL();
		model.addAttribute("review",review);
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		MemberBean memberbean = mService.getMemberById(userId);
		model.addAttribute("member",memberbean);
	    return "/eeit10908/ViewOneAct";
	}
	
	
	@RequestMapping(value = "/actdata", method = RequestMethod.GET)
	public String getActByIdForm(@RequestParam("getId") Integer id,Model model) {
		System.out.println("--------------+++------------");
		
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
	    return "/eeit10908/Actdata";
	}

	@RequestMapping(value = "/actdata", method = RequestMethod.POST)
	public String updateActByIdForm(@ModelAttribute("actdata") ActBean aa
			) {
		service.updateActivity(aa);
		return "redirect:/eeit10908";
	}
	
	
	@RequestMapping(value = "/index/actdata", method = RequestMethod.GET)
	public String getActByIdForms(@RequestParam("getId") Integer id,Model model) {
		System.out.println("--------------+++------------");
		model.addAttribute("actdata",service.getActivityById(id));
//		ActBean aa = new ActBean();
	   // model.addAttribute("actdata", aa); 
//	    return "Actdata";
	    return "/eeit10908/Actdata";
	}

	@RequestMapping(value = "/index/actdata", method = RequestMethod.POST)
	public String updateActByIdForms(@ModelAttribute("actdata") ActBean aa
			) {
		System.out.println("******--+-");
		System.out.println(aa.getEventId());
		System.out.println(aa.getMemberId());
		System.out.println(aa.getEventName());
		System.out.println(aa.getEventCat());
		System.out.println(aa.getEventTime());
		System.out.println(aa.getEventPlace());
		System.out.println(aa.getBudget());
		System.out.println(aa.getCreateTime());
		System.out.println(aa.getCatbean());
//		System.out.println("******"+aa.getEventCat());
		service.updateActivity(aa);
		return "redirect:/eeit10908";
	}
	
	
	@ModelAttribute("catList") //jsp識別字串
	public Map<Integer, String> getCompanyList() {
	    Map<Integer, String> companyMap = new HashMap<>();
	    List<CatBean> list = service.getCatList();
	    for (CatBean cb : list) {
	        companyMap.put(cb.getEventCat(), cb.getEventClass());
	    }
	    return companyMap;
	}
	
	
	@RequestMapping("/JoinAct")
    public String JoinActivity(@RequestParam("getActId") Integer id,Model model,HttpServletRequest request
    		) {
		Integer userId = (Integer) request.getSession().getAttribute("userId");
		ActJoinBean actJ = new ActJoinBean();
		MemberBean member = mService.getMemberById(userId);
		ActBean eventBean = service.getActivityById(id);
		actJ.setMemberbean(member);
		actJ.setEventBean(eventBean);
		service.addActJoin(actJ);
		return "redirect:/eeit10908";
    }
}
