using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class DetailProduct : System.Web.UI.Page {
        private const string CartSessionKey = "UserCart";
        protected TechShop.App_Code.Models.Products productDetail;

        protected void Page_Load(object sender, EventArgs e) {

            LoadProductDetail();
        }

        private void LoadProductDetail() {
            string idStr = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idStr)) {
                Response.Redirect("Products.aspx");
                return;
            }

            if (!int.TryParse(idStr, out int id)) {
                Response.Redirect("Products.aspx");
                return;
            }

            var products = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            if (products == null) {
                Response.Write("<script>alert('Danh sách sp trống!');</script>");
                return;
            }

            productDetail = products.FirstOrDefault(p => p.id == id);
            if (productDetail == null) {
                Response.Write("<script>alert('Không tìm thấy sản phẩm!'); window.location='Products.aspx';</script>");
                return;
            }

            lblProductName.Text = productDetail.productName;
            lblProductPrice.Text = $"{productDetail.value:N0} vnđ";
            lblProductColor.Text = productDetail.color;
            lblProductCapacity.Text = $"{productDetail.capacity} GB";
            lblProductDesc.Text = productDetail.describe;
            lblProductSpec.Text = productDetail.specification;
            imgProduct.ImageUrl = ResolveUrl(productDetail.imageUrl);

            var relatedProducts = products
                .Where(p => (p.color == productDetail.color || p.capacity == productDetail.capacity) && p.id != productDetail.id)
                .Take(4)
                .ToList();

            rptRelatedProducts.DataSource = relatedProducts;
            rptRelatedProducts.DataBind();
        }

        private List<CartItemViewModel> GetCart() {
            if (Session[CartSessionKey] == null)
                Session[CartSessionKey] = new List<CartItemViewModel>();
            return (List<CartItemViewModel>)Session[CartSessionKey];
        }

        private void SaveCart(List<CartItemViewModel> cart) {
            Session[CartSessionKey] = cart;
        }

        protected void btnAddToCart_Click(object sender, EventArgs e) {
            var cart = GetCart();

            var existing = cart.FirstOrDefault(i => i.productId == productDetail.id);

            if (existing != null) {
                lblAddCartMsg.Text = "Sản phẩm này đã có trong giỏ hàng!";
                lblAddCartMsg.ForeColor = System.Drawing.Color.OrangeRed;
            }
            else {
                cart.Add(new CartItemViewModel {
                    productId = productDetail.id,
                    productName = productDetail.productName,
                    price = (decimal)productDetail.value,
                    productImage = productDetail.imageUrl,
                    quantity = 1
                });

                SaveCart(cart);
            }
        }

        protected void btnBuyNow_Click(object sender, EventArgs e) {
            btnAddToCart_Click(sender, e);
            Response.Redirect("Pay.aspx");
        }
    }
}