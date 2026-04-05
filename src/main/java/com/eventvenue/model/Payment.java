package com.eventvenue.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import java.time.LocalDateTime;
import java.math.BigDecimal;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "payments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "booking_id", nullable = false)
    private Booking booking;

    @Column(nullable = false)
    private String transactionId;

    @Column(nullable = false)
    private BigDecimal amount;

    @Column(nullable = false)
    private String paymentStatus; // SUCCESS, FAILED, PENDING

    @Column(nullable = false)
    private String paymentMethod; // CREDIT_CARD, DEBIT_CARD, PAYPAL, UPI

    @CreationTimestamp
    private LocalDateTime paymentDate;

    // Fallback getters/setters
    public void setBooking(Booking booking) { this.booking = booking; }
    public Booking getBooking() { return booking; }
    public void setAmount(java.math.BigDecimal amount) { this.amount = amount; }
    public java.math.BigDecimal getAmount() { return amount; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }
    public String getTransactionId() { return transactionId; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
    public String getPaymentStatus() { return paymentStatus; }
}
