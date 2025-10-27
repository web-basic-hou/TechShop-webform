using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechShop {
    public partial class DetailProduct : System.Web.UI.Page {
        protected TechShop.App_Code.Models.Products productDetail;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                LoadProductDetail();
            }
        }

        private void LoadProductDetail() {
            string idStr = Request.QueryString["id"];
            if (string.IsNullOrEmpty(idStr)) {
                Response.Redirect("Products.aspx");
                return;
            }

            int id;
            if (!int.TryParse(idStr, out id)) {
                Response.Redirect("Products.aspx");
                return;
            }

            var products = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            if (products == null) {
                Response.Write("<script>alert('Danh sách sản phẩm trống!');</script>");
                return;
            }

            productDetail = products.FirstOrDefault(p => p.id == id);
            if (productDetail == null) {
                Response.Write("<script>alert('Không tìm thấy sản phẩm!'); window.location='Products.aspx';</script>");
                return;
            }

            lblProductName.Text = productDetail.productName;
            lblProductPrice.Text = productDetail.value;
            lblProductColor.Text = productDetail.color;
            lblProductCapacity.Text = productDetail.capacity.ToString() + "GB";
            lblProductDesc.Text = productDetail.describe;
            lblProductSpec.Text = productDetail.specification;
            imgProduct.ImageUrl = ResolveUrl(productDetail.imageUrl);

            var relatedProducts = products
                .Where(p => p.color == productDetail.color && p.id != productDetail.id)
                .Take(4) 
                .ToList();

            rptRelatedProducts.DataSource = relatedProducts;
            rptRelatedProducts.DataBind();
        }
    }
}