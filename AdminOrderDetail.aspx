<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrderDetail.aspx.cs" Inherits="TechShop.AdminOrderDetail" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Chi tiết đơn hàng - TechShop Admin</title>

  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminOrderDetail.css") %>" />
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
            <button id="sidebarToggle" type="button" class="hamburger" aria-label="Mở menu" title="Mở menu">
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M3 6h18M3 12h18M3 18h18" stroke-linecap="round" stroke-linejoin="round"></path>
              </svg>
            </button>

            <h1 class="header-title">Chi tiết đơn hàng</h1>
            <div class="user-info">
              <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
            </div>
          </div>
        </header>

        <main class="content-area">
          <div class="card order-header">
            <div class="order-meta">
              <div class="order-id-row">
                <h2>Mã đơn: <asp:Literal ID="litOrderId" runat="server" Text="#TECH1024" /></h2>
                <button type="button" id="btnCopyId" class="btn small">Sao chép</button>
                <asp:Button ID="btnBack" runat="server" Text="Quay lại" CssClass="btn ghost" />
                <button type="button" id="btnPrint" class="btn outline">In đơn</button>
              </div>

              <div class="order-info-grid">
                <div><span class="label">Khách hàng</span><div class="value"><asp:Literal ID="litCustomerName" runat="server" Text="Bình An" /></div></div>
                <div><span class="label">SĐT / Email</span><div class="value"><asp:Literal ID="litCustomerContact" runat="server" Text="090xxxx123 / binhan@example.com" /></div></div>
                <div><span class="label">Ngày đặt</span><div class="value"><asp:Literal ID="litOrderDate" runat="server" Text="17/10/2025" /></div></div>
                <div><span class="label">Trạng thái</span><div class="value"><asp:Literal ID="litStatus" runat="server" Text="<span class='status-badge status-green'>Đã giao</span>" /></div></div>
              </div>
            </div>
          </div>

          <div class="card order-items">
            <h3>Chi tiết sản phẩm</h3>
            <div class="table-wrapper">
              <table class="data-table">
                <thead>
                  <tr>
                    <th>Hình</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- Repeater để bind danh sách item -->
                  <asp:Repeater ID="rptItems" runat="server">
                    <ItemTemplate>
                      <tr class="table-row">
                        <td><img src='<%# Eval("ImageUrl") %>' class="product-thumb" alt="img" /></td>
                        <td class="product-name"><%# Eval("ProductName") %></td>
                        <td class="product-price"><%# Eval("Price") %></td>
                        <td class="product-qty"><%# Eval("Quantity") %></td>
                        <td class="product-subtotal"><%# Eval("Subtotal") %></td>
                      </tr>
                    </ItemTemplate>
                  </asp:Repeater>
                </tbody>
              </table>
            </div>

            <div class="order-summary">
              <div class="summary-row"><span>Tạm tính</span><span><asp:Literal ID="litSubtotal" runat="server" Text="30.000.000₫" /></span></div>
              <div class="summary-row"><span>Phí vận chuyển</span><span><asp:Literal ID="litShipping" runat="server" Text="0₫" /></span></div>
              <div class="summary-row total"><span>Tổng cộng</span><span><asp:Literal ID="litTotal" runat="server" Text="30.990.000₫" /></span></div>
            </div>
          </div>

          <div class="card order-notes">
            <h3>Ghi chú / Địa chỉ giao hàng</h3>
            <p class="note"><asp:Literal ID="litAddress" runat="server" Text="Số 1, Đường A, Quận B, TP. HCM" /></p>
          </div>

          <div class="card order-actions">
            <asp:Button ID="btnChangeStatus" runat="server" Text="Cập nhật trạng thái" CssClass="btn primary" />
            <asp:Button ID="btnCancelOrder" runat="server" Text="Hủy đơn" CssClass="btn danger" />
          </div>
        </main>
      </div>
    </div>
  </form>

  <div class="sidebar-overlay" aria-hidden="true"></div>

  <script src="<%= ResolveUrl("~/Scripts/adminOrderDetail.js") %>"></script>
</body>
</html>
