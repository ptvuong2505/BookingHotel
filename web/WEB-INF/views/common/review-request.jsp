<%-- 
    Document   : ReviewRequest
    Created on : Mar 11, 2025, 9:57:30 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="review-section">
    <h2>REVIEWS FROM OUR VALUED GUESTS</h2>
    <p>“We listen to our client with our heart and improve continuously.”</p>

    <div class="review-container">
        <button id="prevBtn" class="control-btn">←</button>

        <div class="review-image">
            <img src="<%=request.getContextPath()%>/images/reviewsguests.png" alt="TripAdvisor Award">
        </div>

        <div class="review-content">
            <h3 id="hotelName">QuangDa Hotel & Suites</h3>
            <div class="dots"></div>
            <div id="reviewText" class="review-text"></div>
            <div class="review-author" id="reviewAuthor"></div>
            <div class="review-date" id="reviewDate"></div>
        </div>

        <button id="nextBtn" class="control-btn">→</button>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const reviews = [
            {
                text: "Wonderful hotel. QuangDa Hotel & Suites was facing the sea, superb views. It was spacious and exquisitely designed. Staff is friendly and willing to help. Will definitely come back!",
                author: "MR. IGNACIO MANJON",
                date: "Jan 2023"
            },
            {
                text: "A truly luxurious experience. The rooms are beautifully designed and the views are breathtaking. The food was delicious and the service impeccable!",
                author: "MRS. SARAH LEE",
                date: "Feb 2023"
            },
            {
                text: "Exceptional service and facilities. Highly recommended for anyone looking to relax and enjoy a high-end vacation experience.",
                author: "MR. JAMES NGUYEN",
                date: "Mar 2023"
            },
            {
                text: "Beautiful hotel with amazing views. The pool was incredible and the rooms were spacious and luxurious. Will definitely visit again!",
                author: "MRS. EMMA WILLIAMS",
                date: "Apr 2023"
            }
        ];

        let currentIndex = 0;

        const reviewText = document.getElementById('reviewText');
        const reviewAuthor = document.getElementById('reviewAuthor');
        const reviewDate = document.getElementById('reviewDate');
        const dotsContainer = document.querySelector('.dots');

        function updateReview() {
            const currentReview = reviews[currentIndex];
            reviewText.innerHTML = currentReview.text;
            reviewAuthor.innerHTML = currentReview.author;
            reviewDate.innerHTML = currentReview.date;

            let dotsHTML = "";
            reviews.forEach((_, index) => {
                dotsHTML += '<span class="dot ' + (index === currentIndex ? 'active-dot' : '') + '" data-index="' + index + '"></span>';
            });
            dotsContainer.innerHTML = dotsHTML;
        }

        document.getElementById('nextBtn').addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % reviews.length;
            updateReview();
        });

        document.getElementById('prevBtn').addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + reviews.length) % reviews.length;
            updateReview();
        });

        dotsContainer.addEventListener('click', (e) => {
            if (e.target.classList.contains('dot')) {
                currentIndex = parseInt(e.target.getAttribute('data-index'));
                updateReview();
            }
        });

        updateReview();
    });
</script>
