package com.eventvenue.controller;

import com.eventvenue.service.BookingService;
import com.eventvenue.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private BookingService bookingService;

    @Autowired
    private VenueService venueService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("bookingCount", bookingService.getAllBookings().size());
        model.addAttribute("venueCount", venueService.getAllVenues().size());
        return "admin/dashboard";
    }

    @GetMapping("/bookings")
    public String bookings(Model model) {
        model.addAttribute("bookings", bookingService.getAllBookings());
        return "admin/bookings";
    }

    @GetMapping("/venues")
    public String venues(Model model) {
        model.addAttribute("venues", venueService.getAllVenues());
        return "admin/venues";
    }
}
