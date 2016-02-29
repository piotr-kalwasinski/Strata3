package com.strata3test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by piotr on 28/02/16.
 */
@Controller
@RequestMapping("/")
public class StartController {

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return "index";
    }
}
