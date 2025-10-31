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
                    <li><span>Chi tiết sản phẩm</span></li>
                </ol>
            </nav>
            
            <div class="product-container">
                <div class="product-main-details">
                    
                    <div class="product-gallery">
                        <asp:Image ID="imgProduct" runat="server" CssClass="main-image" />
                    </div>

                    <div class="product-info">
                        <h1 class="product-title"><asp:Label ID="lblProductName" runat="server" /></h1>
                        <p class="price-container">
                            <span class="current-price"><asp:Label ID="lblProductPrice" runat="server" /></span>
                        </p>

                        <p><strong>Màu sắc:</strong> <asp:Label ID="lblProductColor" runat="server" /></p>
                        <p><strong>Dung lượng:</strong> <asp:Label ID="lblProductCapacity" runat="server" /></p>

                        <h3>Mô tả:</h3>
                        <p><asp:Label ID="lblProductDesc" runat="server" /></p>

                        <h3>Thông số kỹ thuật:</h3>
                        <p><asp:Label ID="lblProductSpec" runat="server" /></p>

                        <div class="action-buttons">
                            <asp:Button ID="btnAddToCart" runat="server" Text="Thêm vào giỏ hàng" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
                            <asp:Button ID="btnBuyNow" runat="server" Text="Mua ngay" CssClass="btn btn-secondary" OnClick="btnBuyNow_Click" />
                        </div>
                        <asp:Label ID="lblAddCartMsg" runat="server" CssClass="cart-success"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="related-products-section">
                <h2 class="section-title">Sản phẩm liên quan</h2>
                <div class="related-products-grid">
                    <asp:Repeater ID="rptRelatedProducts" runat="server">
                        <ItemTemplate>
                            <div class="related-product-card">
                                <a href='<%# "DetailProduct.aspx?id=" + Eval("id") %>'>
                                    <img class="related-image" src='<%# ResolveUrl(Eval("imageUrl").ToString()) %>' alt='<%# Eval("productName") %>' />
                                </a>
                                <div class="related-info">
                                    <h3 class="related-name"><%# Eval("productName") %></h3>
                                    <p class="related-price"><%# Eval("value") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
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
