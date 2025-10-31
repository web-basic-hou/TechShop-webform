<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManagesOrder.aspx.cs" Inherits="TechShop.AdminManagesOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Quản Lý Đơn Hàng - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <!-- CSS: dùng ResolveUrl để ~ hoạt động -->
  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminManagesOrder.css") %>" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="body-container">
      <!-- Sidebar -->
      <aside class="sidebar" role="navigation" aria-label="Main navigation">
        <div class="sidebar-header">
          <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
          </svg>
          <span class="sidebar-title">TechShop Admin</span>
        </div>

        <nav class="sidebar-nav">
          <a href="AdminDashboard.aspx" class="nav-item">Tổng quan</a>
          <a href="AdminProduct.aspx" class="nav-item">Sản phẩm</a>
          <a href="AdminManagesOrder.aspx" class="nav-item active">Đơn hàng</a>
          <a href="AdminCustomerManages.aspx" class="nav-item">Khách hàng</a>
        </nav>
      </aside>

      <!-- Main -->
      <div class="main-container">
        <header class="header">
          <div class="header-content">
            <!-- Hamburger (client-only) -->
            <button id="sidebarToggle" type="button" class="hamburger" aria-label="Mở menu" title="Mở menu">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M3 6h18M3 12h18M3 18h18" stroke-linecap="round" stroke-linejoin="round"></path>
              </svg>
            </button>

            <h1 class="header-title">Quản Lý Đơn Hàng</h1>
            <div class="user-info">
              <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
            </div>
          </div>
        </header>

        <main class="content-area">
          <div class="card">
            <div class="controls-bar">
              <div class="search-container" role="search" aria-label="Tìm kiếm đơn hàng">
                <input id="orderSearch" type="text" placeholder="Tìm kiếm mã đơn / khách hàng..." class="search-input" />
                <svg class="search-icon icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
              </div>
            </div>

            <div class="table-wrapper">
              <table class="data-table" role="table" aria-label="Danh sách đơn hàng">
                <thead class="table-head">
                  <tr>
                    <th scope="col">Mã đơn hàng</th>
                    <th scope="col">Khách hàng</th>
                    <th scope="col">Ngày đặt</th>
                    <th scope="col">Tổng tiền</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- TH: ví dụ tĩnh — production: render từ DB / Repeater -->
                  <tr class="table-row">
                    <th class="order-id" scope="row">#TECH1024</th>
                    <td class="customer-name">Bình An</td>
                    <td class="order-date">17/10/2025</td>
                    <td class="order-total">30.990.000₫</td>
                    <td><span class="status-badge status-green">Đã giao</span></td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th class="order-id" scope="row">#TECH1023</th>
                    <td class="customer-name">Minh Tuấn</td>
                    <td class="order-date">17/10/2025</td>
                    <td class="order-total">25.490.000₫</td>
                    <td><span class="status-badge status-yellow">Đang xử lý</span></td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th class="order-id" scope="row">#TECH1022</th>
                    <td class="customer-name">Lan Chi</td>
                    <td class="order-date">16/10/2025</td>
                    <td class="order-total">5.500.000₫</td>
                    <td><span class="status-badge status-red">Đã hủy</span></td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th class="order-id" scope="row">#TECH1021</th>
                    <td class="customer-name">Hoàng Nam</td>
                    <td class="order-date">15/10/2025</td>
                    <td class="order-total">18.990.000₫</td>
                    <td><span class="status-badge status-sky">Đang giao</span></td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <nav class="pagination-nav" aria-label="Table navigation">
              <span class="pagination-text">Hiển thị <span class="highlight">1-10</span> của <span class="highlight">50</span></span>
              <ul class="pagination-list" role="navigation" aria-label="Pagination">
                <li><a href="#" class="pagination-link pagination-link-prev">Trước</a></li>
                <li><a href="#" aria-current="page" class="pagination-link pagination-link-active">1</a></li>
                <li><a href="#" class="pagination-link">2</a></li>
                <li><a href="#" class="pagination-link pagination-link-next">Sau</a></li>
              </ul>
            </nav>
          </div>
        </main>
      </div>
    </div>
  </form>

  <!-- overlay để đóng sidebar trên mobile -->
  <div class="sidebar-overlay" aria-hidden="true"></div>

  <!-- JS -->
  <script src="<%= ResolveUrl("~/Scripts/adminManagesOrder.js") %>"></script>
</body>
</html>
