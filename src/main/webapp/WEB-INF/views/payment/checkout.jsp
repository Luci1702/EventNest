<%@ include file="../common/header.jsp" %>
<div class="row justify-content-center">
    <div class="col-md-6">
        <h2 class="text-center">Checkout</h2>
        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <h5 class="card-title">${booking.venue.name}</h5>
                <p class="card-text">
                    <strong>Date:</strong> ${booking.bookingStartTime.toLocalDate()}<br>
                    <strong>Total Amount:</strong> INR ${booking.totalAmount}
                </p>
            </div>
        </div>
        
        <form action="/payment/process" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="bookingId" value="${booking.id}" />
            
            <div class="mb-3">
                <label for="method" class="form-label">Select Payment Method</label>
                <select class="form-control" id="method" name="method" required>
                    <option value="">-- Choose --</option>
                    <option value="CREDIT_CARD">Credit Card</option>
                    <option value="DEBIT_CARD">Debit Card</option>
                    <option value="PAYPAL">PayPal</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>
            
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary btn-lg">Pay Now</button>
                <a href="/booking/my-bookings" class="btn btn-link">Cancel</a>
            </div>
        </form>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
