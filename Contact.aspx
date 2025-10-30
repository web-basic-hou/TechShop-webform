<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="TechShop.Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Liên Hệ - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="~/Styles/Contact.css">
    <style>
        .success-message {
          display: block;
          margin-top: 0.75rem;
          color: #16a34a;
          font-weight: 600;
          font-size: 0.95rem;
          text-align: center;
          animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
          from { opacity: 0; transform: translateY(-5px); }
          to { opacity: 1; transform: translateY(0); }
        }
    </style>
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
                        <a href="Contact.aspx" class="active">Liên Hệ</a>
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
                    <li>
                        <a href="Home.aspx">Trang chủ</a>
                        <svg xmlns="http://www.w3.org/2000/svg" class="separator-icon" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg>
                    </li>
                    <li>
                        <span>Liên hệ</span>
                    </li>
                </ol>
            </nav>

            <div class="page-header">
                <h1 class="page-title">Liên hệ với chúng tôi</h1>
                <p class="page-subtitle">Chúng tôi luôn sẵn sàng lắng nghe bạn. Hãy gửi thắc mắc cho chúng tôi.</p>
            </div>

            <div class="contact-card">
                <div class="contact-grid">
                    <div class="contact-info">
                        <h2 class="section-title">Thông tin liên hệ</h2>
                        <div class="info-item">
                            <div>
                                <h3 class="info-label">Địa chỉ</h3>
                                <p class="info-text">96 Định Công - Hoàng Mai - Hà Nội</p>
                            </div>
                        </div>
                         <div class="info-item">
                            <div>
                                <h3 class="info-label">Điện thoại</h3>
                                <p class="info-text">0966771508</p>
                            </div>
                        </div>
                         <div class="info-item">
                            <div>
                                <h3 class="info-label">Email</h3>
                                <p class="info-text">hoTroTechShop@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="contact-form-container">
                        <h2 class="section-title">Gửi phản hồi cho chúng tôi</h2>
                        <div class="contact-form">
                            <div class="form-group">
                                <label for="contact_name" class="form-label">Họ và tên</label>
                                <asp:TextBox ID="contact_name" runat="server" CssClass="form-input"></asp:TextBox>
                            </div>
                             <div class="form-group">
                                <label for="contact_email" class="form-label">Email</label>
                                <asp:TextBox ID="contact_email" runat="server" TextMode="Email" CssClass="form-input"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="contact_message" class="form-label">Nội dung</label>
                                <asp:TextBox ID="contact_message" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-textarea"></asp:TextBox>
                            </div>
                            <div class="form-actions">
                                 <asp:Button ID="btnSubmit" runat="server" Text="Gửi tin nhắn" CssClass="submit-button" OnClick="btnSubmit_Click" />
                                <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>
                            </div>
                        </div>
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
