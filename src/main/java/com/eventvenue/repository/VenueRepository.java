package com.eventvenue.repository;

import com.eventvenue.model.Venue;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface VenueRepository extends JpaRepository<Venue, Long> {
    List<Venue> findByCityContainingIgnoreCase(String city);
    List<Venue> findByNameContainingIgnoreCase(String name);
}
