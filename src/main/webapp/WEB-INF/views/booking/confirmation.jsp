<%@ include file="../common/header.jsp" %>
<div class="row justify-content-center">
    <div class="col-md-8 text-center py-5 shadow rounded bg-light mt-5">
        <h1 class="display-4 text-success">Booking Confirmed!</h1>
        <p class="lead">Thank you, your venue reservation has been successfully confirmed.</p>
        <hr>
        <div class="row text-start px-5 mt-4">
            <div class="col-md-6 mb-3">
                <p><strong>Booking ID:</strong> #${booking.id}</p>
                <p><strong>Venue:</strong> ${booking.venue.name}</p>
                <p><strong>Location:</strong> ${booking.venue.city}</p>
                <p><strong>Total Paid:</strong> INR ${booking.totalAmount}</p>
            </div>
            <div class="col-md-6 mb-3">
                <p><strong>Start Time:</strong> ${booking.bookingStartTime}</p>
                <p><strong>End Time:</strong> ${booking.bookingEndTime}</p>
                <p><strong>Status:</strong> <span class="badge bg-success">${booking.status}</span></p>
                <p><strong>Transaction ID:</strong> ${booking.payment != null ? booking.payment.transactionId : 'N/A'}</p>
            </div>
        </div>
        <div class="mt-4">
            <a href="/booking/my-bookings" class="btn btn-primary me-2">Go to My Bookings</a>
            <a href="/" class="btn btn-outline-secondary">Return Home</a>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
