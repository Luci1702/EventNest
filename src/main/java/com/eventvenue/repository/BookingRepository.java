package com.eventvenue.repository;

import com.eventvenue.model.Booking;
import com.eventvenue.model.User;
import com.eventvenue.model.Venue;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    List<Booking> findByUser(User user);
    List<Booking> findByVenue(Venue venue);
    List<Booking> findByStatus(String status);
}
