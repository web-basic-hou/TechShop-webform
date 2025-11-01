<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminOrderDetails.aspx.cs" Inherits="TechShop.AdminOrderDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Chi tiết đơn hàng - TechShop Admin</title>

  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminOrderDetails.css") %>" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="body-container">
      <!-- Sidebar -->
      <aside class="sidebar">
        <div class="sidebar-header">
          <span class="sidebar-title">TechShop Admin</span>
        </div>
        <nav class="sidebar-nav">
          <a href="AdminDashboard.aspx" class="nav-item">Tổng quan</a>
          <a href="AdminProduct.aspx" class="nav-item">Sản phẩm</a>
          <a href="AdminManagesOrder.aspx" class="nav-item active">Đơn hàng</a>
          <a href="AdminCustomerManages.aspx" class="nav-item">Khách hàng</a>
        </nav>
        <asp:Button ID="btnLogout" runat="server" Text="Đăng xuất" CssClass="logout-btn" OnClick="btnLogout_Click" />
      </aside>

      <!-- Main -->
      <div class="main-container">
        <header class="header">
          <h1 class="header-title">Chi tiết đơn hàng</h1>
        </header>

        <main class="content-area">
          <div class="card">
            <div class="card-actions">
              <asp:Button ID="btnBack" runat="server" Text="← Quay lại" CssClass="btn-back" OnClick="btnBack_Click" />
              <asp:Button ID="btnPrint" runat="server" Text="In đơn" CssClass="btn-print" OnClientClick="window.print(); return false;" />
            </div>

            <section class="order-summary">
              <h2>Đơn hàng: <asp:Literal ID="litOrderId" runat="server" /></h2>

              <div class="grid">
                <div><label>User ID:</label> <asp:Literal ID="litUserId" runat="server" /></div>
                <div><label>Ngày đặt:</label> <asp:Literal ID="litOrderDate" runat="server" /></div>
                <div><label>Số item:</label> <asp:Literal ID="litItemCount" runat="server" /></div>
                <div><label>Trạng thái (item):</label> <asp:Literal ID="litStatuses" runat="server" /></div>

                <div>
                  <label>Đổi trạng thái toàn bộ:</label>
                  <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select-status">
                    <asp:ListItem Value="CART">CART</asp:ListItem>
                    <asp:ListItem Value="DELIVERY">DELIVERY</asp:ListItem>
                    <asp:ListItem Value="RECEIVED">RECEIVED</asp:ListItem>
                  </asp:DropDownList>
                  <asp:Button ID="btnUpdateStatus" runat="server" Text="Cập nhật trạng thái" CssClass="btn-update" OnClick="btnUpdateStatus_Click" />
                </div>
              </div>
            </section>

            <section class="order-items">
              <h3>Danh sách sản phẩm trong đơn</h3>
              <asp:Repeater ID="rptItems" runat="server">
                <HeaderTemplate>
                  <table class="items-table">
                    <thead>
                      <tr>
                        <th>ProductId</th>
                        <th>Số lượng</th>
                        <th>Giá mua</th>
                        <th>Thành tiền</th>
                        <th>Status</th>
                        <th>CreatedAt</th>
                      </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                  <tr>
                    <td><%# Eval("productId") %></td>
                    <td class="center"><%# Eval("quantity") %></td>
                    <td class="right"><%# Eval("priceAtPurchase","{0:N0}") %> ₫</td>
                    <td class="right"><%# Eval("total","{0:N0}") %> ₫</td>
                    <td><%# Eval("Status") %></td>
                    <td><%# Eval("CreatedAt","{0:dd/MM/yyyy HH:mm}") %></td>
                  </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                  </table>
                </FooterTemplate>
              </asp:Repeater>
            </section>

            <section class="order-totals">
              <div class="totals-row">Tạm tính: <asp:Literal ID="litSubtotal" runat="server" /></div>
              <div class="totals-row">Phí ship: <asp:Literal ID="litShipping" runat="server" Text="0 ₫" /></div>
              <div class="totals-row total">Tổng cộng: <asp:Literal ID="litTotal" runat="server" /></div>
            </section>

          </div>
        </main>
      </div>
    </div>
  </form>
</body>
</html>
