package com.strata3test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.mail.MailSender;

/**
 * Created by piotr on 28/02/16.
 */

@Service
public class MailServiceImpl implements  MailService {

    @Autowired
    private MailSender mailSender;

    @Async
    public String sendEmail(MailDTO mailDTO) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(mailDTO.getRecipient());
            message.setSubject(mailDTO.getSubject());
            message.setText(mailDTO.getBody());
            mailSender.send(message);
        return "OK";
    }
}
