package com.synex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.synex.domain.EmailDetails;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;

@Service
public class EmailServiceImp implements EmailService {
	
	@Autowired JavaMailSender javaMailSender;
	
	@Value("${spring.mail.username}") String sender;

	@Override
	public String sendSimpleMail(EmailDetails details) {
		try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			
			mailMessage.setFrom(sender);
			mailMessage.setTo(details.getRecipient());
			mailMessage.setText(details.getMsgBody());
			mailMessage.setSubject(details.getSubject());
			
			javaMailSender.send(mailMessage);
			return "Mail sent Successfully...";
		} catch (Exception e) {
			return "Error while sending mail";			
		}
	}

	@Override
	public String sendMailWithAttachment(EmailDetails details) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper;
		
		try {
			mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setFrom(sender);
			mimeMessageHelper.setTo(details.getRecipient());
			mimeMessageHelper.setText(details.getMsgBody());
			mimeMessageHelper.setSubject(details.getSubject());
			
			MimeBodyPart attachmentPart = new MimeBodyPart();
			attachmentPart.setContent(details.getAttachment(), "application/pdf");
			attachmentPart.setFileName("invoice.pdf");
			
			MimeBodyPart textPart = new MimeBodyPart();
			textPart.setContent(details.getMsgBody(), "text/html;charset=UTF-8");
			
			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(textPart);
			multipart.addBodyPart(attachmentPart);
			
			//FileSystemResource file = new FileSystemResource(new File(details.getAttachment()));
			
			//mimeMessageHelper.addAttachment(file.getFilename(), file);
			
			mimeMessage.setContent(multipart);
			javaMailSender.send(mimeMessage);
			return "Mail with attachment sent successfully...";
			
		} catch(MessagingException e) {
			return "Error while sending mail with attachment";
		}
	}

}
