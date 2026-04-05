package com.eventvenue.service;

import com.eventvenue.model.Venue;
import com.eventvenue.repository.VenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VenueService {
    @Autowired
    private VenueRepository venueRepository;

    public List<Venue> getAllVenues() {
        return venueRepository.findAll();
    }

    public Optional<Venue> getVenueById(Long id) {
        return venueRepository.findById(id);
    }

    public List<Venue> searchByCity(String city) {
        return venueRepository.findByCityContainingIgnoreCase(city);
    }

    public List<Venue> searchByName(String name) {
        return venueRepository.findByNameContainingIgnoreCase(name);
    }

    public Venue saveVenue(Venue venue) {
        return venueRepository.save(venue);
    }

    public void deleteVenue(Long id) {
        venueRepository.deleteById(id);
    }
}
