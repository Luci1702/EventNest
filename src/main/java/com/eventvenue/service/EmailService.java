package com.eventvenue.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired(required = false)
    private JavaMailSender mailSender;

    public void sendBookingConfirmation(String to, String bookingDetails) {
        if (mailSender != null) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject("Booking Confirmation - EventNest");
            message.setText("Congratulations! Your booking for " + bookingDetails + " has been confirmed.");
            mailSender.send(message);
        } else {
            System.out.println("Email sender not configured. Simulating email to: " + to);
            System.out.println("Subject: Booking Confirmation - EventNest");
            System.out.println("Message: Congratulations! Your booking for " + bookingDetails + " has been confirmed.");
        }
    }
}
