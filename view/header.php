<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DA1-YAME</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-d6dSUk9HYkVe7MZ1q2i8d8yNLE7FgAZtZHKCpmJ92pGRJN21zZwmy0oVOxOMvjXk" crossorigin="anonymous">
    <link rel="stylesheet" href="layout/css1/linearicons.css">
    <link rel="stylesheet" href="layout/css1/owl.carousel.css">
    <link rel="stylesheet" href="layout/css1/themify-icons.css">
    <link rel="stylesheet" href="layout/css1/font-awesome.min.css">
    <link rel="stylesheet" href="layout/css1/nice-select.css">
    <link rel="stylesheet" href="layout/css1/nouislider.min.css">
    <link rel="stylesheet" href="layout/css1/bootstrap.css">
    <link rel="stylesheet" href="layout/css1/main.css">
    <link rel="stylesheet" href="layout/css1/linearicons.css">
    <link rel="stylesheet" href="layout/css1/owl.carousel.css">
    <link rel="stylesheet" href="layout/css1/themify-icons.css">
    <link rel="stylesheet" href="layout/css1/font-awesome.min.css">
    <link rel="stylesheet" href="layout/css1/nice-select.css">
    <link rel="stylesheet" href="layout/css1/nouislider.min.css">
    <link rel="stylesheet" href="layout/css1/bootstrap.css">
    <link rel="stylesheet" href="layout/css1/main.css">
    <link rel="stylesheet" type="text/css" href="layout/styles/bootstrap4/bootstrap.min.css">
    <link href="layout/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="layout/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="layout/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="layout/plugins/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="layout/plugins/slick-1.8.0/slick.css">
    <link rel="stylesheet" type="text/css" href="layout/styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="layout/styles/blog_responsive.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="layout/styless.css">
    <link rel="stylesheet" href="layout/styles/profile_view.css">
    <style>
        .primarys-btn {
            display: inline-block;
            padding: 10px 20px; /* Điều chỉnh kích thước padding theo nhu cầu */
            background-color: #088178; /* Màu nền */
            color: #fff; /* Màu chữ */
            text-decoration: none;
            border-radius: 5px; /* Góc bo tròn */
        }
    </style>
</head>
<body>
<!-- Trong file view/header.php -->
<?php if (is_user_logged_in()){
    $user_profile = get_user_by_username($_SESSION['username']);
    $ds_cart_user = get_cart_user($_SESSION['id_user']);
}
?>
<section id="header">
    <a href="index.php"><img src="layout/img/logo2.png" class="logo" alt=""></a>
    <div>
        <ul id="navbar">
            <div class="col3">
                <!-- Biểu mẫu tìm kiếm -->
                <form action="index.php?pg=shop" method="POST" style= "margin-left:-30px">
                    <input type="text" name="kyw" placeholder="Tìm Kiếm" style="width:356px;">
                    <input type="hidden" name="pg" value="shop"> <!-- Giữ nguyên trang hiện tại là shop -->
                    <input type="submit" name="timkiem" value="Tìm kiếm">
                </form>
            </div>
            <li><a href="index.php">TRANG CHỦ</a></li>
            <li><a href="index.php?pg=shop">CỬA HÀNG</a></li>
            <li><a href="index.php?pg=about">GIỚI THIỆU</a></li>
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <?php if (is_user_logged_in()): ?>
                <!-- Nếu người dùng đã đăng nhập -->
                <li id="id_user">
                    <div class="dropdown-content">
                        <a href="index.php?pg=profile_user" class="header__navsub-item"><img src="./layout/img/people/<?=$user_profile['hinh']?>" alt="" width="24px" > <?=$user_profile['hoten']?></a>
                        <a href="index.php?pg=profile_user&act=user_updates" class="header__navsub-item"><i class="fas fa-users-cog"></i>  Cài Đặt</a>
                        <a href="index.php?pg=dangxuat" id="dangxuat" class="header__navsub-item"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                    </div>
                    <a  id="user"><img src="./layout/img/people/<?=$user_profile['hinh']?>" alt="" width="36px" height="36px" style="border-radius: 50%!important;"></a>
                </li>
                <li id="lg-bag">
            <a href="index.php?pg=cart"><i class="far fa-shopping-bag"></i>
        <?php
            $count_cart = get_count_cart($_SESSION['id_user']);
            echo '<span class="cart-quantity">' . $count_cart['soluong_cart'] . '</span>';
        ?>
    </a>
</li>

            <?php else: ?>
                <!-- Nếu chưa đăng nhập -->
                <li id="id_user">
                    <div class="dropdown-content">
                    <a href="index.php?pg=dangky" id="login1" class="header__navsub-item"><i class="fas fa-user-plus"></i> Đăng ký</a>
                    <a href="index.php?pg=dangnhap" id="login1" class="header__navsub-item"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>
                    </div>
                    <a id="user"><i class="fas fa-user"></i></a>
                </li>
                <li id="lg-bag"><a href="index.php?pg=cart"><i class="far fa-shopping-bag"></i></a></li>
            <?php endif; ?>
            <a href="#" id="close"><i class="far fa-times"></i></a>
        </ul>
    </div>
    <div id="mobile">
        <?php if (is_user_logged_in()): ?>
            <!-- Nếu người dùng đã đăng nhập -->
            <a href="index.php?pg=cart"><i class="far fa-shopping-bag"></i></a>
        <?php endif; ?>
        <i id="bar" class="fas fa-outdent"></i>
    </div>
</section>

<script>
    var user = document.getElementById('id_user');
    var navsub = document.getElementsByClassName('dropdown-content')[0];
    var navsubDisplay = navsub.style.display;
    user.onclick = function(){
    var isClose = navsub.style.display === navsubDisplay;
        if(isClose){
            navsub.style.display = 'block';
        }else{
            navsub.style.display = null;
        }
    }
</script>






