<%@ include file="../common/header.jsp" %>
<div class="row">
    <div class="col-md-8">
        <img src="${venue.imageUrl != null ? venue.imageUrl : 'https://via.placeholder.com/800x400?text=Venue'}" class="img-fluid rounded shadow mb-4" alt="${venue.name}">
        <h2 class="display-4">${venue.name}</h2>
        <p class="lead text-muted">${venue.city} | ${venue.address}</p>
        <hr>
        <h4>Description</h4>
        <p class="fs-5">${venue.description}</p>
        <hr>
        <h4>Reviews</h4>
        <c:forEach var="review" items="${venue.reviews}">
            <div class="card mb-2 shadow-sm">
                <div class="card-body py-2">
                    <p class="mb-1 text-warning">Rating: ${review.rating}/5</p>
                    <p class="mb-0 fs-6">${review.comment}</p>
                    <small class="text-muted">By: ${review.user.username} on ${review.createdAt}</small>
                </div>
            </div>
        </c:forEach>
        <c:if test="${empty venue.reviews}">
            <p>No reviews yet. Be the first to review!</p>
        </c:if>
        
        <sec:authorize access="isAuthenticated()">
            <h5 class="mt-4">Write a Review</h5>
            <form action="/review/add" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" name="venueId" value="${venue.id}" />
                <div class="mb-2">
                    <label for="rating" class="form-label">Rating</label>
                    <select class="form-select" id="rating" name="rating" required>
                        <option value="5">5 - Excellent</option>
                        <option value="4">4 - Good</option>
                        <option value="3">3 - Average</option>
                        <option value="2">2 - Poor</option>
                        <option value="1">1 - Terrible</option>
                    </select>
                </div>
                <div class="mb-2">
                    <label for="comment" class="form-label">Comment</label>
                    <textarea class="form-control" id="comment" name="comment" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-sm">Submit Review</button>
            </form>
        </sec:authorize>
    </div>
    <div class="col-md-4">
        <div class="card shadow">
            <div class="card-body text-center">
                <h3 class="card-title fw-bold">INR ${venue.pricePerHour} <small class="text-muted">/ hr</small></h3>
                <p class="card-text fs-5">Capacity: ${venue.capacity} guests</p>
                <hr>
                <sec:authorize access="hasRole('ADMIN')">
                    <a href="/venue/edit/${venue.id}" class="btn btn-lg btn-primary w-100 shadow-sm">Manage Venue</a>
                </sec:authorize>
                <sec:authorize access="!hasRole('ADMIN')">
                    <a href="/booking/book/${venue.id}" class="btn btn-lg btn-success w-100 shadow-sm">Check Availability</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
