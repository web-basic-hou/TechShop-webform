<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCustomerManages.aspx.cs" Inherits="TechShop.AdminCustomerManages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Quản Lý Khách Hàng - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <!-- CSS -->
  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminCustomerManages.css") %>" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="body-container">
      <!-- SIDEBAR -->
      <aside class="sidebar" role="navigation" aria-label="Main navigation">
        <div class="sidebar-header">
          <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
          </svg>
          <span class="sidebar-title">TechShop Admin</span>
        </div>

        <nav class="sidebar-nav" aria-label="Primary">
          <a href="AdminDashboard.aspx" class="nav-item">Tổng quan</a>
          <a href="AdminProduct.aspx" class="nav-item">Sản phẩm</a>
          <a href="AdminManagesOrder.aspx" class="nav-item">Đơn hàng</a>
          <a href="AdminCustomerManages.aspx" class="nav-item active">Khách hàng</a>
            <asp:Button 
                ID="btnLogout" 
                runat="server" 
                Text="Đăng xuất" 
                CssClass="logout-btn" 
                OnClick="btnLogout_Click" 
            />
        </nav>
      </aside>

      <!-- MAIN -->
      <div class="main-container">
        <header class="header">
          <div class="header-content">
            <button id="sidebarToggle" type="button" class="hamburger" aria-label="Mở menu" title="Mở menu">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path d="M3 6h18M3 12h18M3 18h18" stroke-linecap="round" stroke-linejoin="round"></path>
              </svg>
            </button>

            <h1 class="header-title">Quản Lý Khách Hàng</h1>
            <div class="user-info">
              <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
            </div>
          </div>
        </header>

        <main class="content-area">
          <div class="card">
            <div class="search-bar">
              <div class="search-container" role="search" aria-label="Tìm kiếm khách hàng">
                <input id="customerSearch" type="text" placeholder="Tìm tên, email hoặc số điện thoại..." class="search-input" />
                <svg class="search-icon icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
              </div>
            </div>

            <div class="table-wrapper">
              <table class="data-table" role="table" aria-label="Danh sách khách hàng">
                <thead class="table-head">
                  <tr>
                    <th scope="col">Tên khách hàng</th>
                    <th scope="col">Email</th>
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Ngày đăng ký</th>
                    <th scope="col">Tổng chi tiêu</th>
                    <th scope="col">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- static demo rows — replace with Repeater/GridView in production -->
                  <tr class="table-row">
                    <th scope="row" class="customer-info">
                      <img class="customer-avatar" src="https://placehold.co/100x100/dbeafe/1e40af?text=BA" alt="BA" />
                      <span class="customer-name">Bình An</span>
                    </th>
                    <td class="customer-email">binhan@example.com</td>
                    <td class="customer-phone">090xxxx123</td>
                    <td class="customer-joined">17/10/2025</td>
                    <td class="total-spent">30.990.000₫</td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th scope="row" class="customer-info">
                      <img class="customer-avatar" src="https://placehold.co/100x100/d1fae5/065f46?text=MT" alt="MT" />
                      <span class="customer-name">Minh Tuấn</span>
                    </th>
                    <td class="customer-email">minhtuan@example.com</td>
                    <td class="customer-phone">091xxxx456</td>
                    <td class="customer-joined">17/10/2025</td>
                    <td class="total-spent">25.490.000₫</td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th scope="row" class="customer-info">
                      <img class="customer-avatar" src="https://placehold.co/100x100/fee2e2/991b1b?text=LC" alt="LC" />
                      <span class="customer-name">Lan Chi</span>
                    </th>
                    <td class="customer-email">lanchi@example.com</td>
                    <td class="customer-phone">098xxxx789</td>
                    <td class="customer-joined">16/10/2025</td>
                    <td class="total-spent">5.500.000₫</td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>

                  <tr class="table-row">
                    <th scope="row" class="customer-info">
                      <img class="customer-avatar" src="https://placehold.co/100x100/ffedd5/9a3412?text=HN" alt="HN" />
                      <span class="customer-name">Hoàng Nam</span>
                    </th>
                    <td class="customer-email">hoangnam@example.com</td>
                    <td class="customer-phone">093xxxx111</td>
                    <td class="customer-joined">15/10/2025</td>
                    <td class="total-spent">18.990.000₫</td>
                    <td><a href="#" class="action-link view-detail">Xem chi tiết</a></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <nav class="pagination-nav" aria-label="Table navigation">
              <span class="pagination-text">Hiển thị <span class="highlight">1-10</span> của <span class="highlight">250</span></span>
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

  <!-- overlay -->
  <div class="sidebar-overlay" aria-hidden="true"></div>

  <!-- JS -->
  <script src="<%= ResolveUrl("~/Scripts/adminCustomerManages.js") %>"></script>
</body>
</html>
