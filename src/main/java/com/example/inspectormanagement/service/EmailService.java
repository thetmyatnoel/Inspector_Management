package com.example.inspectormanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    /**
     * Sends a password reset email to the given email address.
     *
     * @param toEmail the recipient's email address
     * @param token the password reset token
     */
    public void sendPasswordResetEmail(String toEmail, String token) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("senderinquiry@gmail.com"); // Set the sender's email, ideally should be your domain-specific email if configured
        message.setTo(toEmail);
        message.setSubject("Password Reset Request");
        message.setText(createEmailContent(toEmail, token));

        mailSender.send(message);
    }

    /**
     * Creates the content of the email with a link to reset the password.
     *
     * @param toEmail the recipient's email address
     * @param token the reset token
     * @return the content of the email
     */
    private String createEmailContent(String toEmail, String token) {
        String url = "http://localhost:8084/updatePW?token=" + token; // Adjust the URL to your front-end or reset handler
        return "Hello,\n\nYou have requested to reset your password. Please click on the link below to reset your password:\n" + url + "\n\nIf you did not request a password reset, please ignore this email.\n\nThank you,\nInspector Management Team";
    }
}
