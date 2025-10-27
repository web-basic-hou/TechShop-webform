<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechShop.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/Home.css">
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
                        <a href="Cart.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
                        </a>
                        <a href="User.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" /></svg>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <main>
            <div class="hero-section">
                <img src="./Asset/images/ssung.png" alt="Banner quảng cáo" class="hero-image">
                <div class="hero-content">
                    <h1 class="hero-title">iPhone 15 Series</h1>
                    <p class="hero-subtitle">Trải nghiệm đỉnh cao công nghệ với chip A17 Pro, khung viền Titan và camera đột phá.</p>
                    <a href="DetailProduct.aspx" class="hero-button">Mua ngay</a>
                </div>
            </div>

            <div class="featured-products">
                <div class="container">
                    <h2 class="section-title">Sản phẩm nổi bật</h2>

                    <div class="product-grid">
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <div class="product-card">
                                    <div class="product-image-container">
                                        <img src="./Asset/images/cucGach.png" alt='san pham' class="product-image" />
                                        <div class="product-overlay">
                                            <a href='<%# "DetailProduct.aspx?id=" + Eval("id") %>' class="details-button">Xem chi tiết</a>
                                        </div>
                                    </div>
                                    <div class="product-info">
                                        <h3 class="product-name"><%# Eval("productName") %></h3>
                                        <p class="product-price"><%# Eval("value") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="view-more-container">
                        <a href="Products.aspx" class="view-more-button">Xem thêm sản phẩm</a>
                    </div>
                    </div>
            </div>

            <section class="features">
                <div class="container">
                    <h2 class="section-title">Vì sao chọn TechShop?</h2>
                    <div class="features-grid">
                        <div class="feature-card">
                            <img src="./asset/icons/rocket-lunch.png" alt="Miễn phí vận chuyển">
                            <h3>Giao hàng miễn phí</h3>
                            <p>Miễn phí giao hàng toàn quốc cho đơn từ 2 triệu đồng.</p>
                        </div>
                        <div class="feature-card">
                            <img src="./asset/icons/shield-check.png" alt="Bảo hành chính hãng">
                            <h3>Bảo hành chính hãng</h3>
                            <p>Cam kết 100% sản phẩm chính hãng, bảo hành minh bạch.</p>
                        </div>
                        <div class="feature-card">
                            <img src="./asset/icons/handshake.png" alt="Hỗ trợ 24/7">
                            <h3>Hỗ trợ 24/7</h3>
                            <p>Đội ngũ tư vấn viên luôn sẵn sàng hỗ trợ bạn bất cứ lúc nào.</p>
                        </div>
                    </div>
                </div>
            </section>
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