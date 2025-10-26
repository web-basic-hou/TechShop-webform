<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TechShop.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giỏ Hàng - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/Cart.css">
</head>
<body>
    <form id="form1" runat="server">
        <header class="site-header">
            <div class="container">
                <div class="header-content">
                    <a href="Home.aspx" class="logo">
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" /></svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <nav class="main-nav">
                        <a href="Home.aspx">Trang Chủ</a>
                        <a href="Products.aspx">Sản Phẩm</a>
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
            <div class="page-header">
                <nav class="breadcrumbs">
                    <ol>
                        <li>
                            <a href="Home.aspx">Trang chủ</a>
                            <svg xmlns="http://www.w3.org/2000/svg" class="separator-icon" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg>
                        </li>
                        <li><span>Giỏ hàng</span></li>
                    </ol>
                </nav>
                <h1 class="page-title">Giỏ Hàng Của Bạn</h1>
            </div>

            <div class="cart-layout">
                <div class="cart-items-container">
                    <div class="cart-items-card">
                        <div class="cart-item">
                            <img src="./assets/images/cucGach.png" alt="Product Image" class="cart-item-image">
                            <div class="cart-item-details">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-meta">Màu: Titan tự nhiên</p>
                                <button class="remove-button">Xóa</button>
                            </div>
                            <div class="quantity-selector">
                                <button class="quantity-btn">-</button>
                                <input type="text" value="1" class="quantity-input">
                                <button class="quantity-btn">+</button>
                            </div>
                            <p class="cart-item-price">30.990.000₫</p>
                        </div>

                        <div class="cart-item">
                            <img src="./assets/images/dtGap.png" alt="Product Image" class="cart-item-image">
                            <div class="cart-item-details">
                                <h3 class="product-name">Samsung Galaxy S23 Ultra</h3>
                                <p class="product-meta">Màu: Xanh rêu</p>
                                <button class="remove-button">Xóa</button>
                            </div>
                            <div class="quantity-selector">
                                <button class="quantity-btn">-</button>
                                <input type="text" value="1" class="quantity-input">
                                <button class="quantity-btn">+</button>
                            </div>
                            <p class="cart-item-price">25.490.000₫</p>
                        </div>

                        <div class="cart-item">
                            <img src="./assets/images/cucGachReal.png" alt="Product Image" class="cart-item-image">
                            <div class="cart-item-details">
                                <h3 class="product-name">iPhone 20 Pro Max 256TB</h3>
                                <p class="product-meta">Màu: Titan tự nhiên</p>
                                <button class="remove-button">Xóa</button>
                            </div>
                            <div class="quantity-selector">
                                <button class="quantity-btn">-</button>
                                <input type="text" value="1" class="quantity-input">
                                <button class="quantity-btn">+</button>
                            </div>
                            <p class="cart-item-price">300.000.000₫</p>
                        </div>
                    </div>
                </div>
                <div class="order-summary-container">
                    <div class="order-summary-card">
                        <h2 class="summary-title">Tóm tắt đơn hàng</h2>
                        <div class="summary-row">
                            <span>Tạm tính</span>
                            <span>566.480.000₫</span>
                        </div>
                        <div class="summary-row">
                            <span>Phí vận chuyển</span>
                            <span>Miễn phí</span>
                        </div>
                        <div class="summary-total">
                            <span>Tổng cộng</span>
                            <span>566.480.000₫</span>
                        </div>
                        <a href="Pay.aspx" class="checkout-button-link"><button type="button" class="checkout-button">Tiến hành thanh toán</button></a>
                        <a href="Products.aspx" class="continue-shopping-link">Tiếp tục mua sắm</a>
                    </div>
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
