using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using TechShop.App_Code.Models;

namespace TechShop
{
    public partial class AdminOrderDetails : Page
    {
        // Lấy id từ querystring: AdminOrderDetails.aspx?id=123
        protected int OrderId => int.TryParse(Request.QueryString["id"], out int v) ? v : 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (OrderId == 0)
                {
                    // nếu ko có id -> quay lại
                    Response.Redirect("AdminManagesOrder.aspx");
                    return;
                }

                LoadOrderFromApplication();
            }
        }

        private void LoadOrderFromApplication()
        {
            var all = Application["UserProducts"] as List<UserProducts>;
            if (all == null)
            {
                // không có dữ liệu -> redirect về manage
                Response.Redirect("AdminManagesOrder.aspx");
                return;
            }

            // Lấy tất cả item có OrderId == OrderId
            var items = all.Where(i => i.OrderId.HasValue && i.OrderId.Value == OrderId).ToList();

            if (items == null || items.Count == 0)
            {
                // không tìm thấy đơn
                Response.Redirect("AdminManagesOrder.aspx");
                return;
            }

            // Hiển thị metadata đơn
            litOrderId.Text = OrderId.ToString();
            litUserId.Text = items.First().userId.ToString();

            // Ngày đặt: lấy CreatedAt nhỏ nhất trong items (thường item được tạo cùng lúc)
            var orderDate = items.Min(i => i.CreatedAt);
            litOrderDate.Text = orderDate.ToString("dd/MM/yyyy HH:mm");

            litItemCount.Text = items.Count.ToString();

            // Trạng thái: gom distinct
            var statuses = items.Select(i => i.Status ?? "").Distinct().ToList();
            litStatuses.Text = string.Join(", ", statuses);

            // Tính tổng
            decimal subtotal = items.Sum(i => i.total);
            litSubtotal.Text = subtotal.ToString("N0") + " ₫";
            litTotal.Text = subtotal.ToString("N0") + " ₫"; // shipping = 0 mặc định

            // Bind repeater
            rptItems.DataSource = items;
            rptItems.DataBind();

            // Nếu tất cả items cùng trạng thái thì chọn mặc định dropdown
            if (statuses.Count == 1)
            {
                var s = statuses.First();
                var listItem = ddlStatus.Items.FindByValue(s);
                if (listItem != null)
                {
                    ddlStatus.ClearSelection();
                    listItem.Selected = true;
                }
                else
                {
                    // nếu status không có trong dropdown, thêm tạm
                    ddlStatus.Items.Add(new System.Web.UI.WebControls.ListItem(s, s));
                    ddlStatus.ClearSelection();
                    ddlStatus.Items.FindByValue(s).Selected = true;
                }
            }
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            var targetStatus = ddlStatus.SelectedValue;
            if (string.IsNullOrEmpty(targetStatus)) return;

            var all = Application["UserProducts"] as List<UserProducts>;
            if (all == null) return;

            // update an toàn
            try
            {
                Application.Lock();
                var itemsToUpdate = all.Where(i => i.OrderId.HasValue && i.OrderId.Value == OrderId).ToList();
                foreach (var it in itemsToUpdate)
                {
                    it.Status = targetStatus;
                }

                Application["UserProducts"] = all;
            }
            finally
            {
                Application.UnLock();
            }

            // reload hiển thị mới
            LoadOrderFromApplication();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminManagesOrder.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
