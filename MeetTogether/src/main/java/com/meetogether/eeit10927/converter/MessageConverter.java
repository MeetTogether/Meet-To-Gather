package com.meetogether.eeit10927.converter;

import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.sql.Date;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.meetogether.eeit10927.model.Message;

public class MessageConverter extends AbstractHttpMessageConverter<Message>  {
	
	public MessageConverter() {
		super(new MediaType("text", "message"));
		System.out.println("--------------------------------");
	}

	@Override
	protected boolean supports(Class<?> clazz) {
		return Message.class.isAssignableFrom(clazz);
	}

	@Override
	protected Message readInternal(Class<? extends Message> clazz, HttpInputMessage inputMessage)
			throws IOException, HttpMessageNotReadableException {
		InputStream is = inputMessage.getBody();
		Reader reader = new InputStreamReader(is, "UTF-8");
		CharArrayWriter  caw = new CharArrayWriter();
		char[] ca = new char[1024];
		int len = 0 ;
		while ((len = reader.read(ca))!= -1) {
			caw.write(ca, 0, len);
		}
		String requestBody = caw.toString();
		System.out.println("MessageConverter-line44: " + requestBody);
		String[] sa = requestBody.split(System.getProperty("line.separator"));
		String msgTitle = sa[0];
		String msgText = sa[1];
		String createTime = sa[2];
		Integer replyCount = Integer.parseInt(sa[3]);
		System.out.println("MessageConverter-line51: " + sa);
		Message msg = new Message(msgTitle, msgText, createTime, replyCount);
		return msg;
	}

	@Override
	protected void writeInternal(Message msg, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		
		try {
			OutputStream outputStream = outputMessage.getBody();
			String body = msg.getMsgTitle() + "\n" + 
			              msg.getMsgText() + "\n" +  
					      String.valueOf(msg.getCreateTime()) + "\n" +  
					      String.valueOf(msg.getReplyCount()) ;  
			outputStream.write(body.getBytes());
			outputStream.close();
			System.out.println("MessageConverter-line67: " + body);
		} catch (Exception e) {
		}
		
	}

}
