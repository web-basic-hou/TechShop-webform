<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TechShop.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/Login.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="login-card">
                
                <div class="card-header">
                    <a href="Default.aspx" class="logo"> <%-- Chuyển hướng về trang chủ Default.aspx --%>
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <h1 class="title">Đăng nhập tài khoản</h1>
                    <p class="subtitle">Chào mừng bạn trở lại!</p>
                </div>

                <div class="login-form">
                    <div class="form-group">
                        <%-- Đã chuyển thành asp:Label --%>
                        <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="form-label">Địa chỉ Email</asp:Label>
                        <%-- Đã chuyển thành asp:TextBox --%>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" autocomplete="email" required CssClass="form-input" placeholder="email@example.com"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <div class="label-row">
                            <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="form-label">Mật khẩu</asp:Label>
                            <a href="#" class="link">Quên mật khẩu?</a>
                        </div>
                        <%-- Đã chuyển thành asp:TextBox với TextMode="Password" --%>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="current-password" required CssClass="form-input" placeholder="••••••••"></asp:TextBox>
                    </div>

                    <div>
                        <%-- Đã chuyển thành asp:Button --%>
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" CssClass="submit-button" />
                    </div>
                </div>

                <p class="signup-link">
                    Chưa có tài khoản?
                    <%-- Liên kết đã được cập nhật sang trang .aspx --%>
                    <a href="Register.aspx" class="link">
                        Tạo tài khoản mới
                    </a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
