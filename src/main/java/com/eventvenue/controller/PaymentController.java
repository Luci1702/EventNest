package com.eventvenue.controller;

import com.eventvenue.model.Booking;
import com.eventvenue.service.BookingService;
import com.eventvenue.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/payment")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookingService bookingService;

    @GetMapping("/{bookingId}")
    public String checkout(@PathVariable Long bookingId, Model model) {
        Optional<Booking> booking = bookingService.getBookingById(bookingId);
        if (booking.isPresent()) {
            model.addAttribute("booking", booking.get());
            return "payment/checkout";
        }
        return "redirect:/booking/my-bookings";
    }

    @PostMapping("/process")
    public String process(@RequestParam Long bookingId, @RequestParam String method) {
        Optional<Booking> booking = bookingService.getBookingById(bookingId);
        if (booking.isPresent()) {
            paymentService.processPayment(booking.get(), method);
            return "redirect:/booking/confirmation/" + bookingId;
        }
        return "redirect:/booking/my-bookings";
    }
}
