using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechShop {
    public partial class Home : System.Web.UI.Page {
        protected List<Products> topProducts = new List<Products>();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                var allProducts = Application["Products"] as List<Products>;
                if (allProducts != null) {
                    topProducts = allProducts.GetRange(0, Math.Min(4, allProducts.Count));
                }
                //else 
                    //Response.Write("<p>Không có sản phẩm nào</p>");

                rptProducts.DataSource = topProducts;
                rptProducts.DataBind();
            }
        }
    }
}