<div class="card">
                    <div class="card-header">
                        Room Information
                    </div>
                    <div class="card-body">
                        <div class="info-row">
                            <div class="info-label">Hotel:</div>
                            <div>${room.getHotel().name}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Room Type:</div>
                            <div>${room.getRoomType().typeName}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Description:</div>
                            <div>${room.getRoomType().description}</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Capacity:</div>
                            <div>${room.getRoomType().capacity} People</div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Price:</div>
                            <div>${room.price} $ per night</div>
                        </div>
                    </div>
                </div>