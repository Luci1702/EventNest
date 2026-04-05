package com.eventvenue.controller;

import com.eventvenue.model.Booking;
import com.eventvenue.model.User;
import com.eventvenue.model.Venue;
import com.eventvenue.service.BookingService;
import com.eventvenue.service.UserService;
import com.eventvenue.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/booking")
public class BookingController {
    @Autowired
    private BookingService bookingService;

    @Autowired
    private VenueService venueService;

    @Autowired
    private UserService userService;

    @GetMapping("/book/{venueId}")
    public String book(@PathVariable Long venueId, Model model) {
        Optional<Venue> venue = venueService.getVenueById(venueId);
        if (venue.isPresent()) {
            model.addAttribute("venue", venue.get());
            model.addAttribute("booking", new Booking());
            return "booking/book";
        }
        return "redirect:/venue/list";
    }

    @PostMapping("/book")
    public String bookProcess(@ModelAttribute("booking") Booking booking, @RequestParam Long venueId, Authentication auth) {
        Optional<Venue> venue = venueService.getVenueById(venueId);
        Optional<User> user = userService.findByUsername(auth.getName());
        
        if (venue.isPresent() && user.isPresent()) {
            booking.setVenue(venue.get());
            booking.setUser(user.get());
            Booking savedBooking = bookingService.createBooking(booking);
            return "redirect:/payment/" + savedBooking.getId();
        }
        return "redirect:/venue/list";
    }

    @GetMapping("/my-bookings")
    public String myBookings(Authentication auth, Model model) {
        Optional<User> user = userService.findByUsername(auth.getName());
        if (user.isPresent()) {
            model.addAttribute("bookings", bookingService.getBookingsByUser(user.get()));
            return "booking/my-bookings";
        }
        return "redirect:/auth/login";
    }

    @GetMapping("/confirmation/{id}")
    public String confirmation(@PathVariable Long id, Model model) {
        Optional<Booking> booking = bookingService.getBookingById(id);
        if (booking.isPresent()) {
            model.addAttribute("booking", booking.get());
            return "booking/confirmation";
        }
        return "redirect:/booking/my-bookings";
    }
}
