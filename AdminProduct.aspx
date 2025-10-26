<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="TechShop.AdminProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quản Lý Sản Phẩm - TechShop Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="./Styles/AdminProduct.css">
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
                     <a href="AdminProduct.aspx" class="nav-item active">
                        <span>Sản phẩm</span>
                    </a>
                    <a href="AdminManagesOrder.aspx" class="nav-item">
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
                        <h1 class="header-title">Quản Lý Sản Phẩm</h1>
                        <div class="user-info">
                            <span class="welcome-text">Xin chào, Admin!</span>
                        </div>
                    </div>
                </header>

                <main class="content-area">
                    <div class="card">
                        <div class="controls-bar">
                            <div class="search-container">
                                <input type="text" placeholder="Tìm kiếm sản phẩm..." class="search-input">
                                <svg class="search-icon icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                            </div>
                            <asp:Button ID="btnAddProduct" runat="server" Text="Thêm sản phẩm" CssClass="add-button" />
                        </div>

                        <div class="table-wrapper">
                            <table class="data-table">
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
                                    <tr class="table-row">
                                        <td>
                                            <img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="Product Image">
                                        </td>
                                        <th scope="row" class="product-name">iPhone 15 Pro Max 256GB</th>
                                        <td class="product-price">30.990.000₫</td>
                                        <td>120</td>
                                        <td>
                                            <span class="status-badge status-green">Đang bán</span>
                                        </td>
                                        <td class="actions-cell">
                                            <div class="actions-group">
                                                <a href="#" class="action-link action-edit">Sửa</a>
                                                <a href="#" class="action-link action-delete">Xóa</a>
                                            </div>
                                        </td>
                                    </tr>
                                     <tr class="table-row">
                                        <td>
                                            <img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="Product Image">
                                        </td>
                                        <th scope="row" class="product-name">Samsung Galaxy S23 Ultra</th>
                                        <td class="product-price">25.490.000₫</td>
                                        <td>85</td>
                                        <td>
                                            <span class="status-badge status-green">Đang bán</span>
                                        </td>
                                        <td class="actions-cell">
                                            <div class="actions-group">
                                                <a href="#" class="action-link action-edit">Sửa</a>
                                                <a href="#" class="action-link action-delete">Xóa</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="table-row">
                                        <td>
                                            <img src="https://placehold.co/80x80/e2e8f0/334155?text=SP" class="product-image" alt="Product Image">
                                        </td>
                                        <th scope="row" class="product-name">Xiaomi 13T Pro 5G</th>
                                        <td class="product-price">15.990.000₫</td>
                                        <td>200</td>
                                        <td>
                                            <span class="status-badge status-slate">Ẩn</span>
                                        </td>
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
                            <ul class="pagination-list">
                                <li>
                                    <a href="#" class="pagination-link pagination-link-prev">Trước</a>
                                </li>
                                <li>
                                    <a href="#" class="pagination-link">1</a>
                                </li>
                                <li>
                                    <a href="#" aria-current="page" class="pagination-link pagination-link-active">2</a>
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
