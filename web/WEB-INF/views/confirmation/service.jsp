

<div class="card">
    <div class="card-header">
        Services
    </div>
    <div class="card-body">
        <c:forEach var="service" items="${services}">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="services" id="service${service.serviceID}" value="${service.serviceName}">
                <label class="form-check-label" for="service${service.serviceID}">
                    <span>${service.serviceName}</span>
                    <span class="price">${service.price} VND</span>
                </label>
            </div>
        </c:forEach>
    </div>
</div>