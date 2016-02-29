package com.strata3test.mvc;

import com.strata3test.service.MailService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

/**
 * Created by piotr on 29/02/16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")

public class MailControllerTests {
    private MockMvc mockMvc;


    @Configuration
    static class Config {
        @Bean
        @Primary
        public MailService mailServiceMock() {
            return Mockito.mock(MailService.class);
        }
    }


    @Autowired
    protected WebApplicationContext wac;


    @Before
    public void setup() {

        MockitoAnnotations.initMocks(this);
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @Test
    public void testMailForm() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("index"));
    }
    @Test
    public void testSendEmail_success() throws Exception {



        mockMvc.perform(post("/mail")
                .param("sender", "sender@sender.com")
                .param("recipient","recipient@sender.com")
                .param("subject", "subject")
                .param("body", "body")
                    )
                .andExpect(status().isOk())
                .andExpect(view().name("mailOk"));
    }

    @Test
    public void testSendEmail_failure() throws Exception {

        mockMvc.perform(post("/mail")
                               )
                .andExpect(status().isOk())
                .andExpect(view().name("mailForm"));
    }

}