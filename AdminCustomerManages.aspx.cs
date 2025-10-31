using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop
{
    public partial class AdminCustomerManages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HandleDeleteUserIfNeeded();
                LoadCustomersData();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        private void HandleDeleteUserIfNeeded()
        {
            var deleteUserIdStr = Request.QueryString["deleteUserId"];
            if (string.IsNullOrEmpty(deleteUserIdStr)) return;

            if (!int.TryParse(deleteUserIdStr, out int deleteUserId)) return;

            var users = Application["users"] as List<Users>;
            if (users == null) return;

            // tìm user
            var toRemove = users.FirstOrDefault(u => u != null && u.id == deleteUserId);
            if (toRemove == null) return;

            try
            {
                Application.Lock();
                users.Remove(toRemove);
                Application["users"] = users;
            }
            finally
            {
                Application.UnLock();
            }

            Response.Redirect(Request.Url.AbsolutePath, true);
        }

        private void LoadCustomersData()
        {
            var sb = new StringBuilder();

            var users = Application["users"] as List<Users>;
            if (users == null || users.Count == 0)
            {
                sb.Append("<tr class=\"table-row\"><td colspan=\"6\" style=\"text-align:center;padding:20px;\">Không có khách hàng nào.</td></tr>");
                ltCustomersRows.Text = sb.ToString();
                return;
            }

            // Lấy danh sách userProducts để tính tổng chi tiêu
            var userProducts = Application["UserProducts"] as List<UserProducts> ?? new List<UserProducts>();

            // Sắp xếp theo id giảm dần (hoặc theo fullname nếu muốn)
            var sortedUsers = users.OrderByDescending(u => u.id).ToList();

            foreach (var u in sortedUsers)
            {
                if (u == null) continue;

                var idVal = u.id;
                var name = string.IsNullOrWhiteSpace(u.fullname) ? $"User #{idVal}" : u.fullname;
                var email = string.IsNullOrWhiteSpace(u.username) ? "-" : u.username;
                var phone = string.IsNullOrWhiteSpace(u.telephone) ? "-" : u.telephone;
                // nếu bạn có CreatedAt trong Users, thay đổi ở đây; hiện class Users không có -> hiển thị '-'
                var createdText = "-";

                // avatar fallback (không có trường avatar trong Users provided) -> dùng placeholder
                var avatar = "https://placehold.co/100x100/d1d5db/6b7280?text=U";

                // Tính tổng chi tiêu: tất cả UserProducts có userId == idVal, có OrderId và không bị CANCELLED
                decimal totalSpent = 0m;
                try
                {
                    totalSpent = userProducts
                        .Where(up => up.userId == idVal && up.OrderId.HasValue && !string.Equals(up.Status, "CANCELLED", StringComparison.OrdinalIgnoreCase))
                        .Sum(up => up.total);
                }
                catch
                {
                    totalSpent = 0m;
                }

                var totalText = totalSpent > 0 ? totalSpent.ToString("N0") + "₫" : "0₫";

                var viewUrl = $"AdminCustomerDetail.aspx?userId={idVal}";
                var deleteUrl = $"AdminCustomerManages.aspx?deleteUserId={idVal}";

                sb.Append("<tr class=\"table-row\">");

                sb.Append("<th scope=\"row\" class=\"customer-info\">");
                sb.AppendFormat("<img class=\"customer-avatar\" src=\"{0}\" alt=\"{1}\" />", HttpUtility.HtmlEncode(avatar), HttpUtility.HtmlEncode(name));
                sb.AppendFormat("<span class=\"customer-name\">{0}</span>", HttpUtility.HtmlEncode(name));
                sb.Append("</th>");

                sb.AppendFormat("<td class=\"customer-email\">{0}</td>", HttpUtility.HtmlEncode(email));
                sb.AppendFormat("<td class=\"customer-phone\">{0}</td>", HttpUtility.HtmlEncode(phone));
                sb.AppendFormat("<td class=\"customer-joined\">{0}</td>", HttpUtility.HtmlEncode(createdText));
                sb.AppendFormat("<td class=\"total-spent\">{0}</td>", HttpUtility.HtmlEncode(totalText));

                sb.Append("<td>");
                sb.AppendFormat("<a href=\"{0}\" class=\"action-link\" onclick=\"return confirm('Xác nhận xóa khách hàng {1}?');\">Xóa</a>", deleteUrl, HttpUtility.HtmlEncode(name));
                sb.Append("</td>");

                sb.Append("</tr>");
            }

            ltCustomersRows.Text = sb.ToString();
        }
    }
}
