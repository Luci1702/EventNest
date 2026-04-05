<%@ include file="../common/header.jsp" %>
<div class="row mb-4">
    <div class="col-md-8">
        <h2>Available Venues</h2>
    </div>
    <div class="col-md-4">
        <form class="d-flex" action="/venue/list" method="get">
            <input class="form-control me-2" type="search" name="city" placeholder="Search by city" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
</div>

<div class="row">
    <c:forEach var="venue" items="${venues}">
        <div class="col-md-4 venue-card">
            <div class="card shadow-sm h-100">
                <img src="${venue.imageUrl != null ? venue.imageUrl : 'https://via.placeholder.com/400x250?text=Venue'}" class="card-img-top" alt="${venue.name}">
                <div class="card-body">
                    <h5 class="card-title">${venue.name}</h5>
                    <p class="card-text text-muted">${venue.city}</p>
                    <p class="card-text">Capacity: ${venue.capacity} guests</p>
                    <p class="card-text fw-bold">INR ${venue.pricePerHour} per hour</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="/venue/detail/${venue.id}" class="btn btn-sm btn-outline-secondary">View Details</a>
                        <a href="/booking/book/${venue.id}" class="btn btn-sm btn-primary">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:if test="${empty venues}">
        <div class="col-12 text-center py-5">
            <p class="lead">No venues found matching your search.</p>
        </div>
    </c:if>
</div>
<%@ include file="../common/footer.jsp" %>
