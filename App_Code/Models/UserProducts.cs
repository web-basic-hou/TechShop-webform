using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechShop.App_Code.Models {
    public class UserProducts {
        public int id { get; set; }

        public int userId { get; set; }

        public int productId { get; set; }

        public int quantity { get; set; }

        public decimal priceAtPurchase { get; set; }

        public decimal total => quantity * priceAtPurchase;

        public string Status { get; set; }  // "CART", "DELIVERY", "RECEIVED"

        public DateTime CreatedAt { get; set; }
        public int? OrderId { get; set; }
    }
}