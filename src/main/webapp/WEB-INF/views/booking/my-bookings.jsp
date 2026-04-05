<%@ include file="../common/header.jsp" %>
<h2 class="mb-4">My Bookings</h2>
<div class="row">
    <div class="col-md-12">
        <table class="table table-hover shadow-sm">
            <thead class="table-dark">
                <tr>
                    <th>Venue Name</th>
                    <th>City</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.venue.name}</td>
                        <td>${booking.venue.city}</td>
                        <td>${booking.bookingStartTime}</td>
                        <td>${booking.bookingEndTime}</td>
                        <td>INR ${booking.totalAmount}</td>
                        <td>
                            <span class="badge ${booking.status == 'CONFIRMED' ? 'bg-success' : 'bg-warning'}">${booking.status}</span>
                        </td>
                        <td>
                            <c:if test="${booking.status == 'PENDING'}">
                                <a href="/payment/${booking.id}" class="btn btn-sm btn-primary">Pay Now</a>
                            </c:if>
                            <c:if test="${booking.status == 'CONFIRMED'}">
                                <a href="/booking/confirmation/${booking.id}" class="btn btn-sm btn-info">View Confirmation</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty bookings}">
                    <tr>
                        <td colspan="7" class="text-center py-4">No bookings found. <a href="/venue/list">Browse venues</a> to start booking!</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
