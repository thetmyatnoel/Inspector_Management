package com.example.inspectormanagement.controller;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/inspector")
    public String inspector(Model model) {
        return "inspector";
    }
    @GetMapping("/inspectregister")
    public String inspectregister(Model model) {
        return "inspectregister";
    }

    @GetMapping("/inspectorregister")
    public String inspectorregister(Model model) {
        return "inspectorregister";
    }

}

