using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechShop.App_Code.Models;

namespace TechShop {
    public partial class Cart : System.Web.UI.Page {
        private const string CartSessionKey = "UserCart";

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                Users currentUser = GetCurrentUser();

                if (currentUser == null)
                    Response.Redirect("Login.aspx");

                LoadCart();
            }
        }

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

        private void LoadCart() {
            var cart = GetCart();
            gvCart.DataSource = cart;
            gvCart.DataBind();
            lblTotalTemp.Text = $"{cart.Sum(i => i.total):N0} vnđ";
            lblTotal.Text = $"{cart.Sum(i => i.total):N0} vnđ";
        }

        private List<CartItemViewModel> GetCart() {
            if (Session[CartSessionKey] == null)
                Session[CartSessionKey] = new List<CartItemViewModel>();
            return (List<CartItemViewModel>)Session[CartSessionKey];
        }

        private void SaveCart(List<CartItemViewModel> cart) {
            Session[CartSessionKey] = cart;
        }

        public static void AddItemToCart(int productId, string productName, decimal price, string productImage = "") {
            var context = HttpContext.Current;
            var cart = (List<CartItemViewModel>)context.Session[CartSessionKey] ?? new List<CartItemViewModel>();
            var existingItem = cart.FirstOrDefault(i => i.productId == productId);

            if (existingItem != null) {
                existingItem.quantity++;
            }
            else {
                cart.Add(new CartItemViewModel {
                    productId = productId,
                    productName = productName,
                    price = price,
                    productImage = productImage,
                    quantity = 1
                });
            }

            context.Session[CartSessionKey] = cart;
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "Remove") {
                int productId = Convert.ToInt32(e.CommandArgument);
                var cart = GetCart();
                var itemToRemove = cart.FirstOrDefault(i => i.productId == productId);
                if (itemToRemove != null) {
                    cart.Remove(itemToRemove);
                    SaveCart(cart);
                }

                LoadCart();
            }
        }
    }
}