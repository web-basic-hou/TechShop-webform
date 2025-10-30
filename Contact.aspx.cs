using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechShop {
    public partial class Contact : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            lblMessage.Text = "Phản hồi của bạn đã được gửi thành công!";

            contact_name.Text = "";
            contact_email.Text = "";
            contact_message.Text = "";
        }
    }
}