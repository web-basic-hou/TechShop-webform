using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechShop {
    public partial class AdminProduct : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack)
            {
                btnAddProduct.Click += btnAddProduct_Click;
            }
        }

        protected void btnAddProduct_Click (object sender, EventArgs e)
        {
            Response.Redirect("AdminAddProduct.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e) {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}