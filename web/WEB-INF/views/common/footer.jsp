<%-- 
    Document   : Footer
    Created on : Mar 11, 2025, 9:57:46 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer>
    <div class="footer-container">
        <div class="footer-column">
            <img src="images/QuangDaLogo.jpg" alt="QuangDa Logo">
        </div>
        <div class="footer-column">
            <h3>Contact Us</h3>
            <p>📧 enquiry@QuangDa.com</p>
            <p>☎️ Hotline: +84 (0) 235 858 8888</p>
        </div>
        <div class="footer-column">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <p >🔗 Facebook</p>
                <p>🔗 LinkedIn</p>
                <p>🔗 Instagram</p>
                <p>🔗 YouTube</p>
            </div>
        </div>
    </div>


    <div class="logo-section">

        <div>
            <span>NEW WORLD</span>
            QUANGDA BEACH RESORT<br>
            VIETNAM
        </div>
        <div>
            <span>NEW WORLD</span>
            QUANGDA HOTEL<br>
            VIETNAM
        </div>
        <div>
            <span>QUANGDA</span>
            HOTEL × SUITES
        </div>
        <div>
            <span>RESIDENCES</span>
            QUANGDA
        </div>
        <div>
            <span>QUANGDA SHORES</span>
            GOLF CLUB
        </div>
    </div>

    <div class="footer-bottom">
        © Copyright 2025 QuangDa<br>
        Hoi An South Development LTD<br>
        Address: Tay Son Tay Hamlet, Duy Hai Commune, Duy Xuyen District, Quang Nam Province, Vietnam<br>
        Business Registration Certificate: 4000789705 issued on 10/12/2010, sixteenth updated on 25/08/2022 by Quang Nam Department of Planning and Investment
    </div>
</footer>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
    intent="WELCOME"
    chat-title="Quang-Da-Hotel"
    agent-id="4b6bc046-472c-456b-bb89-52196dde91ad"
    language-code="vi">
</df-messenger>
<script>

    window.addEventListener("dfMessengerLoaded", function () {
        const dfMessenger = document.querySelector("df-messenger");

        if (dfMessenger) {
            const dfMessengerChat = dfMessenger.shadowRoot.querySelector("df-messenger-chat");

            if (dfMessengerChat) {
                const chatWrapper = dfMessengerChat.shadowRoot.querySelector(".chat-wrapper");

                if (chatWrapper) {
                    chatWrapper.style.height = "450px"; // Đặt chiều cao
                    chatWrapper.style.width = "350px"; // Đặt chiều rộng
                }
            }
        }
    });


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

    let checkInInput = document.getElementById("checkInDate");
    let checkOutInput = document.getElementById("checkOutDate");
    let today = new Date().toISOString().split("T")[0];


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

    let carousel = new bootstrap.Carousel(document.getElementById("roomCarousel"), {
        interval: 5000,
        ride: "carousel"
    });

    updateReview();

    if (!checkInInput.value) {
        checkInInput.value = today;
    }
    if (!checkOutInput.value || checkOutInput.value < checkInInput.value) {
        checkOutInput.value = checkInInput.value;
    }

    checkInInput.min = today;
    checkOutInput.min = checkInInput.value;

    checkInInput.addEventListener("change", function () {
        checkOutInput.min = checkInInput.value;
        if (checkOutInput.value < checkInInput.value) {
            checkOutInput.value = checkInInput.value;
        }
    });
</script>

</body>
</html>

