package com.meetogether.eeit10927.view;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.meetogether.eeit10927.model.Message;
import com.meetogether.eeit10927.model.Msglike;
import com.meetogether.eeit10927.model.Msgreply;
import com.meetogether.eeit10927.model.Msgtag;
import com.meetogether.eeit10927.service.IMsgreplyService;
import com.meetogether.eeit10927.viewresolver.AbstractITextPdfView;

public class SingleMessagePdfView extends AbstractITextPdfView {
//	@Autowired
//	IMsgreplyService mrService;
	
	final String fontPath = "c:\\windows\\fonts\\kaiu.ttf";
	BaseFont bfChinese;
	Font titleFont;

	Font normalFont;
	Font italicFont;
	Font underlineFont;

	// 設定字型物件
	private void init() throws Exception {
		bfChinese = BaseFont.createFont(fontPath, "Identity-H", BaseFont.NOT_EMBEDDED);
//		titleFont = new Font(bfChinese, 18, Font.BOLD);
		titleFont = new Font(bfChinese, 10, Font.NORMAL);
		normalFont = new Font(bfChinese, 14, Font.NORMAL);
		italicFont = new Font(bfChinese, 12, Font.ITALIC);
		underlineFont = new Font(bfChinese, 30, Font.UNDERLINE);
	}

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		init();
		// 由新頁開始列印表格
		document.newPage();
		// 處理表格式資料		
		processTable(model, document, 0);
		
	}
	
	// 處理表格化資料
	@SuppressWarnings("unchecked")
	private void processTable(Map<String, Object> model, Document document, int newLines) throws Exception {
		// 表格的前置資料
		for(int n=0; n < newLines; n++) {
			document.add( Chunk.NEWLINE );	
		}
		
		addTitle(document, "討論區文章匯出", underlineFont);
		document.add( Chunk.NEWLINE );	
//		String[] tableTitle = { "使用者名稱", "發文時間/更新時間", "文章標題", "文章內容", "文章附圖", "文章tag", "文章按讚數", "文章留言" };
		// 取得在model Attribute的值
		Message m =  (Message) model.get("Message");
		List<Msgreply> reply = (List<Msgreply>) model.get("MessageReply");
		List<Msglike> like = (List<Msglike>) model.get("MessageLike");
		// cell 1 使用者名稱
		String memberName = "發文者: " + m.getMember().getMemberName();
		// cell 2 發文時間;更新時間
		String createTime = m.getCreateTimeFormat();
		String updateTime = m.getUpdateTimeFormat();
		String msgTime = "";
		if (updateTime.length() > 0) {
			msgTime = "發文時間: " + createTime + "; 更新時間: " + updateTime; 
		} else {
			msgTime = "發文時間: " + createTime;
		}
		// cell 3 文章標題
		String msgTitle = m.getMsgTitle();
		String msgType = m.getMsgType().getTypeName();
		String msgTypeTitle = "[" + msgType + "] " + msgTitle;
		// cell 4 文章內容
		String msgText = m.getMsgText().replace("<br>", "\n");
		// cell 5 文章附圖
		
		// cell 6 文章tag
		List<Msgtag> tags = m.getMsgtag();
		String tagNames = "文章TAG: ";
		for (Msgtag tag : tags) {
			tagNames = tagNames + tag.getTagName() + " ";
		}
		// cell 7 文章按讚人
		StringBuilder stringBuilder2 = new StringBuilder();
		stringBuilder2.append("按讚會員: \n");
		for (Msglike onelike : like) {
			stringBuilder2.append(onelike.getMember().getMemberName());
			stringBuilder2.append("\n");
		}
		String msgLikeCnt = stringBuilder2.toString();
		
		// cell 8 文章留言
		StringBuilder stringBuilder1 = new StringBuilder();
		stringBuilder1.append("回覆留言內容: \n");
		for (Msgreply oneReply : reply) {
			stringBuilder1.append(oneReply.getMember().getMemberName());
			stringBuilder1.append(": \t");
			stringBuilder1.append(oneReply.getReplyText());
			stringBuilder1.append("\n");
		}
		String replyContent = stringBuilder1.toString();
		
		String[] tableContent = { memberName, msgTime, msgTypeTitle, msgText, "文章附圖", tagNames, msgLikeCnt, replyContent };
		PdfPTable table1 = createTable(model, tableContent,  5);
		document.add(table1);
	}
	
	private PdfPTable createTable(Map<String, Object> model, String[] title, int columnCount ) {
		PdfPTable table = new PdfPTable(columnCount); // PDF文件的直欄數量
		table.setWidthPercentage(80f);
		setTableHeading(model, table, title); 
//		setTableData(table, model);
		return table;
		// 處理表格的標頭 // .setVerticalAlignment(Element.ALIGN_MIDDLE);
	}
	
	
	private void setTableHeading(Map<String, Object> model, PdfPTable table, String[] title) {
		Message m =  (Message) model.get("Message");
		
		int[] cellColspan = { 5, 5, 5, 3, 2, 3, 2, 5 };
//		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
//		table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		table.getDefaultCell().setBackgroundColor(BaseColor.WHITE);
		table.getDefaultCell().setBorderColor(BaseColor.LIGHT_GRAY);
		BaseColor color = new BaseColor(224, 224, 224);
		table.getDefaultCell().setBackgroundColor(color);
		for(int n = 1; n <= title.length; n++) {
			if (n == 5) {
//				String imgAddress = "D:\\temp\\noface.jpg";
				Image image;
				try {
					Blob msgPhoto = m.getMsgPhoto();
					int blobLength = (int) msgPhoto.length();  
					byte[] blobAsBytes = msgPhoto.getBytes(1, blobLength);
					image = Image.getInstance(blobAsBytes);
					image.scaleToFit(240, 72);
					PdfPCell cell5 = new PdfPCell(image);
					cell5.setColspan(cellColspan[n - 1]);
					cell5.setPaddingBottom(8F);
					cell5.setPaddingTop(8F);
					cell5.setPaddingLeft(8F);
					table.addCell(cell5);
				} catch (BadElementException | IOException | SQLException e) {
					e.printStackTrace();
				}
				continue;
			}
			PdfPCell cell = new PdfPCell();
			cell.setPaddingBottom(8F);
			cell.setBackgroundColor(BaseColor.WHITE);
			cell.setPhrase(new Phrase(title[n - 1], titleFont));
			cell.setColspan(cellColspan[n - 1]);
			table.addCell(cell);
		}
		
	}
	
	private void addTitle(Document document, String title, Font font) throws Exception {
		Paragraph pg1 = new Paragraph();
		pg1.setFont(font);
		pg1.setAlignment(Paragraph.ALIGN_CENTER);
		pg1.add(title);
		document.add(pg1);
	}
	
	private void addStringToParagraph(Document document, String textFile) throws Exception {
		Paragraph pg1 = new Paragraph();
		pg1.setFont(normalFont);
		pg1.add(textFile);
		document.add( Chunk.NEWLINE );
		document.add(pg1);
	}
	
	class MyTextPdfPCell extends PdfPCell{
		MyTextPdfPCell(){
	    	setBackgroundColor(BaseColor.LIGHT_GRAY);
	    	setPaddingBottom(8F);
	    	setHorizontalAlignment(Element.ALIGN_CENTER);
	    	setVerticalAlignment(Element.ALIGN_MIDDLE);
		}
	}

}
