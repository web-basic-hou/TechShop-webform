using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechShop {
    public partial class Products : System.Web.UI.Page {
        private const int PageSize = 6;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                LoadProducts(1);
            }
        }

        private void LoadProducts(int pageIndex) {
            var allProducts = Application["Products"] as List<TechShop.App_Code.Models.Products>;
            if (allProducts == null || allProducts.Count == 0) return;

            int totalPages = (int)Math.Ceiling((double)allProducts.Count / PageSize);

            if (pageIndex < 1) pageIndex = 1;
            if (pageIndex > totalPages) pageIndex = totalPages;

            var pagedProducts = allProducts
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
    }
}