package com.strata3test;

import com.strata3test.form.MailForm;
import com.strata3test.service.MailDTO;
import com.strata3test.service.MailService;
import com.strata3test.service.MailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

/**
 * Created by piotr on 28/02/16.
 */

@Controller
@RequestMapping("/mail")
public class MailController {

    @Autowired
    MailService mailService;

    @RequestMapping( method = RequestMethod.POST)
    public String sendEmail(@ModelAttribute("email") @Valid MailForm mailForm,
                            BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "mailForm";
        }

        mailService.sendEmail(toMailDTO(mailForm));
        return "mailOk";
    }
    @RequestMapping(method = RequestMethod.GET)
    public String newEmail(ModelMap model) {
            model.addAttribute("email", new MailForm());
        return "mailForm";
    }

    private static MailDTO toMailDTO(MailForm mailForm) {
        MailDTO mailDTO = new MailDTO();
        mailDTO.setBody(mailForm.getBody());
        mailDTO.setRecipient(mailForm.getRecipient());
        mailDTO.setSender(mailForm.getSender());
        mailDTO.setSubject(mailForm.getSubject());
        return mailDTO;
    }
}
