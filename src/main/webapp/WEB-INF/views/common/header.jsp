<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventNest - Venue Booking</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        body { padding-top: 5rem; }
        .venue-card { margin-bottom: 2rem; }
        html { scroll-behavior: smooth; }
        .navbar { border-bottom: 1px solid rgba(255,255,255,0.1); }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="/">
            <i class="bi bi-house-door-fill me-2"></i>EventNest
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/venue/list">Venues</a></li>
                <li class="nav-item"><a class="nav-link" href="/#about-us">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="/#contact-us">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="/#address">Address</a></li>
                <sec:authorize access="hasRole('ADMIN')">
                    <li class="nav-item"><a class="nav-link" href="/admin/dashboard">Admin Dashboard</a></li>
                </sec:authorize>
            </ul>
            <ul class="navbar-nav ms-auto">
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/auth/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/auth/register">Register</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/booking/my-bookings">My Bookings</a></li>
                    <li class="nav-item">
                        <form action="/logout" method="post" id="navLogoutForm" class="d-none">
                            <sec:csrfInput />
                        </form>
                        <a class="nav-link" href="javascript:void(0)" onclick="document.getElementById('navLogoutForm').submit()">Logout</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
<main class="container">
