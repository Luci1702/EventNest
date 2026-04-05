<%@ include file="common/header.jsp" %>
<div class="py-2">
    <div class="row mb-4">
        <div class="col">
            <h1 class="h2 border-bottom pb-2 fw-bold text-dark"><i class="bi bi-speedometer2 me-2"></i>Admin Dashboard</h1>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm bg-primary text-white h-100">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-calendar-check fs-1"></i>
                    </div>
                    <div class="flex-grow-1 ms-3 text-end">
                        <h6 class="text-uppercase mb-1 opacity-75">Total Bookings</h6>
                        <h2 class="display-6 fw-bold mb-0">${bookingCount}</h2>
                    </div>
                </div>
                <div class="card-footer bg-dark bg-opacity-10 border-0 text-end">
                    <a href="/admin/bookings" class="text-white text-decoration-none small">View Details <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm bg-success text-white h-100">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-building fs-1"></i>
                    </div>
                    <div class="flex-grow-1 ms-3 text-end">
                        <h6 class="text-uppercase mb-1 opacity-75">Active Venues</h6>
                        <h2 class="display-6 fw-bold mb-0">${venueCount}</h2>
                    </div>
                </div>
                <div class="card-footer bg-dark bg-opacity-10 border-0 text-end">
                    <a href="/admin/venues" class="text-white text-decoration-none small">Manage Venues <i class="bi bi-arrow-right-short"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm bg-warning text-white h-100">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-wallet2 fs-1"></i>
                    </div>
                    <div class="flex-grow-1 ms-3 text-end">
                        <h6 class="text-uppercase mb-1 opacity-75">Revenue (Monthly)</h6>
                        <h2 class="display-6 fw-bold mb-0">INR 45.5k</h2>
                    </div>
                </div>
                <div class="card-footer bg-dark bg-opacity-10 border-0 text-end">
                    <span class="text-white small">Growth: +12% <i class="bi bi-graph-up-arrow"></i></span>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm bg-danger text-white h-100">
                <div class="card-body d-flex align-items-center">
                    <div class="flex-shrink-0">
                        <i class="bi bi-people fs-1"></i>
                    </div>
                    <div class="flex-grow-1 ms-3 text-end">
                        <h6 class="text-uppercase mb-1 opacity-75">Total Users</h6>
                        <h2 class="display-6 fw-bold mb-0">128</h2>
                    </div>
                </div>
                <div class="card-footer bg-dark bg-opacity-10 border-0 text-end">
                    <span class="text-white small">Healthy <i class="bi bi-check-circle"></i></span>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-grid-3x3-gap me-2"></i>Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-sm-6 col-md-4">
                            <a href="/venue/add" class="btn btn-outline-primary w-100 py-3 shadow-sm border-2">
                                <i class="bi bi-plus-square fs-3 d-block mb-2"></i>
                                <span>Add Venue</span>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <a href="/admin/bookings" class="btn btn-outline-success w-100 py-3 shadow-sm border-2">
                                <i class="bi bi-journal-check fs-3 d-block mb-2"></i>
                                <span>Manage Bookings</span>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4">
                            <a href="/" class="btn btn-outline-info w-100 py-3 shadow-sm border-2">
                                <i class="bi bi-eye fs-3 d-block mb-2"></i>
                                <span>View Site</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-bell me-2"></i>Recent System Activity</h5>
                </div>
                <div class="card-body p-0">
                    <div class="list-group list-group-flush small">
                        <div class="list-group-item py-3">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1 fw-bold">Grand Ballroom</h6>
                                <small class="text-muted">3 mins ago</small>
                            </div>
                            <p class="mb-1 text-muted">New booking confirmed by user@example.com</p>
                        </div>
                        <div class="list-group-item py-3 border-0">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1 fw-bold">System Update</h6>
                                <small class="text-muted">2 hours ago</small>
                            </div>
                            <p class="mb-1 text-muted">Database successfully migrated to MySQL</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common/footer.jsp" %>
