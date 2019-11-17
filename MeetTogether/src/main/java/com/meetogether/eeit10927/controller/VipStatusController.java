package com.meetogether.eeit10927.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.meetogether.eeit10927.service.IVipStatusService;
import com.meetogether.eeit10936.pairs.model.VipStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;


@Controller
public class VipStatusController {

	IVipStatusService vipService;

	@Autowired
	public void setMrService(IVipStatusService vipService) {
		this.vipService = vipService;
	}
	
	@RequestMapping(value = "/VipBuy")
	public void vipPayPage(Model model, HttpServletResponse response, HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("mbId"));
		VipStatus vip = new VipStatus();
		vip.setMbId(userId);
		
		String url = "";
		url = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath()
				+ request.getServletPath();
//		System.out.println("--------------present url: " + url);
		
		String orderNumber = vipService.add(vip);

		Date timeNow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String timeFormat = sdf.format(timeNow);

		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo(orderNumber);
		obj.setMerchantTradeDate(timeFormat);
		obj.setTotalAmount("300");
		obj.setTradeDesc("MeetTogether VIP金牌會員升級");
		obj.setItemName("MeetTogether VIP金牌會員-30天");
		obj.setReturnURL("http://localhost:8080/MeetTogether/VipPaySuccess");
		obj.setClientBackURL("http://localhost:8080/MeetTogether/VipPaySuccess?MerchantTradeNo="+orderNumber);
		obj.setNeedExtraPaidInfo("N");
		String form = all.aioCheckOut(obj, null);
//		System.out.println("---------------" + form);

		try {
			PrintWriter out = response.getWriter();
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset=\"UTF-8\">");
			out.println("<title>MeetTogether VIP金牌會員升級</title>");
			out.println("</head>");
			out.println("<body>");
			out.println(form);
			out.println("</body>");
			out.println("</html>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/VipPaySuccess", method=RequestMethod.GET)
	public String vipUpgradeSuccess(Model model, 
			@RequestParam(value = "MerchantTradeNo") String MerchantTradeNo) {
//		System.out.println("--------MerchantTradeNo: " + MerchantTradeNo);
		vipService.vipUpgradeSuccess(MerchantTradeNo);
		return "forward:/";
	}
	

}
