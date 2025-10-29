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
                Users currentUser = getCurrentUser();

                if (currentUser == null) 
                    Response.Redirect("Login.aspx");

                loadUser(currentUser);
            }
        }

        protected Users getCurrentUser() {
            List<Users> userList = (List<Users>)Application.Get("users");

            if (Session["email"] == null) {
                Response.Redirect("Login.aspx");
            }
            string currentEmail = Session["email"].ToString();
            

            Users user = null;
            for (int i = 0; i < userList.Count; ++i) {
                if (currentEmail.Equals(userList[i].username)) {
                    user = userList[i];
                    break;
                }
            }
            if (user == null)
                Response.Redirect("Login.aspx");

            return user;
        }

        protected void loadUser(Users user) {
            full_name.Text = user.fullname;
            email.Text = user.username;
            phone.Text = user.telephone;
            address.Text = user.address;
            city.Text = user.city;
            district.Text = user.district;
            ward.Text = user.ward;
            postal_code.Text = user.postCode;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e) {
            List<Users> userList = (List<Users>)Application["users"];
            Users currentUser = getCurrentUser();

            if (currentUser != null) {
                currentUser.fullname = full_name.Text.Trim();
                currentUser.telephone = phone.Text.Trim();

                Application["users"] = userList; // cập nhật lại
                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Cập nhật thông tin thành công!');", true);
            }
        }

        protected void btnSaveAddress_Click(object sender, EventArgs e) {
            List<Users> userList = (List<Users>)Application["users"];
            Users currentUser = getCurrentUser();

            if (currentUser != null) {
                currentUser.address = address.Text.Trim();
                currentUser.city = city.Text.Trim();
                currentUser.district = district.Text.Trim();
                currentUser.ward = ward.Text.Trim();
                currentUser.postCode = postal_code.Text.Trim();

                Application["users"] = userList;

                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Lưu địa chỉ thành công!');", true);
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e) {
            List<Users> userList = (List<Users>)Application["users"];
            Users currentUser = getCurrentUser();

            if (currentUser != null) {
                string currentPass = current_password.Text.Trim();
                string newPass = new_password.Text.Trim();
                string confirmPass = confirm_password.Text.Trim();

                if (currentPass != currentUser.password) {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Mật khẩu hiện tại không đúng!');", true);
                    return;
                }

                if (newPass != confirmPass) {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Xác nhận mật khẩu không khớp!');", true);
                    return;
                }

                currentUser.password = newPass;
                Application["users"] = userList;

                ClientScript.RegisterStartupScript(this.GetType(), "alert",
                    "alert('Đổi mật khẩu thành công!');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}