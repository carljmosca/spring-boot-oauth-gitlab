package com.moscaville.springbootoauthgitlab;

import java.security.Principal;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index(Principal principal) {
        String name = "unknown";
        if (principal != null) {
            name = principal.getName();
        }

        return String.format("Greetings %s from Spring Boot!", name);
    }

}
