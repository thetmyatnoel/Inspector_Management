package com.example.inspectormanagement.controller;

import com.example.inspectormanagement.entity.User;
import com.example.inspectormanagement.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/index")
    public String index(Model model, @AuthenticationPrincipal User user) {
        String username = user.getName();
        model.addAttribute("username", username);
        return "index";

    }

    @GetMapping("/inspector")
    public String inspector(Model model, @AuthenticationPrincipal User user) {
        String username = user.getName();
        model.addAttribute("username", username);
        return "inspector";
    }
    @GetMapping("/inspectregister")
    public String inspectregister(Model model, @AuthenticationPrincipal User user) {
        String username = user.getName();
        model.addAttribute("username", username);
        return "inspectregister";
    }

    @GetMapping("/inspectorregister")
    public String inspectorregister(Model model, @AuthenticationPrincipal User user) {
        String username = user.getName();
        model.addAttribute("username", username);
        return "inspectorregister";
    }
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @GetMapping("/success-page")
    public String successPage()
    {
        return "success-page";
    }

    @PostMapping("/registers")
    public String registerUser(@ModelAttribute User newUser, Model model) {
        // Logic to handle registration
        if (userRepository.findByName(newUser.getName()).isPresent()) {
            model.addAttribute("errorMessage", "Name already in use");
            return "register"; // redirect back to the registration page or an error page
        }
        if (userRepository.findByEmail(newUser.getEmail()) != null) {
            model.addAttribute("errorMessage", "Email already in use");
            return "register"; // redirect back to the registration page or an error page
        }
        if (userRepository.findByPhone(newUser.getPhone()).isPresent()) {
            model.addAttribute("errorMessage", "Phone number already in use");
            return "register"; // or another error page
        }

        newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
        userRepository.save(newUser);

        return "redirect:/success-page"; // redirect to the success page
    }



}

