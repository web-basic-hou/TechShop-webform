using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class UserProduct : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                Users currentUser = GetCurrentUser();

                if (currentUser == null)
                    Response.Redirect("Login.aspx");

                LoadUserOrders();
            }
        }

        protected Users GetCurrentUser() {
            List<Users> userList = (List<Users>)Application["users"];
            if (Session["email"] == null) {
                Response.Redirect("Login.aspx");
            }
            string email = Session["email"].ToString();

            Users user = userList.FirstOrDefault(u => u.username == email);
            if (user == null)
                Response.Redirect("Login.aspx");

            return user;
        }

        private void LoadUserOrders() {
            // Lấy thông tin user hiện tại
            var currentUser = GetCurrentUser();
            if (currentUser == null) {
                Response.Write("<script>alert('Vui lòng đăng nhập để xem lịch sử đơn hàng!'); window.location='Login.aspx';</script>");
                return;
            }

            var allOrders = Application["Orders"] as List<UserProducts>;
            if (allOrders == null || allOrders.Count == 0) {
                orderListLiteral.Text = "<p>Chưa có đơn hàng nào.</p>";
                return;
            }

            // Lọc theo email hoặc userId
            var userOrders = allOrders
                .Where(o => o.userId == currentUser.id)
                .OrderByDescending(o => o.CreatedAt)
                .ToList();

            if (userOrders.Count == 0) {
                orderListLiteral.Text = "<p>Bạn chưa có đơn hàng nào.</p>";
                return;
            }

            // Render HTML đơn hàng
            string html = "";
            foreach (var order in userOrders) {
                string statusClass = "";
                string statusText = "";

                switch (order.Status) {
                    case "DELIVERY":
                        statusClass = "status-shipping";
                        statusText = "Đang giao";
                        break;
                    case "RECEIVED":
                        statusClass = "status-delivered";
                        statusText = "Đã giao";
                        break;
                    case "CANCELLED":
                        statusClass = "status-cancelled";
                        statusText = "Đã hủy";
                        break;
                    default:
                        statusClass = "status-shipping";
                        statusText = "Đang xử lý";
                        break;
                }

                html += $@"
                <div class='order-card'>
                    <div class='order-header'>
                        <span class='order-id'>Mã đơn hàng: #TECH{order.OrderId}</span>
                        <span class='status-badge {statusClass}'>{statusText}</span>
                    </div>
                    <div class='order-body'>
                        <div class='product-item'>
                            <img src='{ResolveUrl(GetProductImage(order.productId))}' alt='Product' class='product-image'>
                            <div class='product-details'>
                                <p class='product-name'>{GetProductName(order.productId)}</p>
                                <p class='product-info'>Số lượng: {order.quantity}</p>
                            </div>
                        </div>
                    </div>
                    <div class='order-footer'>
                        <p class='order-total'>Tổng tiền: <span>{order.total:N0}₫</span></p>
                        <a href='#' class='button button-primary'>Xem chi tiết</a>
                    </div>
                </div>";
            }

            orderListLiteral.Text = html;
        }

        private string GetProductName(int productId) {
            var products = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            var product = products?.FirstOrDefault(p => p.id == productId);
            return product != null ? product.productName : "Sản phẩm không xác định";
        }

        private string GetProductImage(int productId) {
            var products = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            var product = products?.FirstOrDefault(p => p.id == productId);
            return product != null ? product.imageUrl : "~/assets/images/placeholder.png";
        }
    }
}