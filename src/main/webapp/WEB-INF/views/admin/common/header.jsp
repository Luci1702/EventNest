<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - EventNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            overflow-x: hidden;
            background-color: #f8f9fa;
        }
        #sidebar {
            min-height: 100vh;
            width: 250px;
            background: #212529;
            color: #fff;
            transition: all 0.3s;
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1000;
        }
        #sidebar .sidebar-header {
            padding: 20px;
            background: #1a1e21;
        }
        #sidebar ul.components {
            padding: 20px 0;
        }
        #sidebar ul li a {
            padding: 12px 20px;
            font-size: 1.1em;
            display: block;
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: 0.3s;
        }
        #sidebar ul li a:hover, #sidebar ul li a.active {
            color: #fff;
            background: rgba(255, 255, 255, 0.1);
            border-left: 4px solid #0d6efd;
        }
        #sidebar ul li a i {
            margin-right: 10px;
        }
        #content {
            width: calc(100% - 250px);
            margin-left: 250px;
            transition: all 0.3s;
            padding: 20px;
        }
        @media (max-width: 768px) {
            #sidebar {
                margin-left: -250px;
            }
            #sidebar.active {
                margin-left: 0;
            }
            #content {
                width: 100%;
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

<div class="d-flex">
    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3 class="fw-bold text-primary mb-0">EventNest</h3>
            <small class="text-muted">Admin Control Center</small>
        </div>

        <ul class="list-unstyled components">
            <li>
                <a href="/admin/dashboard" class="${pageContext.request.requestURI.contains('dashboard') ? 'active' : ''}">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="/admin/venues" class="${pageContext.request.requestURI.contains('venues') ? 'active' : ''}">
                    <i class="bi bi-building"></i> Manage Venues
                </a>
            </li>
            <li>
                <a href="/admin/bookings" class="${pageContext.request.requestURI.contains('bookings') ? 'active' : ''}">
                    <i class="bi bi-calendar-check"></i> Manage Bookings
                </a>
            </li>
            <li>
                <a href="/venue/add">
                    <i class="bi bi-plus-square"></i> Add New Venue
                </a>
            </li>
            <hr class="mx-3 bg-secondary">
            <li>
                <a href="/">
                    <i class="bi bi-house"></i> View Website
                </a>
            </li>
            <li>
                <form action="/logout" method="post" id="logoutForm" class="d-none">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
                <a href="javascript:void(0)" onclick="document.getElementById('logoutForm').submit()">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main id="content">
