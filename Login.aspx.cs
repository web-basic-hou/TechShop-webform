using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                ReloadForm();
            }
        }

        protected void Login_click(object sender, EventArgs e) {
            lblErrorEmail.Text = "";
            lblErrorPassword.Text = "";

            if (string.IsNullOrWhiteSpace(txtEmail.Text)) {
                lblErrorEmail.Text = "Vui lòng nhập tên đăng nhập";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPassword.Text)) {
                lblErrorPassword.Text = "Mật khẩu không được để trống";
                return;
            }

            List<Users> userList = Application.Get("users") as List<Users>;
            if (userList == null) {
                lblErrorEmail.Text = "Không tìm thấy danh sách người dùng!";
                return;
            }

            Users foundUser = userList.FirstOrDefault(u => 
                u.username == txtEmail.Text && u.password == txtPassword.Text);

            if (foundUser == null) {
                lblErrorEmail.Text = "Tên đăng nhập hoặc mật khẩu sai";
                return;
            }

            Session["email"] = foundUser.username;
            Session["role"] = foundUser.role;

            if (foundUser.role.Equals("admin", StringComparison.OrdinalIgnoreCase))
                Response.Redirect("AdminDashboard.aspx");
            else
                Response.Redirect("Home.aspx");
        }
        protected void ReloadForm() {
            txtEmail.Text = "";
            txtPassword.Text = "";
            lblErrorEmail.Text = "";
            lblErrorPassword.Text = "";
        }
    }
}