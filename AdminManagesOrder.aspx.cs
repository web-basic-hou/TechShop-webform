using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop
{
    public partial class AdminManagesOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // xử lý thay đổi trạng thái qua querystring nếu có
                HandleStatusChangeIfNeeded();

                LoadOrdersData();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        // Xử lý khi admin click link thay đổi trạng thái: ?setStatus=RECEIVED&orderId=123
        private void HandleStatusChangeIfNeeded()
        {
            var setStatus = Request.QueryString["setStatus"];
            var orderIdStr = Request.QueryString["orderId"];

            if (!string.IsNullOrEmpty(setStatus) && !string.IsNullOrEmpty(orderIdStr) && int.TryParse(orderIdStr, out int orderId))
            {
                var userProducts = Application["Orders"] as List<UserProducts> ?? new List<UserProducts>();

                var items = userProducts.Where(up => up.OrderId.HasValue && up.OrderId.Value == orderId).ToList();
                if (items.Any())
                {
                    // Cập nhật trạng thái cho tất cả items trong order
                    foreach (var it in items)
                    {
                        it.Status = setStatus;
                    }

                    Application["Orders"] = userProducts;
                }

                // Redirect để tránh thao tác lặp lại khi reload
                var cleanUrl = Request.Url.AbsolutePath;
                Response.Redirect(cleanUrl, true);
            }
        }

        private void LoadOrdersData()
        {
            var userProducts = Application["Orders"] as List<UserProducts> ?? new List<UserProducts>();

            // Lấy các orders có OrderId (bỏ qua các mục CART chưa thành đơn)
            var ordersGrouped = userProducts
                                .Where(up => up.OrderId.HasValue)
                                .GroupBy(up => up.OrderId.Value)
                                .OrderByDescending(g => g.Max(it => it.CreatedAt)) // mới nhất trước
                                .ToList();

            var sb = new StringBuilder();

            if (!ordersGrouped.Any())
            {
                sb.Append("<tr class=\"table-row\">");
                sb.Append("<td colspan=\"6\" style=\"text-align:center;padding:20px;\">Không có đơn hàng nào.</td>");
                sb.Append("</tr>");
            }
            else
            {
                foreach (var group in ordersGrouped)
                {
                    var orderId = group.Key;
                    // Lấy thông tin khách hàng từ userId của item đầu tiên
                    var firstItem = group.First();
                    var customerId = firstItem.userId;
                    var createdAt = group.Min(it => it.CreatedAt); // ngày đặt = earliest item time
                    var total = group.Sum(it => it.total);

                    // Lấy tên khách nếu có lưu trong Application["Users"] (cố gắng dò các property phổ biến)
                    var customerName = GetUserDisplayName(customerId) ?? $"User #{customerId}";

                    // Trạng thái: nếu tất cả cùng trạng thái thì hiển thị, ngược lại hiển thị tổng quát
                    var distinctStatuses = group.Select(it => it.Status).Where(s => !string.IsNullOrEmpty(s)).Distinct().ToList();
                    string statusText;
                    string statusClass;
                    if (distinctStatuses.Count == 0)
                    {
                        statusText = "Chưa cập nhật";
                        statusClass = "status-badge status-slate";
                    }
                    else if (distinctStatuses.Count == 1)
                    {
                        statusText = MapStatusToLabel(distinctStatuses[0]);
                        statusClass = MapStatusToClass(distinctStatuses[0]);
                    }
                    else
                    {
                        // nhiều trạng thái khác nhau trong 1 order
                        statusText = "Trạng thái hỗn hợp";
                        statusClass = "status-badge status-yellow";
                    }

                    var orderCode = $"#TECH{orderId}";
                    var viewUrl = $"/AdminOrderDetails.aspx?id={orderId}";

                    // action links để đổi trạng thái (ví dụ mark as DELIVERY hoặc RECEIVED)
                    var setDeliveryUrl = $"AdminManagesOrder.aspx?setStatus=DELIVERY&orderId={orderId}";
                    var setReceivedUrl = $"AdminManagesOrder.aspx?setStatus=RECEIVED&orderId={orderId}";
                    var setCancelledUrl = $"AdminManagesOrder.aspx?setStatus=CANCELLED&orderId={orderId}";

                    sb.Append("<tr class=\"table-row\">");

                    sb.AppendFormat("<th class=\"order-id\" scope=\"row\">{0}</th>", HttpUtility.HtmlEncode(orderCode));
                    sb.AppendFormat("<td class=\"customer-name\">{0}</td>", HttpUtility.HtmlEncode(customerName));
                    sb.AppendFormat("<td class=\"order-date\">{0}</td>", HttpUtility.HtmlEncode(createdAt.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)));
                    sb.AppendFormat("<td class=\"order-total\">{0}</td>", HttpUtility.HtmlEncode(total.ToString("N0") + "₫"));
                    sb.AppendFormat("<td><span class=\"{0}\">{1}</span></td>", statusClass, HttpUtility.HtmlEncode(statusText));

                    sb.Append("<td>");
                    // Thêm link Xem chi tiết
                    sb.AppendFormat("<a href=\"{0}\" class=\"action-link\">Xem</a> &nbsp;|&nbsp; ", viewUrl);

                    // Tùy theo trạng thái hiện tại, hiển thị các action phù hợp
                    if (distinctStatuses.Count == 1 && distinctStatuses[0] == "CART")
                    {
                        // chuyển sang xử lý / giao
                        sb.AppendFormat("<a href=\"{0}\" class=\"action-link\">Đặt xử lý</a> &nbsp;|&nbsp; ", setDeliveryUrl);
                    }
                    else if (distinctStatuses.Count == 1 && distinctStatuses[0] == "DELIVERY")
                    {
                        sb.AppendFormat("<a href=\"{0}\" class=\"action-link\">Đánh dấu đã nhận</a> &nbsp;|&nbsp; ", setReceivedUrl);
                    }
                    else if (distinctStatuses.Count == 1 && distinctStatuses[0] == "RECEIVED")
                    {
                        sb.AppendFormat("<span class=\"action-link\" style=\"opacity:0.6\">Đã nhận</span> &nbsp;|&nbsp; ");
                    }

                    // luôn cho phép hủy
                    sb.AppendFormat("<a href=\"{0}\" class=\"action-link\" onclick=\"return confirm('Xác nhận hủy đơn {1}?');\">Hủy</a>", setCancelledUrl, HttpUtility.HtmlEncode(orderCode));

                    sb.Append("</td>");

                    sb.Append("</tr>");
                }
            }

            ltOrdersRows.Text = sb.ToString();
        }

        private string MapStatusToLabel(string status)
        {
            if (string.IsNullOrEmpty(status)) return "Chưa cập nhật";
            switch (status.ToUpperInvariant())
            {
                case "CART": return "Chờ xử lý";
                case "DELIVERY": return "Đang giao";
                case "RECEIVED": return "Đã giao / Đã nhận";
                case "CANCELLED": return "Đã hủy";
                default: return status;
            }
        }

        // Helper: map trạng thái -> css class (phù hợp với CSS bạn có: status-green, status-yellow,...)
        private string MapStatusToClass(string status)
        {
            if (string.IsNullOrEmpty(status)) return "status-badge status-slate";
            switch (status.ToUpperInvariant())
            {
                case "CART": return "status-badge status-yellow";
                case "DELIVERY": return "status-badge status-sky";
                case "RECEIVED": return "status-badge status-green";
                case "CANCELLED": return "status-badge status-red";
                default: return "status-badge status-slate";
            }
        }

        // Cố gắng lấy tên user nếu Application["Users"] tồn tại và chứa object có id + tên
        private string GetUserDisplayName(int userId)
        {
            try
            {
                var usersObj = Application["Users"];
                if (usersObj == null) return null;

                var usersEnumerable = usersObj as System.Collections.IEnumerable;
                if (usersEnumerable == null) return null;

                foreach (var u in usersEnumerable)
                {
                    if (u == null) continue;
                    var type = u.GetType();

                    // Tìm thuộc tính id / Id / userId
                    var idProp = type.GetProperty("id") ?? type.GetProperty("Id") ?? type.GetProperty("userId") ?? type.GetProperty("UserId");
                    if (idProp == null) continue;

                    var idValObj = idProp.GetValue(u);
                    if (idValObj == null) continue;
                    int idVal;
                    try { idVal = Convert.ToInt32(idValObj); } catch { continue; }

                    if (idVal == userId)
                    {
                        // tìm tên
                        var nameProp = type.GetProperty("fullName") ?? type.GetProperty("FullName")
                                       ?? type.GetProperty("name") ?? type.GetProperty("Name")
                                       ?? type.GetProperty("username") ?? type.GetProperty("Username");
                        if (nameProp != null)
                        {
                            var nameObj = nameProp.GetValue(u);
                            if (nameObj != null)
                            {
                                return nameObj.ToString();
                            }
                        }

                        // fallback: nếu không có tên, return Id as string
                        return $"User #{userId}";
                    }
                }
            }
            catch
            {
                // ignore
            }
            return null;
        }
    }
}
