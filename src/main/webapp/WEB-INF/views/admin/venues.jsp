<%@ include file="common/header.jsp" %>
<div class="py-2">
    <div class="row mb-4 align-items-center bg-white shadow-sm p-3 rounded mx-0">
        <div class="col-md-8">
            <h2 class="fw-bold text-primary mb-0"><i class="bi bi-building me-2"></i>Venue Management</h2>
            <p class="text-muted mb-0">Total system venues registered: ${venues.size()}</p>
        </div>
        <div class="col-md-4 text-end">
            <a href="/venue/add" class="btn btn-primary btn-lg shadow-sm rounded-pill px-4">
                <i class="bi bi-plus-circle me-2"></i>Add New Venue
            </a>
        </div>
    </div>

    <div class="card border-0 shadow-sm rounded-3">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light text-dark fw-bold">
                        <tr>
                            <th class="ps-4">ID</th>
                            <th>Venue Info</th>
                            <th>Location</th>
                            <th>Capacity</th>
                            <th>Price/hr</th>
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="venue" items="${venues}">
                            <tr>
                                <td class="ps-4 fw-bold">#${venue.id}</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="${venue.imageUrl != null ? venue.imageUrl : 'https://via.placeholder.com/40'}" class="rounded shadow-sm me-3" width="50" height="40" alt="img">
                                        <span class="fw-bold">${venue.name}</span>
                                    </div>
                                </td>
                                <td><i class="bi bi-geo-alt me-1 text-danger"></i>${venue.city}</td>
                                <td><i class="bi bi-people me-1 text-info"></i>${venue.capacity}</td>
                                <td class="fw-bold text-success">INR ${venue.pricePerHour}</td>
                                <td class="text-center">
                                    <div class="btn-group shadow-sm">
                                        <a href="/venue/detail/${venue.id}" class="btn btn-sm btn-outline-secondary px-3" title="View Details">
                                            <i class="bi bi-eye"></i>
                                        </a>
                                        <a href="/venue/edit/${venue.id}" class="btn btn-sm btn-outline-primary px-3" title="Edit Venue">
                                            <i class="bi bi-pencil-square"></i>
                                        </a>
                                        <a href="/venue/delete/${venue.id}" class="btn btn-sm btn-outline-danger px-3" 
                                           onclick="return confirm('Are you sure you want to delete this venue?')" title="Delete Venue">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty venues}">
                            <tr>
                                <td colspan="6" class="text-center py-5 text-muted italic">
                                    <i class="bi bi-building-x fs-1 d-block mb-3"></i>
                                    No venues found in the system. <a href="/venue/add">Start by adding one</a>.
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
