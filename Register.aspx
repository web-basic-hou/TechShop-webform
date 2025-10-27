<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TechShop.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/Register.css">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <div class="card">
                
                <div class="card-header">
                    <a href="Default.aspx" class="logo"> <%-- Chuyển hướng về trang chủ Default.aspx --%>
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <h1 class="title">Tạo tài khoản mới</h1>
                    <p class="subtitle">Chào mừng bạn! Vui lòng điền thông tin để bắt đầu.</p>
                </div>

                <div class="form">
                    <div class="form-group">
                        <asp:Label ID="lblFullName" runat="server" For="txtFullName" CssClass="form-label">Họ và Tên</asp:Label>
                        <asp:TextBox ID="txtFullName" runat="server" required CssClass="form-input" placeholder="Nguyễn Văn A"></asp:TextBox>
                        <asp:Label ID="lblErrorFullName" runat="server" CssClass="error"/>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="form-label">Địa chỉ Email</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" autocomplete="email" required CssClass="form-input" placeholder="email@example.com"></asp:TextBox>
                        <asp:Label ID="lblErrorEmail" runat="server" CssClass="error"/>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="form-label">Mật khẩu</asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password" required CssClass="form-input" placeholder="••••••••"></asp:TextBox>
                        <asp:Label ID="lblErrorPassword" runat="server" CssClass="error"/>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblConfirmPassword" runat="server" For="txtConfirmPassword" CssClass="form-label">Xác nhận mật khẩu</asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="new-password" required CssClass="form-input" placeholder="••••••••"></asp:TextBox>
                        <asp:Label ID="lblErrorConfirmPassword" runat="server" CssClass="error"/>
                    </div>

                    <div>
                        <asp:Button ID="btnRegister" runat="server" Text="Đăng Ký" CssClass="submit-button" onClick="Register_click"/>
                    </div>
                </div>

                <p class="bottom-link">
                    Đã có tài khoản?
                    <a href="Login.aspx" class="link">
                        Đăng nhập ngay
                    </a>
                </p>
            </div>
        </div>
    </form>
</body>
</html>
