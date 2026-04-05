<%@ include file="../common/header.jsp" %>
<div class="row justify-content-center">
    <div class="col-md-6">
        <h2 class="text-center">Book Venue: ${venue.name}</h2>
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <p>Location: ${venue.city}</p>
                <p>Price: INR ${venue.pricePerHour} per hour</p>
                <p>Capacity: ${venue.capacity} guests</p>
            </div>
        </div>
        <form action="/booking/book" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="venueId" value="${venue.id}" />
            <div class="mb-3">
                <label for="bookingStartTime" class="form-label">Start Date & Time</label>
                <input type="datetime-local" class="form-control" id="bookingStartTime" name="bookingStartTime" required>
            </div>
            <div class="mb-3">
                <label for="bookingEndTime" class="form-label">End Date & Time</label>
                <input type="datetime-local" class="form-control" id="bookingEndTime" name="bookingEndTime" required>
            </div>
            <div class="mb-3">
                <label for="totalAmount" class="form-label">Total Amount (INR)</label>
                <input type="number" step="0.01" class="form-control" id="totalAmount" name="totalAmount" required readonly value="${venue.pricePerHour * 2}">
                <small class="text-muted">Calculated based on duration (Sample calculation: 2 hrs)</small>
            </div>
            <button type="submit" class="btn btn-success w-100 btn-lg">Reserve Now</button>
        </form>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
