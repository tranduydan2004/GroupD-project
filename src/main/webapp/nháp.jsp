<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cá Koi</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <style>
        .carousel {
            position: relative;
            overflow: hidden;
        }
        .carousel-item {
            display: none;
            width: 100%;
            height: 700px;
            object-fit: cover;
        }
        .carousel-item.active {
            display: block;
        }
    </style>
</head>
<body class="bg-gray-100">

<!-- Header -->
<header class="bg-white shadow fixed w-full z-10">
    <div class="container mx-auto flex justify-between items-center py-4 px-4">
        <div class="text-xl font-bold">Cá Koi</div>
        <nav class="flex space-x-4">
            <a href="#" class="text-gray-700">Trang chủ</a>
            <a href="#" class="text-gray-700">Thông tin</a>
            <a href="#" class="text-gray-700">Liên hệ</a>
        </nav>
        <div class="flex items-center space-x-4">
            <button class="text-gray-700">Tìm kiếm</button>
            <button class="text-gray-700">Thông báo</button>
            <button class="text-gray-700">Tài khoản</button>
        </div>
    </div>
</header>

<!-- Carousel -->
<div class="carousel mt-16">
    <div class="carousel-item active">
        <img src="https://img.pikbest.com/wp/202345/black-koi-an-orange-with-spots-is-swimming_9597133.jpg!w700wp" alt="Cá Koi" class="w-full h-700 object-cover">
    </div>
    <div class="carousel-item">
        <img src="https://img.pikbest.com/ai/illus_our/20230413/15b5af1879079a3ca60dafa14a540c05.jpg!w700wp" alt="Cá Koi" class="w-full h-700 object-cover">
    </div>
    <div class="carousel-item">
        <img src="https://img.pikbest.com/ai/illus_our/20230424/56e8da84cca313019c4d06456e4ee3a2.jpg!w700wp" alt="Cá Koi" class="w-full h-700 object-cover">
    </div>
    <button class="absolute left-0 top-1/2 transform -translate-y-1/2 bg-white p-2 shadow-lg" id="prevBtn">&#9664;</button>
    <button class="absolute right-0 top-1/2 transform -translate-y-1/2 bg-white p-2 shadow-lg" id="nextBtn">&#9654;</button>
</div>

<div class="text-center mt-4">
    <button class="bg-blue-500 text-white py-2 px-4 rounded">Xem thông tin cá Koi</button>
</div>

<!-- Footer -->
<footer class="bg-white mt-8 p-4 text-center">
    <p>&copy; 2024 Công ty của bạn. Mọi quyền được bảo lưu.</p>
</footer>

<script>
    let currentIndex = 0;
    const items = document.querySelectorAll('.carousel-item');
    const totalItems = items.length;

    function showItem(index) {
        items.forEach((item, i) => {
            item.classList.remove('active');
            if (i === index) {
                item.classList.add('active');
            }
        });
    }

    document.getElementById('nextBtn').addEventListener('click', function() {
        currentIndex = (currentIndex + 1) % totalItems;
        showItem(currentIndex);
    });

    document.getElementById('prevBtn').addEventListener('click', function() {
        currentIndex = (currentIndex - 1 + totalItems) % totalItems;
        showItem(currentIndex);
    });

    // Automatic carousel rotation
    setInterval(() => {
        currentIndex = (currentIndex + 1) % totalItems;
        showItem(currentIndex);
    }, 3000);
</script>

</body>
</html>
