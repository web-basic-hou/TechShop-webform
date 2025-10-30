using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class User : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                Users currentUser = GetCurrentUser();
                lblErrorChangePassword.Text = "";

                if (currentUser == null)
                    Response.Redirect("Login.aspx");

                LoadUser(currentUser);
            }
        }

        // Lấy user hiện tại từ session + Application
        protected Users GetCurrentUser() {
            List<Users> userList = (List<Users>)Application["users"];
            if (Session["email"] == null) {
                Response.Redirect("Login.aspx");
            }
            string email = Session["email"].ToString();

            Users user = userList.FirstOrDefault(u => u.username == email);
            if (user == null)
                Response.Redirect("Login.aspx");

            return user;
        }

        // Load dữ liệu vào form
        protected void LoadUser(Users user) {
            full_name.Text = user.fullname;
            email.Text = user.username;
            phone.Text = user.telephone;
            address.Text = user.address;
            city.Text = user.city;
            district.Text = user.district;
            ward.Text = user.ward;
            postal_code.Text = user.postCode;
        }

        // Lưu thông tin họ tên + điện thoại
        protected void btnSaveChanges_Click(object sender, EventArgs e) {
            List<Users> userList = (List<Users>)Application["users"];
            string email = Session["email"].ToString();

            Users currentUser = userList.FirstOrDefault(u => u.username == email);
            if (currentUser != null) {
                currentUser.fullname = full_name.Text.Trim();
                currentUser.telephone = phone.Text.Trim();

                Application["users"] = userList;
                LoadUser(currentUser); 
            }
        }

        // Lưu thông tin địa chỉ
        protected void btnSaveAddress_Click(object sender, EventArgs e) {
            List<Users> userList = (List<Users>)Application["users"];
            string email = Session["email"].ToString();

            Users currentUser = userList.FirstOrDefault(u => u.username == email);
            if (currentUser != null) {
                currentUser.address = address.Text.Trim();
                currentUser.city = city.Text.Trim();
                currentUser.district = district.Text.Trim();
                currentUser.ward = ward.Text.Trim();
                currentUser.postCode = postal_code.Text.Trim();

                Application["users"] = userList;
                LoadUser(currentUser);
            }
        }

        // Đổi mật khẩu
        protected void btnChangePassword_Click(object sender, EventArgs e) {
            lblErrorChangePassword.Text = "";

            if (Application["users"] == null) {
                lblErrorChangePassword.Text = "Không tìm thấy danh sách người dùng.";
                return;
            }

            List<Users> userList = (List<Users>)Application["users"];

            if (Session["email"] == null) {
                lblErrorChangePassword.Text = "Phiên đăng nhập đã hết hạn.";
                return;
            }

            string email = Session["email"].ToString();

            Users currentUser = userList.FirstOrDefault(u => u.username == email);
            if (currentUser == null) {
                lblErrorChangePassword.Text = "Không tìm thấy tài khoản.";
                return;
            }

            string currentPass = current_password.Text.Trim();
            string newPass = new_password.Text.Trim();
            string confirmPass = confirm_password.Text.Trim();

            if (currentPass != currentUser.password) {
                lblErrorChangePassword.Text = "Mật khẩu hiện tại không đúng.";
                return;
            }

            if (newPass.Length < 8) {
                lblErrorChangePassword.Text = "Mật khẩu phải có 8 kí tự";
                return;
            }

            if (newPass != confirmPass) {
                lblErrorChangePassword.Text = "Mật khẩu nhập lại không khớp.";
                return;
            }

            currentUser.password = newPass;

            Application.Lock();
            Application["users"] = userList;
            Application.UnLock();

            lblErrorChangePassword.ForeColor = System.Drawing.Color.Green;
            lblErrorChangePassword.Text = "Đổi mật khẩu thành công!";
        }

        protected void Button1_Click(object sender, EventArgs e) {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
