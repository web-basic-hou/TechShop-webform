<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProduct.aspx.cs" Inherits="TechShop.UserProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lịch Sử Đơn Hàng - TechShop</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="~/Styles/UserProduct.css">
    
    <style>
        .tabs {
            display: flex;
            gap: 1rem;
            border-bottom: 1px solid var(--color-slate-200);
            margin-bottom: 1.5rem;
        }
        .tab-item {
            padding: 0.5rem 1rem;
            border-bottom: 2px solid transparent;
            cursor: pointer;
            font-weight: 500;
            color: var(--color-slate-500);
        }
        .tab-item:hover {
            color: var(--color-blue-600);
        }
        .tab-item.active {
            color: var(--color-blue-600);
            border-bottom-color: var(--color-blue-600);
        }
        .order-card {
            background-color: var(--color-white);
            border: 1px solid var(--color-slate-200);
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            transition: box-shadow 0.2s;
        }
        .order-card:hover {
             box-shadow: var(--shadow-md);
        }
        .order-header {
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--color-slate-200);
            background-color: var(--color-slate-50);
        }
        .order-id {
            font-weight: 600;
            color: var(--color-slate-800);
        }
        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 500;
            text-transform: uppercase;
        }
        .status-delivered {
            background-color: #dcfce7; /* green-100 */
            color: #166534; /* green-800 */
        }
        .status-shipping {
            background-color: #dbeafe; /* blue-100 */
            color: #1e40af; /* blue-800 */
        }
        .status-cancelled {
            background-color: #fee2e2; /* red-100 */
            color: #991b1b; /* red-800 */
        }
        .order-body {
            padding: 1.5rem;
        }
        .product-item {
            display: flex;
            gap: 1rem;
            padding-bottom: 1rem;
            margin-bottom: 1rem;
        }
        .product-item:not(:last-child) {
             border-bottom: 1px dashed var(--color-slate-200);
        }
        .product-image {
            width: 5rem;
            height: 5rem;
            object-fit: cover;
            border-radius: 0.5rem;
        }
        .product-details {
            flex: 1;
        }
        .product-name {
            font-weight: 600;
        }
        .product-info {
            font-size: 0.875rem;
            color: var(--color-slate-500);
        }
        .order-footer {
            padding: 1rem 1.5rem;
            text-align: right;
            border-top: 1px solid var(--color-slate-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-total {
            font-size: 1.125rem;
        }
        .order-total span {
             font-weight: 700;
             color: var(--color-red-500);
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <header class="header">
            <div class="container">
                <div class="header-content">
                    <a href="Home.aspx" class="logo-link">
                        <svg xmlns="http://www.w3.org/2000/svg" class="logo-icon" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                        <span class="logo-text">TechShop</span>
                    </a>
                    <nav class="nav-menu">
                        <a href="Home.aspx" class="nav-link">Trang Chủ</a>
                        <a href="Products.aspx" class="nav-link">Sản Phẩm</a>
                        <a href="Contact.aspx" class="nav-link">Liên Hệ</a>
                    </nav>
                    <div class="header-icons">
                        <a href="Cart.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon-svg" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                            <span class="icon-badge">3</span>
                        </a>
                        <a href="User.aspx" class="icon-link">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon-svg" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <main class="container main-content">
            <div class="breadcrumbs">
                <nav class="breadcrumbs-nav">
                    <ol class="breadcrumbs-list">
                        <li class="breadcrumb-item">
                            <a href="Home.aspx" class="breadcrumb-link">Trang chủ</a>
                            <svg xmlns="http://www.w3.org/2000/svg" class="breadcrumb-separator" viewBox="0 0 20 20"><path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"/></svg>
                        </li>
                        <li class="breadcrumb-item">
                            <span class="breadcrumb-current">Lịch sử đơn hàng</span>
                        </li>
                    </ol>
                </nav>
            </div>

            <div class="content-layout">
                <aside class="sidebar-aside">
                    <div class="sidebar-card">
                        <div class="user-profile">
                            <img class="user-avatar" src="https://placehold.co/100x100/e0e7ff/4338ca?text=A" alt="Avatar">
                            <div>
                                <p class="user-name">Anh Nguyễn</p>
                                <p class="user-email">anh.nguyen@email.com</p>
                            </div>
                        </div>
                        <nav class="sidebar-nav">
                            <a href="User.aspx" class="sidebar-nav-item">
                                <span class="nav-item-text">Thông tin tài khoản</span>
                            </a>
                            <a href="UserProduct.aspx" class="sidebar-nav-item active">
                                <span class="nav-item-text">Lịch sử đơn hàng</span>
                            </a>
                            <a href="Login.aspx" class="sidebar-nav-item logout">
                                <span class="nav-item-text">Đăng xuất</span>
                            </a>
                        </nav>
                    </div>
                </aside>

                <div class="main-form-content">
                    <div class="form-card">
                        <h2 class="section-title">Lịch sử đơn hàng</h2>
                        
                        <div>
                            <div class="order-card">
                                <div class="order-header">
                                    <span class="order-id">Mã đơn hàng: #TECH12345</span>
                                    <span class="status-badge status-shipping">Đang giao</span>
                                </div>
                                <div class="order-body">
                                    <div class="product-item">
                                        <img src="./assets/images/cucGach.png" alt="Product" class="product-image">
                                        <div class="product-details">
                                            <p class="product-name">iPhone 15 Pro Max 256GB</p>
                                            <p class="product-info">Số lượng: 1</p>
                                        </div>
                                    </div>
                                     <div class="product-item">
                                        <img src="./assets/images/cucGach2.png" alt="Product" class="product-image">
                                        <div class="product-details">
                                            <p class="product-name">Samsung Galaxy S23 Ultra</p>
                                            <p class="product-info">Số lượng: 1</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-footer">
                                     <p class="order-total">Tổng tiền: <span>49.980.000₫</span></p>
                                     <a href="#" class="button button-primary">Xem chi tiết</a>
                                </div>
                            </div>

                             <div class="order-card">
                                <div class="order-header">
                                    <span class="order-id">Mã đơn hàng: #TECH67890</span>
                                    <span class="status-badge status-delivered">Đã giao</span>
                                </div>
                                 <div class="order-body">
                                    <div class="product-item">
                                        <img src="./assets/images/cucGachReal.png" alt="Product" class="product-image">
                                        <div class="product-details">
                                            <p class="product-name">Apple Watch Series 9</p>
                                            <p class="product-info">Số lượng: 1</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-footer">
                                    <p class="order-total">Tổng tiền: <span>100.490.000₫</span></p>
                                    <a href="#" class="button button-primary">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="footer">
            <div class="container footer-content">
               <div class="footer-copyright">
                    <p>&copy; 2025 TechShop. Đã đăng ký bản quyền.</p>
               </div>
            </div>
        </footer>
    </form>
</body>
</html>
