<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailProduct.aspx.cs" Inherits="TechShop.DetailProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DetailProduct - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/DetailProduct.css">
</head>
<body>
    <form id="form1" runat="server">
        <header class="site-header">
            <div class="container">
                <div class="header-content">
                    <a href="Home.aspx" class="logo">
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <nav class="main-nav">
                        <a href="Home.aspx">Trang Chủ</a>
                        <a href="Products.aspx" class="active">Sản Phẩm</a>
                        <a href="Contact.aspx">Liên Hệ</a>
                    </nav>
                    <div class="header-icons">
                        <a href="Cart.aspx" class="icon-link cart-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
                            <span class="cart-badge">3</span>
                        </a>
                        <a href="User.aspx" class="icon-link"><svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" /></svg></a>
                    </div>
                </div>
            </div>
        </header>

        <main class="container page-content">
            <nav class="breadcrumbs">
                <ol>
                    <li><a href="Home.aspx">Trang chủ</a><svg xmlns="http://www.w3.org/2000/svg" class="separator-icon" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg></li>
                    <li><a href="Products.aspx">Sản phẩm</a><svg xmlns="http://www.w3.org/2000/svg" class="separator-icon" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg></li>
                    <li><span>iPhone 15 Pro Max</span></li>
                </ol>
            </nav>
            
            <div class="product-container">
                <div class="product-main-details">
                    <div class="product-gallery">
                        <img class="main-image" src="./assets/images/cucGach.png" alt="iPhone 15 Pro Max">
                    </div>

                    <div class="product-info">
                        <h1 class="product-title">iPhone 15 Pro Max 256GB | Chính hãng VN/A</h1>
                        <p class="price-container"><span class="current-price">30.990.000₫</span> <span class="original-price">34.990.000₫</span></p>

                        <div class="options-group">
                            <p class="options-label">Màu sắc:</p>
                            <div class="color-options">
                                <button class="color-swatch" style="background-color: #1e293b;" title="Titan Đen"></button>
                                <button class="color-swatch" style="background-color: #1e3a8a;" title="Titan Xanh"></button>
                                <button class="color-swatch" style="background-color: #e2e8f0;" title="Titan Trắng"></button>
                            </div>
                        </div>
                        <div class="options-group">
                            <p class="options-label">Dung lượng:</p>
                            <div class="storage-options">
                                <button class="storage-option active">256GB</button>
                                <button class="storage-option">512GB</button>
                                <button class="storage-option">1TB</button>
                            </div>
                        </div>
                        <div class="options-group">
                            <p class="options-label">Số lượng:</p>
                            <div class="quantity-selector">
                                <button class="quantity-btn">-</button>
                                <input type="text" value="1" class="quantity-input">
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                        
                        <div class="action-buttons">
                            <button class="btn btn-primary">Thêm vào giỏ</button>
                            <a href="Pay.aspx" class="btn btn-secondary">Mua ngay</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="product-description-tabs">
                <nav class="tabs-nav">
                    <a href="#" class="tab-link active">Mô tả sản phẩm</a>
                    <a href="#" class="tab-link">Thông số kỹ thuật</a>
                    <a href="#" class="tab-link">Đánh giá</a>
                </nav>
                <div class="tab-content">
                    <h3 class="tab-content-title">Thiết kế chuẩn Pro, bền bỉ và nhẹ hơn</h3>
                    <p>
                        iPhone 15 Pro là chiếc iPhone đầu tiên có thiết kế từ titan chuẩn hàng không vũ trụ, sử dụng cùng hợp kim trên tàu vũ trụ trong các sứ mệnh Sao Hỏa.
                        Titan là một trong những kim loại có tỷ lệ độ bền trên trọng lượng tốt nhất, tạo nên các phiên bản Pro nhẹ nhất từ trước đến nay của chúng tôi. Bạn sẽ nhận thấy sự khác biệt ngay khi cầm trên tay.
                    </p>
                </div>
            </div>
        </main>

        <footer class="site-footer">
            <div class="container">
                <div class="footer-bottom">
                    <p>&copy; 2025 TechShop. Đã đăng ký bản quyền.</p>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
