package com.eventvenue.controller;

import com.eventvenue.model.Venue;
import com.eventvenue.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/venue")
public class VenueController {
    @Autowired
    private VenueService venueService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/list")
    public String list(Model model, @RequestParam(name = "city", required = false) String city) {
        List<Venue> venues;
        if (city != null && !city.isEmpty()) {
            venues = venueService.searchByCity(city);
        } else {
            venues = venueService.getAllVenues();
        }
        model.addAttribute("venues", venues);
        return "venue/list";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Optional<Venue> venue = venueService.getVenueById(id);
        if (venue.isPresent()) {
            model.addAttribute("venue", venue.get());
            return "venue/detail";
        }
        return "redirect:/venue/list";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("venue", new Venue());
        return "venue/add";
    }

    @PostMapping("/add")
    public String save(@ModelAttribute("venue") Venue venue) {
        venueService.saveVenue(venue);
        return "redirect:/admin/venues";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Optional<Venue> venue = venueService.getVenueById(id);
        if (venue.isPresent()) {
            model.addAttribute("venue", venue.get());
            return "venue/edit";
        }
        return "redirect:/admin/venues";
    }

    @PostMapping("/edit")
    public String update(@ModelAttribute("venue") Venue venue) {
        venueService.saveVenue(venue);
        return "redirect:/admin/venues";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        venueService.deleteVenue(id);
        return "redirect:/admin/venues";
    }
}
