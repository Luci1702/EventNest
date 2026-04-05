<%@ include file="../admin/common/header.jsp" %>
<div class="card border-0 shadow-sm p-4">
    <div class="card-body">
        <h2 class="fw-bold mb-4 text-primary"><i class="bi bi-pencil-square me-2"></i>Edit Venue</h2>
        <form action="/venue/edit" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="id" value="${venue.id}" />
            <div class="mb-3">
                <label for="name" class="form-label">Venue Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${venue.name}" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${venue.address}" required>
            </div>
            <div class="mb-3">
                <label for="city" class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city" value="${venue.city}" required>
            </div>
            <div class="mb-3">
                <label for="capacity" class="form-label">Capacity (Max guests)</label>
                <input type="number" class="form-control" id="capacity" name="capacity" value="${venue.capacity}" required>
            </div>
            <div class="mb-3">
                <label for="pricePerHour" class="form-label">Price per Hour (INR)</label>
                <input type="number" step="0.01" class="form-control" id="pricePerHour" name="pricePerHour" value="${venue.pricePerHour}" required>
            </div>
            <div class="mb-3">
                <label for="imageUrl" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${venue.imageUrl}">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="5">${venue.description}</textarea>
            </div>
            <div class="row mt-4">
                <div class="col-6">
                    <a href="/admin/venues" class="btn btn-secondary w-100">Cancel</a>
                </div>
                <div class="col-6">
                    <button type="submit" class="btn btn-primary w-100">Update Venue</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="../admin/common/footer.jsp" %>
