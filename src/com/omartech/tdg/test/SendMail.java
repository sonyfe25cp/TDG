package com.omartech.tdg.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class SendMail {
	private String host = "mail.bit.edu.cn";
	// 这个是你的邮箱用户名
	private String username = "";
	// 你的邮箱密码
	private String password = "";

	private String mail_head_name = "文件头";

	private String mail_head_value = "文件头值";

	private String mail_to = "";

	private String mail_from = "40711087@bit.edu.cn";

	private String mail_subject = "";

	private String mail_body = "this is the mail_body of this test mail";

	public SendMail(String server){
		if(server.equals("126")){
			this.username = "noprinter@126.com";
			this.password = "omartech@406";
			this.host = "smtp.126.com";
			this.mail_from ="noprinter@126.com";
		}else if(server.equals("bit")){
			this.username="40711087@bit.edu.cn";
			this.password="nvidia7600";	
			this.host = "mail.bit.edu.cn";
			this.mail_from ="40711087@bit.edu.cn";
		}else if(server.equals("noprinter")){
			this.username = "admin@noprinter.cn";
			this.password = "85136986";
			this.host = "mail.noprinter.cn";
			this.mail_from = "admin@noprinter.cn";
		}
	}
	public void run() throws Exception{
		JavaMailSenderImpl senderImpl = new JavaMailSenderImpl(); 
	     
	    //设定mail server 
	    senderImpl.setHost(host); 
	    senderImpl.setUsername(username); 
	    senderImpl.setPassword(password); 
	    //建立邮件消息,发送简单邮件和html邮件的区别 
	    MimeMessage mailMessage = senderImpl.createMimeMessage(); 
	    //注意这里的boolean,等于真的时候才能嵌套图片，在构建MimeMessageHelper时候，所给定的值是true表示启用，         
//	multipart模式 
	    MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true); 
	     
	    //设置收件人，寄件人 
	    messageHelper.setTo(mail_to); 
	    messageHelper.setFrom(mail_from); 
	    String mail_title = "NoPrinter在北理工有实体店啦！！职消超市2楼C6！！";
	    messageHelper.setSubject(mail_title); 
	    //true 表示启动HTML格式的邮件 
	    String text = makeContent();
	    messageHelper.setText(text,true); 
	            
//	    FileSystemResource img = new FileSystemResource(new File("c:/aaa.jpg")); 
//	     
//	    messageHelper.addInline("aaa",img); 
	     
	    //发送邮件 
	    senderImpl.send(mailMessage); 
	     
	    System.out.println("邮件发送成功....."); 
	}
	public static void main(String[] args) throws Exception{ 
		SendMail sm =new SendMail("126");
		sm.mail_to="sonyfe25cp@gmail.com";
		sm.run();
	} 
	public static String makeContent() throws Exception{
		BufferedReader br = new BufferedReader(new FileReader(new File("/home/coder/git/dlde-parent/dlde-commons/src/test/resources/market.html")));
		String line = br.readLine();
		String str ="";
		while(line!=null){
			str += line;
			line = br.readLine();
		}
		br.close();
		return str;
	}

	
}
