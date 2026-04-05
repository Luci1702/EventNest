<%@ include file="common/header.jsp" %>
<style>
    /* Base Animation Classes */
    .reveal {
        opacity: 0;
        transition: all 1s ease-out;
    }
    
    .reveal.active {
        opacity: 1;
        transform: translate(0, 0) scale(1) !important;
    }

    .reveal-up { transform: translateY(40px); }
    .reveal-left { transform: translateX(-50px); }
    .reveal-right { transform: translateX(50px); }
    .reveal-zoom { transform: scale(0.9); }

    /* Custom Delays */
    .delay-100 { transition-delay: 0.1s; }
    .delay-200 { transition-delay: 0.2s; }
    .delay-300 { transition-delay: 0.3s; }
    .delay-400 { transition-delay: 0.4s; }
    .delay-500 { transition-delay: 0.5s; }

    /* UI Enhancements */
    .hover-lift {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .hover-lift:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important;
    }
    
    .hero-img-wrap {
        overflow: hidden;
        border-radius: 1rem;
    }
    .hero-img-wrap img {
        transition: transform 0.5s ease;
    }
    .hero-img-wrap:hover img {
        transform: scale(1.05);
    }
    
    .gradient-text {
        background: linear-gradient(45deg, #0d6efd, #0dcaf0);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    
    .feature-card {
        padding: 2rem;
        border-radius: 1rem;
        background: #fff;
        border: 1px solid rgba(0,0,0,0.05);
        transition: all 0.3s ease;
    }
    .feature-card:hover {
        border-color: rgba(13,110,253,0.2);
        box-shadow: 0 10px 20px rgba(13,110,253,0.1);
    }

    /* Floating Animation for Hero */
    @keyframes float {
        0% { transform: translateY(0px); }
        50% { transform: translateY(-15px); }
        100% { transform: translateY(0px); }
    }
    .float-anim {
        animation: float 5s ease-in-out infinite;
    }
</style>

<!-- Hero Section (Page Load Animation) -->
<div class="row align-items-center py-5">
    <div class="col-md-6 text-center text-md-start mb-4 reveal reveal-up active">
        <h1 class="display-3 fw-bold lh-1 mb-3"><span class="gradient-text">Find the Perfect</span> Venue for Your Event</h1>
        <p class="lead text-secondary mb-4">Book beautiful spaces for weddings, parties, corporate meetings, and more. Simple, fast, and secure.</p>
        <div class="d-grid gap-3 d-md-flex justify-content-md-start">
            <a href="/venue/list" class="btn btn-primary btn-lg px-5 py-3 shadow hover-lift rounded-pill">Browse Venues</a>
            <sec:authorize access="!isAuthenticated()">
                <a href="/auth/register" class="btn btn-outline-secondary btn-lg px-5 py-3 hover-lift rounded-pill">Get Started</a>
            </sec:authorize>
        </div>
    </div>
    <div class="col-md-6 reveal reveal-zoom active delay-200">
        <div class="hero-img-wrap shadow-lg float-anim">
            <img src="https://images.unsplash.com/photo-1519167758481-83f550bb49b3?auto=format&fit=crop&w=800&q=80" class="d-block mx-lg-auto img-fluid" alt="Event Venue" width="700" height="500" loading="lazy">
        </div>
    </div>
</div>

<hr class="my-5 opacity-25">

<!-- Features Section -->
<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
    <div class="col text-center reveal reveal-up">
        <div class="feature-card h-100 hover-lift">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-4 px-4 py-3 rounded-circle shadow-sm">
                <i class="bi bi-geo-alt"></i>
            </div>
            <h3 class="fs-4 fw-bold">Easy Search</h3>
            <p class="text-muted">Filter venues by city, capacity, and price to find the one that fits your needs perfectly.</p>
        </div>
    </div>
    <div class="col text-center reveal reveal-up delay-100">
        <div class="feature-card h-100 hover-lift">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-success bg-gradient fs-2 mb-4 px-4 py-3 rounded-circle shadow-sm">
                <i class="bi bi-calendar-check"></i>
            </div>
            <h3 class="fs-4 fw-bold">Instant Booking</h3>
            <p class="text-muted">Real-time availability checking and instant reservation with secure payment processing.</p>
        </div>
    </div>
    <div class="col text-center reveal reveal-up delay-200">
        <div class="feature-card h-100 hover-lift">
            <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-warning bg-gradient fs-2 mb-4 px-4 py-3 rounded-circle shadow-sm">
                <i class="bi bi-star"></i>
            </div>
            <h3 class="fs-4 fw-bold">Trusted Reviews</h3>
            <p class="text-muted">Read honest feedback from other users to help you make the best choice for your special day.</p>
        </div>
    </div>
</div>

<hr class="my-5 opacity-25">

<!-- About Us Section (Zoom In Animations) -->
<div class="row g-4 py-5" id="about-us">
    <div class="col-12 text-center reveal reveal-up">
        <h2 class="display-5 fw-bold mb-4">Meet The Team</h2>
        <p class="lead text-muted mb-5">The passionate team behind EventNest, dedicated to simplifying your event planning experience.</p>
    </div>
    <div class="col text-center reveal reveal-zoom delay-100">
        <img src="https://ui-avatars.com/api/?name=Pravin&background=0D8ABC&color=fff" class="rounded-circle mb-3 shadow hover-lift" width="110" height="110" alt="Pravin">
        <h5 class="fw-bold">Pravin</h5>
        <p class="small text-primary fw-medium">Full-Stack Lead</p>
    </div>
    <div class="col text-center reveal reveal-zoom delay-200">
        <img src="https://ui-avatars.com/api/?name=Mayuri&background=198754&color=fff" class="rounded-circle mb-3 shadow hover-lift" width="110" height="110" alt="Mayuri">
        <h5 class="fw-bold">Mayuri</h5>
        <p class="small text-success fw-medium">UI/UX Specialist</p>
    </div>
    <div class="col text-center reveal reveal-zoom delay-300">
        <img src="https://ui-avatars.com/api/?name=Swati&background=ffc107&color=000" class="rounded-circle mb-3 shadow hover-lift" width="110" height="110" alt="Swati">
        <h5 class="fw-bold">Swati</h5>
        <p class="small text-warning fw-medium">Backend Developer</p>
    </div>
    <div class="col text-center reveal reveal-zoom delay-400">
        <img src="https://ui-avatars.com/api/?name=Pradnya&background=dc3545&color=fff" class="rounded-circle mb-3 shadow hover-lift" width="110" height="110" alt="Pradnya">
        <h5 class="fw-bold">Pradnya</h5>
        <p class="small text-danger fw-medium">Database Architect</p>
    </div>
    <div class="col text-center reveal reveal-zoom delay-500">
        <img src="https://ui-avatars.com/api/?name=Mayuri&background=6f42c1&color=fff" class="rounded-circle mb-3 shadow hover-lift" width="110" height="110" alt="Mayuri">
        <h5 class="fw-bold">Mayuri</h5>
        <p class="small text-info fw-medium">QA Engineer</p>
    </div>
</div>

<hr class="my-5 opacity-25">

<!-- Contact & Address (Slide In Animations) -->
<div class="row g-5 py-5 mb-5 overflow-hidden">
    <!-- Contact Us Section (Slides from Left) -->
    <div class="col-md-6 reveal reveal-left" id="contact-us">
        <div class="bg-white p-5 rounded-4 shadow-sm border">
            <h2 class="fw-bold mb-4">Contact Us</h2>
            <form>
                <div class="mb-3">
                    <label for="name" class="form-label fw-medium">Full Name</label>
                    <input type="text" class="form-control form-control-lg bg-light border-0" id="name" placeholder="Your Name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label fw-medium">Email Address</label>
                    <input type="email" class="form-control form-control-lg bg-light border-0" id="email" placeholder="name@example.com" required>
                </div>
                <div class="mb-4">
                    <label for="message" class="form-label fw-medium">Message</label>
                    <textarea class="form-control form-control-lg bg-light border-0" id="message" rows="4" placeholder="How can we help you?" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-lg w-100 shadow hover-lift rounded-pill">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Address Section (Slides from Right) -->
    <div class="col-md-6 reveal reveal-right" id="address">
        <div class="bg-primary bg-gradient text-white p-5 rounded-4 shadow h-100 hover-lift">
            <h2 class="fw-bold mb-4">Find Us</h2>
            <div class="d-flex align-items-center mb-4">
                <div class="bg-white text-primary rounded-circle p-3 me-3 shadow-sm">
                    <i class="bi bi-geo-alt-fill fs-4"></i>
                </div>
                <div>
                    <h5 class="mb-1 fw-bold text-white">Pune Office</h5>
                    <p class="mb-0 text-white-50">EventNest HQ</p>
                </div>
            </div>
            
            <p class="fs-5 mb-5 opacity-75 text-white">
                Plot No. 12, Tukaram nagar,<br>
                Talegaon Dabhade, Pune,<br>
                Maharashtra - 410506,<br>
                India
            </p>
            
            <div class="d-flex align-items-center mb-3">
                <i class="bi bi-telephone-fill fs-5 me-3 opacity-75"></i>
                <span class="fs-5 text-white">+91 20 1234 5678</span>
            </div>
            <div class="d-flex align-items-center">
                <i class="bi bi-envelope-fill fs-5 me-3 opacity-75"></i>
                <span class="fs-5 text-white">info@eventnest.com</span>
            </div>
        </div>
    </div>
</div>

<!-- Scroll Reveal Script -->
<script>
    function reveal() {
        var reveals = document.querySelectorAll(".reveal");
        for (var i = 0; i < reveals.length; i++) {
            var windowHeight = window.innerHeight;
            var elementTop = reveals[i].getBoundingClientRect().top;
            var elementVisible = 150;
            if (elementTop < windowHeight - elementVisible) {
                reveals[i].classList.add("active");
            }
        }
    }
    window.addEventListener("scroll", reveal);
    // Trigger once on load in case elements are already in view
    document.addEventListener("DOMContentLoaded", reveal);
</script>

<%@ include file="common/footer.jsp" %>
