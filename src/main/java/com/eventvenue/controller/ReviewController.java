package com.eventvenue.controller;

import com.eventvenue.model.Review;
import com.eventvenue.model.User;
import com.eventvenue.model.Venue;
import com.eventvenue.repository.ReviewRepository;
import com.eventvenue.service.UserService;
import com.eventvenue.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private VenueService venueService;

    @Autowired
    private UserService userService;

    @PostMapping("/add")
    public String add(@RequestParam Long venueId, @RequestParam Integer rating, @RequestParam String comment, Authentication auth) {
        Optional<Venue> venue = venueService.getVenueById(venueId);
        Optional<User> user = userService.findByUsername(auth.getName());
        
        if (venue.isPresent() && user.isPresent()) {
            Review review = new Review();
            review.setVenue(venue.get());
            review.setUser(user.get());
            review.setRating(rating);
            review.setComment(comment);
            reviewRepository.save(review);
            return "redirect:/venue/detail/" + venueId;
        }
        return "redirect:/venue/list";
    }
}
