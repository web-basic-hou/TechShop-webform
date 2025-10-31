using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop
{
    public partial class AdminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Xử lý nếu có yêu cầu xóa qua querystring ?deleteId=...
                HandleDeleteIfNeeded();

                btnAddProduct.Click += btnAddProduct_Click;
                LoadDashboardData();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddOrEditProduct.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        private void HandleDeleteIfNeeded()
        {
            var deleteIdStr = Request.QueryString["deleteId"];
            if (!string.IsNullOrEmpty(deleteIdStr))
            {
                if (int.TryParse(deleteIdStr, out int deleteId))
                {
                    var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();
                    var toRemove = products.FirstOrDefault(p => p.id == deleteId);
                    if (toRemove != null)
                    {
                        products.Remove(toRemove);
                        Application["Products"] = products;
                    }
                }

                // Redirect về lại trang để tránh xóa lặp lại khi reload
                var cleanUrl = Request.Url.AbsolutePath;
                Response.Redirect(cleanUrl, true);
            }
        }

        private void LoadDashboardData()
        {
            var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();

            var sb = new StringBuilder();

            if (products.Count == 0)
            {
                sb.Append("<tr class=\"table-row\">");
                sb.Append("<td colspan=\"6\" style=\"text-align:center;padding:20px;\">Không có sản phẩm nào.</td>");
                sb.Append("</tr>");
            }
            else
            {
                foreach (var p in products)
                {
                    // An toàn khi render
                    var id = p.id;
                    var name = HttpUtility.HtmlEncode(p.productName ?? "Không tên");
                    var imageUrl = HttpUtility.HtmlEncode(string.IsNullOrWhiteSpace(p.imageUrl) ? "https://placehold.co/80x80/e2e8f0/334155?text=SP" : p.imageUrl);
                    decimal priceDec;
                    try { priceDec = Convert.ToDecimal(p.value); } catch { priceDec = 0m; }
                    var priceText = priceDec.ToString("N0") + "₫";

                    // capacity => tồn kho hiện có
                    var stock = p.capacity;
                    // quantity => có thể là số đã bán hoặc số lượng trong giỏ; ta hiển thị chung
                    var qty = p.quantity;

                    // Trạng thái
                    var statusText = stock > 0 ? "Đang bán" : "Hết hàng";
                    var statusClass = stock > 0 ? "status-badge status-green font-size: 12px" : "font-size: 12px status-badge status-slate";

                    // Mô tả ngắn để hiển thị nhỏ dưới tên (cắt 100 ký tự)
                    var descRaw = p.describe ?? "";
                    var descShort = descRaw.Length > 100 ? descRaw.Substring(0, 100) + "..." : descRaw;
                    descShort = HttpUtility.HtmlEncode(descShort);

                    // Số đánh giá
                    var rateCount = p.rateList != null ? p.rateList.Count : 0;

                    var editUrl = $"AddOrEditProduct.aspx?id={id}";
                    var deleteUrl = $"AdminProduct.aspx?deleteId={id}";

                    sb.Append("<tr class=\"table-row\" data-id=\"" + id + "\">");

                    sb.AppendFormat("<td><img src=\"{0}\" class=\"product-image\" alt=\"{1}\" /></td>", imageUrl, name);

                    sb.Append("<th scope=\"row\" class=\"product-name\">");
                    sb.AppendFormat("<div class=\"product-name-main\">{0}</div>", name);
                    sb.AppendFormat("<div class=\"product-meta\" style=\"font-size:0.85rem;color:#6b7280;margin-top:6px;\">{0}</div>", descShort);
                    sb.AppendFormat("<div class=\"product-stats\" style=\"font-size:0.8rem;color:#9ca3af;margin-top:6px;\">Đã bán: {0} &nbsp;|&nbsp; Đánh giá: {1}</div>", qty, rateCount);
                    sb.Append("</th>");

                    sb.AppendFormat("<td class=\"product-price\">{0}</td>", HttpUtility.HtmlEncode(priceText));
                    sb.AppendFormat("<td>{0}</td>", stock);
                    sb.AppendFormat("<td><span class=\"{0}\">{1}</span></td>", statusClass, statusText);

                    sb.Append("<td class=\"actions-cell\"><div class=\"actions-group\">");
                    sb.AppendFormat("<a href=\"{0}\" class=\"action-link action-edit\">Sửa</a>", editUrl);
                    sb.AppendFormat("<a href=\"{0}\" class=\"action-link action-delete\" onclick=\"return confirm('Xác nhận xóa sản phẩm này?');\">Xóa</a>", deleteUrl);
                    sb.Append("</div></td>");

                    sb.Append("</tr>");
                }
            }

            ltProductsRows.Text = sb.ToString();
        }
    }
}
