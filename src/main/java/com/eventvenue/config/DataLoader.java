package com.eventvenue.config;

import com.eventvenue.model.User;
import com.eventvenue.model.Venue;
import com.eventvenue.repository.UserRepository;
import com.eventvenue.repository.VenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;
import java.util.Arrays;

@Configuration
public class DataLoader implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private VenueRepository venueRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        if (userRepository.count() == 0) {
            // Create Admin
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@eventnest.com");
            admin.setPassword(passwordEncoder.encode("admin123"));
            admin.setRole("ROLE_ADMIN");
            admin.setFullName("System Admin");
            userRepository.save(admin);

            // Create User
            User user = new User();
            user.setUsername("user");
            user.setEmail("user@example.com");
            user.setPassword(passwordEncoder.encode("user123"));
            user.setRole("ROLE_USER");
            user.setFullName("John Doe");
            userRepository.save(user);
        }

        if (venueRepository.count() == 0) {
            Venue v1 = new Venue();
            v1.setName("Grand Ballroom");
            v1.setAddress("123 Luxury Ave");
            v1.setCity("New York");
            v1.setDescription("A magnificent ballroom for grand celebrations.");
            v1.setCapacity(500);
            v1.setPricePerHour(new BigDecimal("20000.00"));
            v1.setImageUrl("https://images.unsplash.com/photo-1519167758481-83f550bb49b3?auto=format&fit=crop&w=800&q=80");

            Venue v2 = new Venue();
            v2.setName("Sunset Rooftop");
            v2.setAddress("456 Skyline Rd");
            v2.setCity("Los Angeles");
            v2.setDescription("Beautiful rooftop with a view of the sunset.");
            v2.setCapacity(100);
            v2.setPricePerHour(new BigDecimal("12000.00"));
            v2.setImageUrl("https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?auto=format&fit=crop&w=800&q=80");

            Venue v3 = new Venue();
            v3.setName("Green Garden");
            v3.setAddress("789 Nature Way");
            v3.setCity("Chicago");
            v3.setDescription("Lush green garden for outdoor events.");
            v3.setCapacity(200);
            v3.setPricePerHour(new BigDecimal("8000.00"));
            v3.setImageUrl("https://images.unsplash.com/photo-1469334031218-e382a71b716b?auto=format&fit=crop&w=800&q=80");

            venueRepository.saveAll(Arrays.asList(v1, v2, v3));
        }
    }
}
