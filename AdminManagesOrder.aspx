<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManagesOrder.aspx.cs" Inherits="TechShop.AdminManagesOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản Lý Đơn Hàng - TechShop Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <%-- Liên kết đến file CSS bên ngoài của bạn --%>
    <link rel="stylesheet" href="~/Styles/AdminManagesOrder.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="body-container">
            <aside class="sidebar">
                <div class="sidebar-header">
                    <svg xmlns="http://www.w3.org/2000/svg" class="sidebar-logo-icon icon" viewBox="0 0 24 24">
                        <path d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                    </svg>
                    <span class="sidebar-title">TechShop Admin</span>
                </div>
                <nav class="sidebar-nav">
                    <a href="AdminDashboard.aspx" class="nav-item">
                         <span>Tổng quan</span>
                    </a>
                     <a href="AdminProduct.aspx" class="nav-item">
                        <span>Sản phẩm</span>
                    </a>
                    <a href="AdminManagesOrder.aspx" class="nav-item active">
                        <span>Đơn hàng</span>
                    </a>
                    <a href="AdminCustomerManages.aspx" class="nav-item">
                        <span>Khách hàng</span>
                    </a>
                </nav>
            </aside>

            <div class="main-container">
                <header class="header">
                    <div class="header-content">
                        <h1 class="header-title">Quản Lý Đơn Hàng</h1>
                        <div class="user-info">
                            <span class="welcome-text">Xin chào, Admin!</span>
                        </div>
                    </div>
                </header>

                <main class="content-area">
                    <div class="card">
                        <div class="controls-bar">
                            <div class="search-container">
                                <input type="text" placeholder="Tìm kiếm đơn hàng..." class="search-input">
                                <svg class="search-icon icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                            </div>
                        </div>

                        <div class="table-wrapper">
                            <table class="data-table">
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
                                    <tr class="table-row">
                                        <th scope="row" class="order-id">#TECH1024</th>
                                        <td class="customer-name">Bình An</td>
                                        <td>17/10/2025</td>
                                        <td class="order-total">30.990.000₫</td>
                                        <td>
                                            <span class="status-badge status-green">Đã giao</span>
                                        </td>
                                        <td>
                                            <a href="#" class="action-link">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                     <tr class="table-row">
                                        <th scope="row" class="order-id">#TECH1023</th>
                                        <td class="customer-name">Minh Tuấn</td>
                                        <td>17/10/2025</td>
                                        <td class="order-total">25.490.000₫</td>
                                        <td>
                                             <span class="status-badge status-yellow">Đang xử lý</span>
                                        </td>
                                        <td>
                                            <a href="#" class="action-link">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                    <tr class="table-row">
                                        <th scope="row" class="order-id">#TECH1022</th>
                                        <td class="customer-name">Lan Chi</td>
                                        <td>16/10/2025</td>
                                        <td class="order-total">5.500.000₫</td>
                                        <td>
                                            <span class="status-badge status-red">Đã hủy</span>
                                        </td>
                                        <td>
                                            <a href="#" class="action-link">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                     <tr class="table-row">
                                        <th scope="row" class="order-id">#TECH1021</th>
                                        <td class="customer-name">Hoàng Nam</td>
                                        <td>15/10/2025</td>
                                        <td class="order-total">18.990.000₫</td>
                                        <td>
                                            <span class="status-badge status-sky">Đang giao</span>
                                        </td>
                                        <td>
                                            <a href="#" class="action-link">Xem chi tiết</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <nav class="pagination-nav" aria-label="Table navigation">
                            <span class="pagination-text">Hiển thị <span class="highlight">1-10</span> của <span class="highlight">50</span></span>
                            <ul class="pagination-list">
                                <li>
                                    <a href="#" class="pagination-link pagination-link-prev">Trước</a>
                                </li>
                                <li>
                                    <a href="#" aria-current="page" class="pagination-link pagination-link-active">1</a>
                                </li>
                                 <li>
                                    <a href="#" class="pagination-link">2</a>
                                </li>
                                <li>
                                   <a href="#" class="pagination-link pagination-link-next">Sau</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </main>
            </div>
        </div>
    </form>
</body>
</html>
