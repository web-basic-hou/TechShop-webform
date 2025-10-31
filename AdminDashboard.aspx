<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TechShop.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Dashboard - TechShop Admin</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="<%= ResolveUrl("~/Styles/AdminDashboard.css") %>" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="body-container">
            <aside class="sidebar" role="navigation" aria-label="Main navigation">
                <div class="sidebar-header">
                    <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                    </svg>
                    <span class="sidebar-title">TechShop Admin</span>
                </div>
                <nav class="sidebar-nav">
                    <a href="AdminDashboard.aspx" class="nav-item active"><span>Tổng quan</span></a>
                    <a href="AdminProduct.aspx" class="nav-item"><span>Sản phẩm</span></a>
                    <a href="AdminManagesOrder.aspx" class="nav-item"><span>Đơn hàng</span></a>
                    <a href="AdminCustomerManages.aspx" class="nav-item"><span>Khách hàng</span></a>
                    <asp:Button 
                        ID="btnLogout" 
                        runat="server" 
                        Text="Đăng xuất" 
                        CssClass="logout-btn" 
                        OnClick="btnLogout_Click" 
                    />
                </nav>
            </aside>

            <div class="main-container">
                <header class="header">
                    <div class="header-content">
                        <!-- Hamburger toggle (client-side only) -->
                        <button id="sidebarToggle" type="button" class="hamburger" aria-label="Mở menu" title="Mở menu">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M3 6h18M3 12h18M3 18h18" stroke-linecap="round" stroke-linejoin="round"></path>
                            </svg>
                        </button>

                        <h1 class="header-title">Tổng quan</h1>
                        <div class="user-info">
                            <span class="welcome-text">Xin chào, <asp:Literal ID="litAdminName" runat="server" Text="Admin" /></span>
                        </div>
                    </div>
                </header>

                <main class="content-area">
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div>
                                <p class="stat-label">Tổng doanh thu</p>
                                <p class="stat-value"><asp:Literal ID="litTotalRevenue" runat="server" /></p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <p class="stat-label">Đơn hàng</p>
                                <p class="stat-value"><asp:Literal ID="litTotalOrders" runat="server" /></p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <p class="stat-label">Khách hàng</p>
                                <p class="stat-value"><asp:Literal ID="litTotalCustomers" runat="server" /></p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <p class="stat-label">Loại sản phẩm</p>
                                <p class="stat-value"><asp:Literal ID="litTotalProducts" runat="server" /></p>
                            </div>
                        </div>
                    </div>

                    <div class="recent-orders">
                        <h2 class="table-title">Đơn hàng gần đây</h2>
                        <div class="table-container">
                            <table class="data-table" role="table" aria-label="Recent orders">
                                <thead class="table-head">
                                    <tr>
                                        <th scope="col">Mã đơn hàng</th>
                                        <th scope="col">Khách hàng</th>
                                        <th scope="col">Ngày đặt</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th scope="col">Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Literal ID="litRecentOrders" runat="server" />
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </form>

    <!-- overlay để đóng sidebar trên mobile -->
    <div class="sidebar-overlay" aria-hidden="true"></div>

    <!-- script -->
    <script src="<%= ResolveUrl("~/Scripts/adminDashboard.js") %>"></script>
</body>
</html>
