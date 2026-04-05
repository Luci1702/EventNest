package com.eventvenue.repository;

import com.eventvenue.model.Review;
import com.eventvenue.model.Venue;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByVenue(Venue venue);
}
