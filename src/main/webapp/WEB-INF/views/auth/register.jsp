<%@ include file="../common/header.jsp" %>
<div class="row justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <div class="d-inline-flex align-items-center justify-content-center bg-success bg-gradient text-white rounded-circle mb-3" style="width: 80px; height: 80px;">
                        <i class="bi bi-person-plus fs-1"></i>
                    </div>
                    <h2 class="fw-bold text-dark">Join EventNest</h2>
                    <p class="text-muted">Register to start booking your dream venue</p>
                </div>

                <c:if test="${error != null}">
                    <div class="alert alert-danger border-0 shadow-sm small">
                        <i class="bi bi-exclamation-octagon-fill me-2"></i>${error}
                    </div>
                </c:if>

                <form action="/auth/register" method="post" class="mt-4">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control bg-light border-0 shadow-sm" id="fullName" name="fullName" placeholder="Full Name" required>
                        <label for="fullName" class="text-muted small">Full Name</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="text" class="form-control bg-light border-0 shadow-sm" id="username" name="username" placeholder="Username" required>
                        <label for="username" class="text-muted small">Username</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="email" class="form-control bg-light border-0 shadow-sm" id="email" name="email" placeholder="name@example.com" required>
                        <label for="email" class="text-muted small">Email Address</label>
                    </div>

                    <div class="form-floating mb-4">
                        <input type="password" class="form-control bg-light border-0 shadow-sm" id="password" name="password" placeholder="Password" required>
                        <label for="password" class="text-muted small">Password</label>
                    </div>

                    <button type="submit" class="btn btn-success btn-lg w-100 shadow rounded-pill mb-3 py-3 fw-bold">
                        Create Account <i class="bi bi-check2-circle ms-2"></i>
                    </button>
                    
                    <div class="text-center">
                        <span class="text-muted small">Already registered?</span>
                        <a href="/auth/login" class="text-success fw-bold text-decoration-none small ms-1">Sign In</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
