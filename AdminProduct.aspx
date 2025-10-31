<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="TechShop.AdminProduct" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Quản Lý Sản Phẩm - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <!-- CSS -->
  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminProduct.css") %>" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="body_container">
      <!-- SIDEBAR -->
      <aside class="sidebar" role="navigation" aria-label="Main navigation">
        <div class="sidebar-header">
          <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
          </svg>
          <span class="sidebar-title">TechShop Admin</span>
        </div>

        <nav class="sidebar-nav">
          <a href="AdminDashboard.aspx" class="nav-item">Tổng quan</a>
          <a href="AdminProduct.aspx" class="nav-item active">Sản phẩm</a>
          <a href="AdminManagesOrder.aspx" class="nav-item">Đơn hàng</a>
          <a href="AdminCustomerManages.aspx" class="nav-item">Khách hàng</a>
        </nav>
      </aside>

      <!-- MAIN -->
      <div class="main-container">
        <header class="header">
          <div class="header-content">
            <!-- Hamburger: client-only button để mở sidebar trên mobile -->
            <button id="sidebarToggle" type="button" class="hamburger" aria-label="Mở menu" title="Mở menu">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M3 6h18M3 12h18M3 18h18" stroke-linecap="round" stroke-linejoin="round"></path>
              </svg>
            </button>

            <h1 class="header-title">Quản Lý Sản Phẩm</h1>
            <div class="user-info">
              <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
            </div>
          </div>
        </header>

        <main class="content-area">
          <div class="card">
            <div class="controls-bar">
              <div class="search-container" role="search" aria-label="Tìm kiếm sản phẩm">
                <input id="searchInput" type="text" placeholder="Tìm kiếm sản phẩm..." class="search-input" />
                <svg class="search-icon icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
              </div>

              <!-- Server-side button: postback handled in code-behind -->
              <asp:Button ID="btnAddProduct" runat="server" Text="Thêm sản phẩm" CssClass="add-button" OnClick="btnAddProduct_Click" />
            </div>

            <div class="table-wrapper">
              <table class="data-table" role="table" aria-label="Danh sách sản phẩm">
                <thead class="table-head">
                  <tr>
                    <th scope="col">Hình ảnh</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Tồn kho</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Ví dụ dữ liệu tĩnh, bạn sẽ render từ DB thực tế -->
                  <tr class="table-row">
                    <td><img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="SP" /></td>
                    <th scope="row" class="product-name">iPhone 15 Pro Max 256GB</th>
                    <td class="product-price">30.990.000₫</td>
                    <td>120</td>
                    <td><span class="status-badge status-green">Đang bán</span></td>
                    <td class="actions-cell">
                      <div class="actions-group">
                        <a href="#" class="action-link action-edit">Sửa</a>
                        <a href="#" class="action-link action-delete">Xóa</a>
                      </div>
                    </td>
                  </tr>

                  <tr class="table-row">
                    <td><img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="SP" /></td>
                    <th scope="row" class="product-name">Samsung Galaxy S23 Ultra</th>
                    <td class="product-price">25.490.000₫</td>
                    <td>85</td>
                    <td><span class="status-badge status-green">Đang bán</span></td>
                    <td class="actions-cell">
                      <div class="actions-group">
                        <a href="#" class="action-link action-edit">Sửa</a>
                        <a href="#" class="action-link action-delete">Xóa</a>
                      </div>
                    </td>
                  </tr>

                  <tr class="table-row">
                    <td><img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="SP" /></td>
                    <th scope="row" class="product-name">Xiaomi 13T Pro 5G</th>
                    <td class="product-price">15.990.000₫</td>
                    <td>200</td>
                    <td><span class="status-badge status-slate">Ẩn</span></td>
                    <td class="actions-cell">
                      <div class="actions-group">
                        <a href="#" class="action-link action-edit">Sửa</a>
                        <a href="#" class="action-link action-delete">Xóa</a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>

            <nav class="pagination-nav" aria-label="Table navigation">
              <span class="pagination-text">Hiển thị <span class="highlight">1-10</span> của <span class="highlight">100</span></span>
              <ul class="pagination-list" role="navigation" aria-label="Pagination">
                <li><a href="#" class="pagination-link pagination-link-prev">Trước</a></li>
                <li><a href="#" class="pagination-link">1</a></li>
                <li><a href="#" aria-current="page" class="pagination-link pagination-link-active">2</a></li>
                <li><a href="#" class="pagination-link pagination-link-next">Sau</a></li>
              </ul>
            </nav>
          </div>
        </main>
      </div>
    </div>
  </form>

  <!-- Overlay to close sidebar on mobile -->
  <div class="sidebar-overlay" aria-hidden="true"></div>

  <!-- JS -->
  <script src="<%= ResolveUrl("~/Scripts/adminProduct.js") %>"></script>
</body>
</html>
