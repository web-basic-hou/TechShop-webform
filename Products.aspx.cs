using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace TechShop {
    public partial class Products : System.Web.UI.Page {
        private const int PageSize = 6;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                LoadProducts(1);
            }
        }

        private List<TechShop.App_Code.Models.Products> GetFilteredProducts() {
            string keyword = txtSearch.Text.Trim().ToLower();
            var allProducts = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            if (allProducts == null || allProducts.Count == 0) return new List<TechShop.App_Code.Models.Products>();

            var filtered = allProducts.AsEnumerable();

            // Lọc theo từ khóa
            if (!string.IsNullOrEmpty(keyword)) {
                filtered = filtered.Where(p =>
                    !string.IsNullOrEmpty(p.productName) &&
                    p.productName.ToLower().Contains(keyword));
            }

            // Lọc theo giá
            if (!string.IsNullOrEmpty(rblPrice.SelectedValue)) {
                string[] range = rblPrice.SelectedValue.Split('-');
                if (float.TryParse(range[0], NumberStyles.Any, CultureInfo.InvariantCulture, out float min) &&
                    float.TryParse(range[1], NumberStyles.Any, CultureInfo.InvariantCulture, out float max)) {
                    filtered = filtered.Where(p => p.value >= min && p.value <= max);
                }
            }

            return filtered.ToList();
        }

        private void LoadProducts(int pageIndex) {
            var filteredProducts = GetFilteredProducts();

            if (filteredProducts.Count == 0) {
                rptProducts.DataSource = null;
                rptProducts.DataBind();
                btnPrev.Enabled = false;
                btnNext.Enabled = false;
                return;
            }

            int totalPages = (int)Math.Ceiling((double)filteredProducts.Count / PageSize);

            if (pageIndex < 1) pageIndex = 1;
            if (pageIndex > totalPages) pageIndex = totalPages;

            var pagedProducts = filteredProducts
                .Skip((pageIndex - 1) * PageSize)
                .Take(PageSize)
                .ToList();

            rptProducts.DataSource = pagedProducts;
            rptProducts.DataBind();

            ViewState["CurrentPage"] = pageIndex;
            ViewState["TotalPages"] = totalPages;

            btnPrev.Enabled = pageIndex > 1;
            btnNext.Enabled = pageIndex < totalPages;
        }

        protected void btnPrev_Click(object sender, EventArgs e) {
            int currentPage = (int)(ViewState["CurrentPage"] ?? 1);
            LoadProducts(currentPage - 1);
        }

        protected void btnNext_Click(object sender, EventArgs e) {
            int currentPage = (int)(ViewState["CurrentPage"] ?? 1);
            LoadProducts(currentPage + 1);
        }

        protected void btnSearch_Click(object sender, EventArgs e) {
            LoadProducts(1); // Khi search, luôn load từ trang đầu tiên
        }

        protected void rblPrice_SelectedIndexChanged(object sender, EventArgs e) {
            LoadProducts(1); // Khi chọn giá, load từ trang đầu tiên
        }

        protected void btnReset_Click(object sender, EventArgs e) {
            txtSearch.Text = "";
            rblPrice.ClearSelection();
            LoadProducts(1);
        }
    }
}
