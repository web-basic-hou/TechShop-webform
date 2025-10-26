<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="TechShop.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sản Phẩm - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="~/Styles/Products.css">
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
                        <a href="Products.aspx" class="active">Sản Phẩm</a>
                        <a href="Contact.aspx">Liên Hệ</a>
                    </nav>
                    <div class="header-icons">
                        <a href="Cart.aspx" class="icon-link cart-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
                            <span class="cart-badge">3</span>
                        </a>
                        <a href="User.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" /></svg>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <main class="container page-content">
            <nav class="breadcrumbs">
                <ol>
                    <li>
                        <a href="Home.aspx">Trang chủ</a>
                        <svg xmlns="http://www.w3.org/2000/svg" class="separator-icon" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg>
                    </li>
                    <li><span>Sản phẩm</span></li>
                </ol>
            </nav>
            
            <div class="shop-layout">
                <aside class="filters-sidebar">
                    <div class="filters-container">
                        <div class="filter-group">
                            <h3 class="filter-title">Thương hiệu</h3>
                            <div class="filter-options">
                                <label class="filter-option"><input type="checkbox"> <span>Apple</span></label>
                                <label class="filter-option"><input type="checkbox"> <span>Samsung</span></label>
                                <label class="filter-option"><input type="checkbox"> <span>Xiaomi</span></label>
                                <label class="filter-option"><input type="checkbox"> <span>OPPO</span></label>
                                <label class="filter-option"><input type="checkbox"> <span>Realme</span></label>
                            </div>
                        </div>
                        <div class="filter-group">
                            <h3 class="filter-title">Mức giá</h3>
                            <div class="filter-options">
                                <label class="filter-option"><input type="radio" name="price"> <span>Dưới 2 triệu</span></label>
                                <label class="filter-option"><input type="radio" name="price"> <span>Từ 2 - 5 triệu</span></label>
                                <label class="filter-option"><input type="radio" name="price"> <span>Từ 5 - 10 triệu</span></label>
                                <label class="filter-option"><input type="radio" name="price"> <span>Trên 10 triệu</span></label>
                            </div>
                        </div>
                    </div>
                </aside>

                <div class="product-grid-container">
                    <div class="mini-head">
                        <p>Hiển thị <span class="font-semibold">8</span> trên <span class="font-semibold">50</span> sản phẩm</p>
                    </div>
                    
                    <div class="product-grid">
                        <div class="product-card">
                            <a href="DetailProduct.aspx">
                                <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            </a>
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <div class="product-card">
                            <img class="product-image" src="./assets/images/cucGach2.png" alt="iPhone 15">
                            <div class="product-info">
                                <h3 class="product-name">iPhone 15 Pro Max 256GB</h3>
                                <p class="product-price">30.990.000₫</p>
                                <button class="add-to-cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                    </div>

                    <div class="pagination-container">
                        <nav class="pagination">
                            <a href="#" class="page-link page-arrow"><span class="sr-only">Previous</span><svg class="icon" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" /></svg></a>
                            <a href="#" class="page-link active">1</a>
                            <a href="#" class="page-link">2</a>
                            <a href="#" class="page-link desktop-only">3</a>
                            <span class="page-link ellipsis">...</span>
                            <a href="#" class="page-link desktop-only">8</a>
                            <a href="#" class="page-link page-arrow"><span class="sr-only">Next</span><svg class="icon" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z" clip-rule="evenodd" /></svg></a>
                        </nav>
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
