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
                lblErrorEmail.Text = "vui lòng nhập tên đăng nhập";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPassword.Text)) {
                lblErrorPassword.Text = "mật khẩu k đc để trống";
                return;
            }
            TechShop.App_Code.Models.Users user = new TechShop.App_Code.Models.Users();
            List<Users> userList = new List<Users>();

            if (Application.Get("users") != null)
                userList = (List<Users>)Application.Get("users");
            bool found = false;
            for (int i = 0; i < userList.Count; ++i) {
                if (userList[i].username == txtEmail.Text) {
                    user = userList[i];
                    found = true;
                    break;
                }
            }

            if (!found) {
                lblErrorEmail.Text = "tên đăng nhập hoặc mk sai";
                return;
            }

            Session.Add("username", user.username);

            if (user.role.Equals("admin")) {
                Response.Redirect("AdminDashboard.aspx");
            }else 
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