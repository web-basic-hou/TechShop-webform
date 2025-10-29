<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TechShop.User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tài Khoản Của Tôi - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/User.css">
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="container">
                <div class="header-content">
                    <a href="Home.aspx" class="logo-link">
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <nav class="nav-menu">
                        <a href="Home.aspx" class="nav-link">Trang Chủ</a>
                        <a href="Products.aspx" class="nav-link">Sản Phẩm</a>
                        <a href="Contact.aspx" class="nav-link">Liên Hệ</a>
                    </nav>
                    <div class="header-icons">
                        <a href="Cart.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon-svg" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                            <span class="icon-badge">3</span>
                        </a>
                        <a href="User.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon-svg" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <main class="container main-content">
            <div class="breadcrumbs">
                <nav class="breadcrumbs-nav">
                    <ol class="breadcrumbs-list">
                        <li class="breadcrumb-item">
                            <a href="Home.aspx" class="breadcrumb-link">Trang chủ</a>
                            <svg xmlns="http://www.w3.org/2000/svg" class="breadcrumb-separator" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg>
                        </li>
                        <li class="breadcrumb-item">
                            <span class="breadcrumb-current">Tài khoản của tôi</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="content-layout">
                <aside class="sidebar-aside">
                    <div class="sidebar-card">
                        <div class="user-profile">
                            <img class="user-avatar" src="https://placehold.co/100x100/e0e7ff/4338ca?text=A" alt="Avatar">
                            <div>
                                <p class="user-name">Anh Nguyễn</p>
                                <p class="user-email">anh.nguyen@email.com</p>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <a href="User.aspx" class="sidebar-nav-item active">
                                <span class="nav-item-text">Thông tin tài khoản</span>
                            </a>
                            <a href="UserProduct.aspx" class="sidebar-nav-item">
                                <span class="nav-item-text">Lịch sử đơn hàng</span>
                            </a>
                            <a href="Login.aspx" class="sidebar-nav-item logout">
                                <span class="nav-item-text">Đăng xuất</span>
                            </a>
                        </nav>
                    </div>
                </aside>

                <div class="main-form-content">
                    <div class="form-card">
                        <h2 class="section-title">Thông tin tài khoản</h2>

                        <div class="form-section">
                            <div class="input-group">
                                <div class="form-field">
                                    <label for="full_name" class="form-label">Họ và tên</label>
                                    <asp:TextBox ID="full_name" runat="server" CssClass="form-input" style="background-color: var(--color-slate-100);"></asp:TextBox>
                                </div>
                                <div class="form-field">
                                    <label for="email" class="form-label">Email</label>
                                    <asp:TextBox ID="email" runat="server" CssClass="form-input" style="background-color: var(--color-slate-100);" Enabled="false"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-field">
                                 <label for="phone" class="form-label">Số điện thoại</label>
                                 <asp:TextBox ID="phone" runat="server" CssClass="form-input" style="background-color: var(--color-slate-100);"></asp:TextBox>
                            </div>
                             <div class="form-action">
                                <asp:Button ID="btnSaveChanges" runat="server" Text="Lưu thay đổi" CssClass="button button-primary" />
                            </div>
                        </div>

                        <hr class="separator">

                        <h2 class="section-title">Địa chỉ nhận hàng</h2>
                        <div class="form-section">
                            <div class="form-field">
                                <label for="address" class="form-label">Địa chỉ</label>
                                <asp:TextBox ID="address" runat="server" placeholder="Nhập địa chỉ nhận hàng" CssClass="form-input"></asp:TextBox>
                            </div>
                            <div class="input-group">
                                <div class="form-field">
                                    <label for="city" class="form-label">Tỉnh / Thành phố</label>
                                    <asp:TextBox ID="city" runat="server" placeholder="VD: Hà Nội" CssClass="form-input"></asp:TextBox>
                                </div>
                                <div class="form-field">
                                    <label for="district" class="form-label">Quận / Huyện</label>
                                    <asp:TextBox ID="district" runat="server" placeholder="VD: Hoàng Mai" CssClass="form-input"></asp:TextBox>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="form-field">
                                    <label for="ward" class="form-label">Phường / Xã</label>
                                    <asp:TextBox ID="ward" runat="server" placeholder="VD: Định công" CssClass="form-input"></asp:TextBox>
                                </div>
                                <div class="form-field">
                                    <label for="postal_code" class="form-label">Mã bưu điện</label>
                                    <asp:TextBox ID="postal_code" runat="server" placeholder="VD: 100000" CssClass="form-input"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-action">
                                <asp:Button ID="btnSaveAddress" runat="server" Text="Lưu địa chỉ" CssClass="button button-primary" />
                            </div>
                        </div>

                        <hr class="separator">

                        <h2 class="section-title">Đổi mật khẩu</h2>
                        <div class="form-section">
                            <div class="form-field">
                                <label for="current_password" class="form-label">Mật khẩu hiện tại</label>
                                <asp:TextBox ID="current_password" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>
                            </div>
                            <div class="input-group">
                                <div class="form-field">
                                    <label for="new_password" class="form-label">Mật khẩu mới</label>
                                    <asp:TextBox ID="new_password" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>
                                </div>
                                <div class="form-field">
                                    <label for="confirm_password" class="form-label">Xác nhận mật khẩu mới</label>
                                    <asp:TextBox ID="confirm_password" runat="server" TextMode="Password" CssClass="form-input"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-action">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Đổi mật khẩu" CssClass="button button-secondary" />
                            </div>
                        </div>
                        <br />
                         <div class="form-action">
                            <asp:Button ID="Button1" runat="server" Text="Đăng xuất" CssClass="button button-secondary" />
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="footer">
            <div class="container footer-content">
               <div class="footer-copyright">
                    <p>&copy; 2025 TechShop. Đã đăng ký bản quyền.</p>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
