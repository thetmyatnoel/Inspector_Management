package com.example.inspectormanagement.controller;

import com.example.inspectormanagement.entity.PasswordResetToken;
import com.example.inspectormanagement.entity.User;
import com.example.inspectormanagement.repository.UserRepository;
import com.example.inspectormanagement.service.EmailService;
import com.example.inspectormanagement.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@CrossOrigin(origins = "*")
@Controller
public class PageController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserService userService;
    @Autowired
    private EmailService emailService;

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
        if (userRepository.findByEmail(newUser.getEmail()).isPresent()) {
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

    @GetMapping("/reset-password")
    public String resetPassword()
    {
        return "reset-password";
    }
    @GetMapping("/updatePW")
    public String updatePW(@RequestParam(value = "token", required = false) String token, Model model) {
        if (token == null) {
            model.addAttribute("error", "Token is required for password reset.");
            return "errorPage"; // Redirect to an error page or similar
        }
        model.addAttribute("token", token);
        return "updatePW"; // Ensure this is the correct name of the template without extra characters
    }

    @PostMapping("/reset-passwords")
    public String resetPassword(@RequestParam("email") String email, Model model) {


        // Check if the user exists by email
        User user = userService.findUserByEmail(email);
        if (user != null) {
            // Generate a reset token
            String token = userService.createPasswordResetToken(user);

            // Send the reset email
            emailService.sendPasswordResetEmail(user.getEmail(), token);

            // Set view to show success message
            model.addAttribute("message", "If your email is registered with us, you will receive a reset link shortly.");
        } else {
            // Set view to show error message
            model.addAttribute("error", "No user associated with this email address.");
        }

        return "reset-password";
    }

    @PostMapping("/update-password")
    public String updatePassword(@RequestParam String token, @RequestParam String newPassword, @RequestParam String confirmPassword, Model model, RedirectAttributes redirectAttributes) {


        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("pwerror", "Passwords do not match.");
            return "updatePW";
        }

        PasswordResetToken prt = userService.validatePasswordResetToken(token);
        if (prt == null) {
            redirectAttributes.addFlashAttribute("error", "Invalid or expired token.");
            return "redirect:/reset-password";
        }

        userService.updatePassword(prt.getUser(), newPassword);
        redirectAttributes.addFlashAttribute("message", "Your password has been updated successfully.");
        return "redirect:/login";
    }

}

