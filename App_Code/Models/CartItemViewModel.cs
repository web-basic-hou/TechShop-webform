using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class CartItemViewModel {
        public int productId { get; set; }
        public string productName { get; set; }
        public string productImage { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public decimal total => quantity * price;
    }
}