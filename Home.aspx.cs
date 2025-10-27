using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class Home : System.Web.UI.Page {
        protected List<TechShop.App_Code.Models.Products> topProducts = new List<TechShop.App_Code.Models.Products>();
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                var allProducts = (List <TechShop.App_Code.Models.Products>) Application["Products"];
                if (allProducts != null) {
                    topProducts.Add(allProducts[0]);
                    topProducts.Add(allProducts[1]);
                    topProducts.Add(allProducts[2]);
                    topProducts.Add(allProducts[3]);
                }
                //else 
                    //Response.Write("<p>Không có sản phẩm nào</p>");

                rptProducts.DataSource = topProducts;
                rptProducts.DataBind();
            }
        }
    }
}