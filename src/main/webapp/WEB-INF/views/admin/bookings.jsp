<%@ include file="common/header.jsp" %>
<div class="py-2">
    <div class="row mb-4 align-items-center bg-white shadow-sm p-3 rounded mx-0 border-start border-success border-4">
        <div class="col-md-8">
            <h2 class="fw-bold text-success mb-0"><i class="bi bi-calendar-check me-2"></i>Booking Management</h2>
            <p class="text-muted mb-0 small">Total system reservations: ${bookings.size()}</p>
        </div>
        <div class="col-md-4 text-end">
            <button class="btn btn-outline-secondary btn-sm rounded-pill px-3" onclick="window.print()">
                <i class="bi bi-printer me-1"></i>Print Report
            </button>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-3">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light text-dark fw-bold border-bottom">
                        <tr>
                            <th class="ps-4 py-3">ID</th>
                            <th>User Details</th>
                            <th>Venue Info</th>
                            <th>Timing</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="booking" items="${bookings}">
                            <tr class="border-bottom">
                                <td class="ps-4 fw-bold text-muted">#${booking.id}</td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="fw-bold text-dark text-capitalize">${booking.user.username}</span>
                                        <small class="text-muted">${booking.user.email}</small>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="fw-bold">${booking.venue.name}</span>
                                        <small class="text-muted"><i class="bi bi-geo-alt text-danger me-1 small"></i>${booking.venue.city}</small>
                                    </div>
                                </td>
                                <td class="small">
                                    <div class="mb-1 text-primary"><i class="bi bi-calendar-plus me-1"></i>${booking.bookingStartTime}</div>
                                    <div class="text-danger"><i class="bi bi-calendar-minus me-1"></i>${booking.bookingEndTime}</div>
                                </td>
                                <td class="fw-bold text-success fs-5">INR ${booking.totalAmount}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${booking.status == 'CONFIRMED'}">
                                            <span class="badge bg-success bg-opacity-10 text-success py-2 px-3 rounded-pill"><i class="bi bi-check-circle-fill me-1"></i>${booking.status}</span>
                                        </c:when>
                                        <c:when test="${booking.status == 'PENDING'}">
                                            <span class="badge bg-warning bg-opacity-10 text-warning-emphasis py-2 px-3 rounded-pill"><i class="bi bi-clock-fill me-1"></i>${booking.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary bg-opacity-10 text-secondary py-2 px-3 rounded-pill">${booking.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <button class="btn btn-sm btn-outline-danger px-3 shadow-sm" onclick="return confirm('Cancel this booking?')">
                                        <i class="bi bi-x-circle me-1"></i>Cancel
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty bookings}">
                            <tr>
                                <td colspan="7" class="text-center py-5 text-muted">
                                    <i class="bi bi-calendar-x fs-1 d-block mb-3 opacity-25"></i>
                                    No reservations recorded yet.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="common/footer.jsp" %>
