<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddProduct.aspx.cs" Inherits="TechShop.AdminAddProduct" %>
<%@ Import Namespace="TechShop.App_Code.Models" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Thêm sản phẩm - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminAddProduct.css") %>" />
</head>
<body>
  <form id="form1" runat="server" enctype="multipart/form-data">
    <div class="page">
      <aside class="sidebar" role="navigation" aria-label="Main navigation">
        <div class="sidebar-header">
          <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
          </svg>
          <span class="sidebar-title">TechShop Admin</span>
        </div>

        <nav class="sidebar-nav" aria-label="Primary">
          <a href="AdminDashboard.aspx" class="nav-item">Tổng quan</a>
          <a href="AdminProduct.aspx" class="nav-item active">Sản phẩm</a>
          <a href="AdminManagesOrder.aspx" class="nav-item">Đơn hàng</a>
          <a href="AdminCustomerManages.aspx" class="nav-item">Khách hàng</a>
        </nav>
      </aside>

      <main class="main">
        <header class="header">
          <h1>Thêm sản phẩm mới</h1>
        </header>

        <section class="content">
          <div class="card">
            <asp:Literal ID="litMessage" runat="server" EnableViewState="false"></asp:Literal>

            <div class="form-grid">
              <label for="txtName">Tên sản phẩm <span class="required">*</span></label>
              <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
              <asp:RequiredFieldValidator ID="valName" runat="server" ControlToValidate="txtName"
                  ErrorMessage="Tên sản phẩm bắt buộc" Display="Dynamic" CssClass="field-error" />

              <label for="fuImage">Ảnh (upload)</label>
              <asp:FileUpload ID="fuImage" runat="server" CssClass="input-file" />
              <small class="muted">Định dạng: jpg|png|webp — tối đa 5MB</small>

              <label for="txtValue">Giá (VND)</label>
              <asp:TextBox ID="txtValue" runat="server" CssClass="input" />

              <label for="txtColor">Màu</label>
              <asp:TextBox ID="txtColor" runat="server" CssClass="input" />

              <label for="txtCapacity">Dung lượng (GB)</label>
              <asp:TextBox ID="txtCapacity" runat="server" CssClass="input" />

              <label for="txtQuantity">Số lượng</label>
              <asp:TextBox ID="txtQuantity" runat="server" CssClass="input" />

              <label for="txtDescribe">Mô tả ngắn</label>
              <asp:TextBox ID="txtDescribe" runat="server" TextMode="MultiLine" Rows="4" CssClass="input textarea"></asp:TextBox>

              <label for="txtSpec">Thông số kỹ thuật</label>
              <asp:TextBox ID="txtSpec" runat="server" TextMode="MultiLine" Rows="6" CssClass="input textarea"></asp:TextBox>
            </div>

            <div class="preview-row">
              <div class="image-preview">
                <img id="imgPreview" alt="preview" src="<%= ResolveUrl("~/Images/placeholder.png") %>" />
                <p class="muted">Xem trước ảnh</p>
              </div>

              <div class="actions">
                <asp:Button ID="btnSave" runat="server" Text="Lưu sản phẩm" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Hủy" CssClass="btn btn-ghost" CausesValidation="false" />
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>

  </form>

  <script src="<%= ResolveUrl("~/Scripts/adminAddProduct.js") %>"></script>
</body>
</html>
