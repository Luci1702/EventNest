package com.eventvenue.service;

import com.eventvenue.model.Booking;
import com.eventvenue.model.Payment;
import com.eventvenue.repository.BookingRepository;
import com.eventvenue.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class PaymentService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    public Payment processPayment(Booking booking, String method) {
        Payment payment = new Payment();
        payment.setBooking(booking);
        payment.setAmount(booking.getTotalAmount());
        payment.setPaymentMethod(method);
        payment.setTransactionId(UUID.randomUUID().toString());
        payment.setPaymentStatus("SUCCESS");
        
        paymentRepository.save(payment);
        
        booking.setStatus("CONFIRMED");
        bookingRepository.save(booking);
        
        return payment;
    }
}
