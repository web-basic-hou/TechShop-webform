using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                ReloadForm();
            }
        }

        protected void Register_click(object sender, EventArgs e) {
            if (string.IsNullOrWhiteSpace(txtFullName.Text)) {
                lblErrorFullName.Text = "tên ng dùng k đc trống";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text)) {
                lblErrorEmail.Text = "vui lòng nhập tên email";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPassword.Text) || txtPassword.Text.Length <= 8) {
                lblErrorPassword.Text = "mật khẩu phải có 8 chữ số";
                return;
            }

            if (!txtPassword.Text.Equals(txtConfirmPassword.Text)) {
                lblErrorConfirmPassword.Text = "mật khẩu nhập lại không đúng";
                return;
            }

            List<Users> userList = new List<Users>();

            if (Application.Get("users") != null)
                userList = (List<Users>)Application.Get("users");

            for (int i = 0; i < userList.Count; ++i) {
                if (userList[i].username == txtEmail.Text) {
                    lblErrorEmail.Text = "tài khoản đã được sử dụng";
                    return;
                }
            }

            int lastId = 0;
            if (userList.Count > 0) {
                for (int i = 0; i < userList.Count; ++i) {
                    lastId = userList[i].id;
                }
            }

            Users user = new Users {
                id = (lastId + 1),
                username = txtEmail.Text,
                password = txtPassword.Text,
                fullname = txtFullName.Text,
                telephone = null,
                address = null,
                city = null,
                district = null,
                ward = null,
                postCode = null,
                role = "user"
            };

            userList.Add(user);

            Application.Set("users", userList);

            Response.Redirect("/Login.aspx");
        }

        private void ReloadForm() {
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}