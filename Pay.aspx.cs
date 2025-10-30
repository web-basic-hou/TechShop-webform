using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class Pay : System.Web.UI.Page {
        private const string CartSessionKey = "UserCart";

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                LoadUserInfo();
                LoadCart();
            }
        }

        private void LoadUserInfo() {
            fullname.Text = "";
            phone.Text = "";
            email.Text = "";
            address.Text = "";

        }

        private void LoadCart() {
            var cart = Session[CartSessionKey] as List<CartItemViewModel>;
            if (cart == null || cart.Count == 0) {
                Response.Write("<script>alert('Giỏ hàng trống!'); window.location='Cart.aspx';</script>");
                return;
            }

            string html = "";
            decimal total = 0;

            foreach (var item in cart) {
                html += $@"
                    <div class='order-item'>
                        <div class='product-info'>
                            <img src='{ResolveUrl(item.productImage)}' alt='{item.productName}' class='product-image' />
                            <div>
                                <h3 class='product-name'>{item.productName}</h3>
                                <p class='product-quantity'>Số lượng: {item.quantity}</p>
                            </div>
                        </div>
                    </div>";
                total += item.price * item.quantity;
            }

            orderItemsLiteral.Text = html;
            lblTotal.Text = $"Tổng tiền hàng: {total:N0} vnđ";
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e) {
            Session[CartSessionKey] = null; // Xóa giỏ hàng

            Response.Write("<script>alert('Đặt hàng thành công! Cảm ơn bạn đã mua hàng tại TechShop.'); window.location='Home.aspx';</script>");
        }

        protected void cancel(object sender, EventArgs e) {
            Response.Redirect("Home.aspx");
        }
    }
}