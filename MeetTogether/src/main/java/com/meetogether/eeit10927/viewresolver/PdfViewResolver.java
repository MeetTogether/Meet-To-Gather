package com.meetogether.eeit10927.viewresolver;

import java.util.Locale;

import javax.servlet.ServletContext;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import com.meetogether.eeit10927.view.MultipleMessagesPdfView;
import com.meetogether.eeit10927.view.SingleMessagePdfView;

public class PdfViewResolver implements ViewResolver {
	
	ServletContext context;
	public PdfViewResolver(ServletContext context) {
		this.context = context;
	}

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		View view = null;
		if (viewName.startsWith("message/showAllMessages")) {
			// 由於要展示如何顯示位於檔案內的資料，所以傳入ServletContext物件以便開啟文字檔。
			view = new MultipleMessagesPdfView(context);
		} else if (viewName.startsWith("message/showSingleMessage"))  {
			view = new SingleMessagePdfView();
		} 
		System.out.println("PdfViewResolver, viewName=" + viewName + ", return value=" + view);
		return view;
	}

}
