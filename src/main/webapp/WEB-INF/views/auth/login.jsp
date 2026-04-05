<%@ include file="../common/header.jsp" %>
<div class="row justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="col-md-5">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-5">
                <div class="text-center mb-4">
                    <div class="d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white rounded-circle mb-3" style="width: 80px; height: 80px;">
                        <i class="bi bi-person-lock fs-1"></i>
                    </div>
                    <h2 class="fw-bold">Welcome Back</h2>
                    <p class="text-muted">Login to manage your event bookings</p>
                </div>

                <c:if test="${param.error != null}">
                    <div class="alert alert-danger border-0 shadow-sm small">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>Invalid username or password.
                    </div>
                </c:if>
                <c:if test="${param.success != null}">
                    <div class="alert alert-success border-0 shadow-sm small">
                        <i class="bi bi-check-circle-fill me-2"></i>Registration successful. Please login.
                    </div>
                </c:if>

                <form action="/auth/login" method="post" class="mt-4">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control bg-light border-0 shadow-sm" id="username" name="username" placeholder="Username" required>
                        <label for="username" class="text-muted"><i class="bi bi-person me-2"></i>Username</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control bg-light border-0 shadow-sm" id="password" name="password" placeholder="Password" required>
                        <label for="password" class="text-muted"><i class="bi bi-key me-2"></i>Password</label>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-lg w-100 shadow rounded-pill mb-3">
                        Login <i class="bi bi-arrow-right-short"></i>
                    </button>
                    
                    <div class="text-center">
                        <span class="text-muted small">Don't have an account?</span>
                        <a href="/auth/register" class="text-primary fw-bold text-decoration-none small ms-1">Create Account</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
