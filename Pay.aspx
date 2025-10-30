<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="TechShop.Pay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thanh Toán - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/Pay.css">
    <style>
        .total-text {
            display:block;
            margin: 1rem 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="container">
                <div class="header-content">
                    <a href="Home.aspx" class="logo">
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <div class="support-info">
                        <span>Cần hỗ trợ? <span class="phone-number">0966771508</span></span>
                    </div>
                </div>
            </div>
        </header>

        <main class="container page-content">
            <div class="checkout-container">
                <div class="page-header">
                    <h1 class="page-title">Thanh Toán</h1>
                    <p class="page-subtitle">Vui lòng kiểm tra thông tin trước khi hoàn tất đơn hàng.</p>
                </div>

                <div class="checkout-form">
                    <div class="card">
                        <div class="form-section">
                            <h2 class="section-title">1. Thông tin giao hàng</h2>
                            <div class="form-group-wrapper">
                                <div class="form-group">
                                    <label for="fullname" class="form-label">Họ và tên</label>
                                    <asp:TextBox ID="fullname" runat="server" CssClass="form-input" placeholder="Nguyễn Văn A"></asp:TextBox>
                                </div>
                                <div class="grid-container">
                                    <div class="form-group">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <asp:TextBox ID="phone" runat="server" TextMode="Phone" CssClass="form-input" placeholder="09xxxxxxxx"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="form-label">Email</label>
                                        <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="form-input" placeholder="email@example.com"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="form-label">Địa chỉ nhận hàng</label>
                                    <asp:TextBox ID="address" runat="server" CssClass="form-input" placeholder="Số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="notes" class="form-label">Ghi chú (tùy chọn)</label>
                                    <asp:TextBox ID="notes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-textarea" placeholder="Ví dụ: Giao hàng trong giờ hành chính"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-section">
                            <h2 class="section-title">2. Phương thức thanh toán</h2>
                            <div class="payment-options">
                                <label class="payment-option">
                                    <asp:RadioButton ID="rbCod" runat="server" GroupName="payment_method" CssClass="radio-input" Checked="true" />
                                    <span class="option-label">Thanh toán khi nhận hàng (COD)</span>
                                </label>
                                <label class="payment-option">
                                    <asp:RadioButton ID="rbBankTransfer" runat="server" GroupName="payment_method" CssClass="radio-input" />
                                    <span class="option-label">Chuyển khoản ngân hàng</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="card">
                        <h2 class="section-title">3. Xem lại đơn hàng</h2>

                        <asp:Literal ID="orderItemsLiteral" runat="server"></asp:Literal>

                        <asp:Label ID="lblTotal" runat="server" Text="0₫" CssClass="total-text"></asp:Label>

                        <asp:Button ID="Button1" runat="server" Text="Hoàn tất Đặt Hàng" CssClass="submit-button" OnClick="btnSubmitOrder_Click" />
                    </div>

                    <div class="submit-button-container">
                        <asp:Button ID="btnSubmitOrder" runat="server" Text="Huỷ đặt hàng" CssClass="submit-button" OnClick="cancel" />
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
