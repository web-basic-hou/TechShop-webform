using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class AdminDashboard : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData() {
            var orders = Application["Orders"] as List<UserProducts> ?? new List<UserProducts>();
            var users = Application["users"] as List<Users> ?? new List<Users>();
            var products = Application["Products"] as List<TechShop.App_Code.Models.Products> ?? new List<TechShop.App_Code.Models.Products>();

            decimal totalRevenue = orders
                .Where(o => o.Status == "RECEIVED")
                .Sum(o => o.total);

            int totalOrders = orders.Count;

            int totalCustomers = users.Count > 0 ? users.Count - 1 : 0;

            int totalProducts = products.Count;

            var recentOrders = orders
                .OrderByDescending(o => o.CreatedAt)
                .Take(3)
                .ToList();

            string htmlRecentOrders = "";
            foreach (var order in recentOrders) {
                string statusClass = "";
                string statusText = "";

                switch (order.Status) {
                    case "RECEIVED":
                        statusClass = "status-green";
                        statusText = "Đã giao";
                        break;
                    case "DELIVERY":
                        statusClass = "status-yellow";
                        statusText = "Đang giao";
                        break;
                    case "CANCELLED":
                        statusClass = "status-red";
                        statusText = "Đã hủy";
                        break;
                    default:
                        statusClass = "status-yellow";
                        statusText = "Đang xử lý";
                        break;
                }

                string customerName = GetUserName(order.userId);
                string orderDate = order.CreatedAt.ToString("dd/MM/yyyy");

                htmlRecentOrders += $@"
                    <tr class='table-row'>
                        <th scope='row' class='row-header'>#TECH{order.OrderId}</th>
                        <td>{customerName}</td>
                        <td>{orderDate}</td>
                        <td>{order.total:N0}₫</td>
                        <td><span class='status-badge {statusClass}'>{statusText}</span></td>
                    </tr>";
            }

            // 8️⃣ Gán giá trị lên giao diện (thông qua Literal hoặc trực tiếp Response)
            litTotalRevenue.Text = $"{totalRevenue:N0}₫";
            litTotalOrders.Text = totalOrders.ToString();
            litTotalCustomers.Text = totalCustomers.ToString();
            litTotalProducts.Text = totalProducts.ToString();
            litRecentOrders.Text = htmlRecentOrders;
        }

        private string GetUserName(int userId) {
            var users = Application["users"] as List<Users>;
            var user = users?.FirstOrDefault(u => u.id == userId);
            return user != null ? user.fullname : "Khách hàng";
        }
    }
}